USING Siemens.Simatic.S71500.Communication.OUC;

NAMESPACE Tcp

    CLASS OUC
        VAR PRIVATE
            connecting : Connect;
            disconnecting : Disconnect;
            sending : TcpSend;            
            receiving : TcpReceive;
        END_VAR
        VAR PUBLIC
            config : ConnectionConfiguration := (Interfaceid := UINT#64, RemoteAddress := [BYTE#192, BYTE#168, BYTE#200, BYTE#19]);
            connected : BOOL;
        END_VAR

        METHOD PUBLIC connect : BOOL
            VAR_OUTPUT
                error : BOOL;
                status : WORD;
            END_VAR
            connecting(execute := NOT connected AND NOT connecting.busy, connectionID := config.ConnectionID, connectionConfiguration := config, status => status, error => error);
            IF connecting.done THEN
                connected := TRUE;
            END_IF;
            connect := connected;
        END_METHOD

        METHOD PUBLIC disconnect
            VAR_INPUT
                execute : BOOL;
            END_VAR
            disconnecting(execute := connected AND NOT disconnecting.busy AND execute, connectionID := config.ConnectionID);
            IF disconnecting.done THEN
                connected := FALSE;
            END_IF;
        END_METHOD

        METHOD PUBLIC send
            VAR_INPUT
                req : BOOL;
                length : UDINT := UDINT#5;                
            END_VAR
            VAR_IN_OUT
                data : ARRAY[*] OF BYTE;
            END_VAR
            VAR_OUTPUT
                done : BOOL;
                error : BOOL;
            END_VAR
            sending(execute := connected AND req, connectionID := config.ConnectionID, length := UDINT#5, data := data, done => done, error => error);
        END_METHOD

        METHOD PUBLIC receive
            VAR_IN_OUT
                data : ARRAY[*] OF BYTE;
            END_VAR
            receiving(enable := connected, connectionID := config.ConnectionID, adhocMode := TRUE, data := data);
        END_METHOD
    END_CLASS

END_NAMESPACE
