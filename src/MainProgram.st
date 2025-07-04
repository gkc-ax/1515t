USING System.FastMath;
PROGRAM  MainProgram    
    VAR_EXTERNAL 
        ET200SP_DQ1_OutputAddress:BYTE;
        sinData,cosData  : REAL;
        count:LREAL ;
        AI1_CH0  : WORD;
        AI1_CH1  : WORD;
        temperature: REAL; 
    END_VAR
    ET200SP_DQ1_OutputAddress := ET200SP_DQ1_OutputAddress XOR BYTE#01 ;
    count := count + 0.01 ;
    sinData := sin(TO_REAL( count));
    cosData := cos(TO_REAL( count));
    temperature:=TO_REAL(TO_INT (AI1_CH0)) / TO_REAL( 276.48);    
END_PROGRAM


