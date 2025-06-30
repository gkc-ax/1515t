USING Siemens.Simatic.S71500.Tasks;
USING gkc.Geometry;

CONFIGURATION MyConfiguration
    TASK Main(Priority := 1, INTERVAL:=t#100ms);
    
    PROGRAM P1 WITH Main: MainProgram;
    {S7.extern=ReadWrite}    
    {OpcUa.AccessLevel = ReadWrite}
    VAR_GLOBAL
        ET200SP_DI1_InputAddress AT %IB0: BYTE;
        {OpcUa.AccessLevel = ReadOnly}
        ET200SP_DQ1_OutputAddress AT %QB2: BYTE;
        // {OpcUa.AccessLevel = Hidden}
        sinData,cosData : REAL;
        AI1_CH0 AT %IW1: WORD;
        AI1_CH1 AT %IW3: WORD;
        
        count: LREAL:= 0.0;
        temperature: REAL;
        result:int;  
        sides:int;    
    END_VAR

END_CONFIGURATION


