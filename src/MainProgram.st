
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
        sides:int;      
    END_VAR
    VAR
        cal:ns1.MyClass; 
        process: ProcessFB;
        area:lreal;
    END_VAR
    ET200SP_DQ1_OutputAddress := ET200SP_DQ1_OutputAddress XOR BYTE#01 ;
    count := count + 0.01 ;
    sinData := sin(TO_REAL( count));
    cosData := cos(TO_REAL( count));
    temperature:=TO_REAL(TO_INT (AI1_CH0)) / TO_REAL( 276.48);
    result:=cal.Math(TO_INT (count),1,'+');
    process(sides:=sides,area=>area);
END_PROGRAM

FUNCTION_BLOCK ProcessFB
    VAR_INPUT
        sides:int:=3;
    END_VAR 
    VAR
        square: Square; 
        triangle: Triangle;        
        squareArea, triangleArea,cirleArea:lreal;
        circle : Circle;
    END_VAR
    VAR_TEMP
        obj: REF_TO Polygon;
    END_VAR
    VAR_OUTPUT
        area:lreal;
    END_VAR

    CASE sides OF
        0:  obj:=REF(circle);          
        3:  obj:=REF(triangle);
        4:  obj:=REF(square);
        ELSE
            obj:=REF(circle);            
    END_CASE;
    area:=obj^.calculateArea();
    //  //calculate square area
    //  squareArea:=square.calculateArea();
    //  //calculate triangel area
    //  triangleArea:=triangle.calculateArea();
    //  //calculate cirle area
    //  cirleArea:=circle.calculateArea();
END_FUNCTION_BLOCK

