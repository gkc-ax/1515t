echo off

echo Creating server_cert_ext config to set CA (Certificate Authority) parameter to false
(
echo basicConstraints = CA:FALSE
echo keyUsage=critical, digitalSignature, nonRepudiation, keyCertSign, keyEncipherment, dataEncipherment
echo extendedKeyUsage=serverAuth ,clientAuth
)> server_cert_ext.cnf

echo Step1 of PKCS12 file creation STARTED: generating private key
openssl genrsa -out privateKey.pem 2048
echo Step1 of PKCS12 file creation COMPLETED: privateKey.pem is generated

echo Step2 of PKCS12 file creation STARTED: generating certificate request
openssl req -new -key privateKey.pem -out server.csr -subj "/C=XX/ST=StateName/L=CityName/O=CompanyName/OU=CompanySectionName/CN=CommonNameOrHostname"
echo Step2 of PKCS12 file creation COMPLETED : server.csr is generated

echo Step3 of PKCS12 file creation STARTED: generating end-entity certificate
openssl x509 -req -in server.csr -signkey privateKey.pem -out server.cert.pem -days 3650 -sha256 -extfile server_cert_ext.cnf
echo Step3 of PKCS12 file creation COMPLETED: generating end-entity certificate

echo Step4 of PKCS12 file creation STARTED: export certificate in pkcs12 format
openssl pkcs12 -export -in server.cert.pem -inkey privateKey.pem -out PlcCertificate.p12
echo Step4 of PKCS12 file creation COMPLETED: export certificate in pkcs12 format


echo Certificate with public key creation STARTED
openssl pkcs12 -in PlcCertificate.p12 -out PlcCertificatePublic.crt -nokeys
echo Certificate with public key creation COMPLETED

echo Deleting temporary files STARTED
del privateKey.pem
del server.cert.pem
del server.csr
del server_cert_ext.cnf
echo Deleting temporary files COMPLETED