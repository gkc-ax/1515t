USING AxUnit;
USING ns1;

NAMESPACE Test1
    {TestFixture}
    CLASS MyTestFixture
        VAR
            cal: MyClass;
            END_VAR
            {Test(1,2,'+',1)}
            {Test(2,1,'-',1)}
            {Test(2,0,'/',2)}
        METHOD PUBLIC MyTestMethod
            VAR_INPUT
                value1: INT;
                value2: INT;
                operator:CHAR;
                ret:int;
            END_VAR
            Assert.Equal(actual:=cal.Math(a:=value1,b:=value2,operator:=operator), expected:=ret);
        END_METHOD
    END_CLASS
END_NAMESPACE