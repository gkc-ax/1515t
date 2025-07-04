
USING Siemens.Simatic.S71500.Clocks;
USING System.DateTime;
USING System.FastMath;
USING gkc.Geometry;

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
    VAR
        cal:ns1.MyClass; 
        process: ProcessFB;
        squareArea, triangleArea,cirleArea:lreal;
        square: Square; 
        triangle: Triangle; 
        circle :Circle;
        p2,p3: LREAL;
    END_VAR
    ET200SP_DQ1_OutputAddress := ET200SP_DQ1_OutputAddress XOR BYTE#01 ;
    count := count + 0.01 ;
    sinData := sin(TO_REAL( count));
    cosData := cos(TO_REAL( count));
    temperature:=TO_REAL(TO_INT (AI1_CH0)) / TO_REAL( 276.48);
    
    result:=cal.Math(TO_INT (count),1,'+');
    circle.initialize(20.0);
    triangle.initialize(base:=3.5,height:=4.2);
    square.initialize(sideLength:=5.5);
    cirleArea:=circle.calculateArea();
    process(obj:=REF(triangle),area=>triangleArea,sides=>p2);  
    process(obj:=REF(square),area=>squareArea,sides=>p3);
END_PROGRAM


FUNCTION_BLOCK ProcessFB
    VAR_INPUT
        obj: REF_TO Polygon;
    END_VAR 
    VAR_OUTPUT
        area:lreal;
        sides:LREAL;
    END_VAR
    area:=obj^.calculateArea();
    sides:=obj^.getSides();
END_FUNCTION_BLOCK


