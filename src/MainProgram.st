
USING Siemens.Simatic.S71500.Clocks;
USING System.DateTime;
USING System.FastMath;


PROGRAM  MainProgram    
    VAR_EXTERNAL 
        ET200SP_DQ1_OutputAddress:BYTE;
        sinData,cosData  : REAL;
        count:LREAL ;
        AI1_CH0  : WORD;
        AI1_CH1  : WORD;
        temperature: REAL;
        result:int;
        
    END_VAR
    VAR_INPUT
        // cal:ns1.MyClass;
    END_VAR
    VAR_OUTPUT
    END_VAR
    VAR_IN_OUT   
             
    END_VAR
    VAR
        cal:ns1.MyClass; 
    END_VAR
    VAR_TEMP 
        systemDateTime : LDATE_AND_TIME;
        year, month, day, second ,millisecond: INT;
    END_VAR
    ET200SP_DQ1_OutputAddress := ET200SP_DQ1_OutputAddress XOR BYTE#01 ;
    // GetSystemDateTime(value => systemDateTime);
    // SplitDateAndTime(
    //     value := systemDateTime,
    //     millisecond => millisecond
    // );
    count := count + 0.01 ;
    sinData := sin(TO_REAL( count));
    cosData := cos(TO_REAL( count));
    temperature:=TO_REAL(TO_INT (AI1_CH0)) / TO_REAL( 276.48);
    result:=cal.Math(TO_INT (count),1,'+');
    
END_PROGRAM

