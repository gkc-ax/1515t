
CONFIGURATION MyConfiguration
    TASK Main(Priority := 1, INTERVAL:=t#100ms);
    
    PROGRAM P1 WITH Main: MainProgram;
    //  Writable from HMI/OPC UA/Web API
    {S7.extern=ReadWrite}    
    {OpcUa.AccessLevel = ReadWrite}
    VAR_GLOBAL
        ET200SP_DI1_InputAddress AT %IB0: BYTE;
        {OpcUa.AccessLevel = ReadOnly}
        ET200SP_DQ1_OutputAddress AT %QB2: BYTE;
        sinData,cosData : REAL;
        AI1_CH0 AT %IW1: WORD;
        AI1_CH1 AT %IW3: WORD;        
        count: LREAL:= 0.0;
        temperature: REAL;
    END_VAR
END_CONFIGURATION


