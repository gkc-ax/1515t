USING System.FastMath;
USING gkc.math;
USING Tcp;
USING Siemens.Simatic.S71500.Communication.OUC;

PROGRAM MainProgram
    VAR_EXTERNAL
        ET200SP_DQ1_OutputAddress : BYTE;
        sinData, cosData : REAL;
        count : LREAL;
        AI1_CH0 : WORD;
        AI1_CH1 : WORD;
        temperature : REAL;
    END_VAR
    VAR
        math : MyMath;
        result : INT;
        myTcp : ouc := (config := (
            RemotePort := UINT#2000,
            ConnectionID := word#12,
            ActiveEstablished := TRUE,
            localport := UINT#0));
        senddata : ARRAY[0..9] OF BYTE;
        recvdata : ARRAY[0..9] OF BYTE;
        send_req : BOOL;
    END_VAR
    VAR_TEMP
        send_done : BOOL;
        send_error : BOOL;
    END_VAR
    ET200SP_DQ1_OutputAddress := ET200SP_DQ1_OutputAddress XOR BYTE#01;
    count := count + 0.01;
    sinData := sin(TO_REAL(count));
    cosData := cos(TO_REAL(count));
    temperature := TO_REAL(TO_INT(AI1_CH0)) / TO_REAL(276.48);
    result := result + math.Arithmometer(TO_INT(count), 1, '+');
    senddata[0]:=result.%b0;
    senddata[1]:=result.%b1;

    // simple tcp example
    IF myTcp.connect() THEN
        myTcp.send(req := send_req, data:=senddata, length := UDINT#5, done => send_done, error => send_error);
        myTcp.receive(data:=recvdata);
        IF send_done OR send_error THEN
            send_req := FALSE;
        ELSE
            send_req := TRUE;
        END_IF;
    END_IF;
END_PROGRAM
