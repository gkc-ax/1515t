NAMESPACE gkc.Geometry
    INTERFACE Shape
        METHOD calculateArea : LREAL END_METHOD
    END_INTERFACE 

    CLASS ABSTRACT Polygon IMPLEMENTS Shape
        VAR PRIVATE
            sides : int:=3;
        END_VAR
        METHOD PUBLIC ABSTRACT calculateArea : LREAL END_METHOD
        METHOD PUBLIC getSides : Int
            getSides:=sides;
        END_METHOD       
        METHOD PUBLIC setSides
            VAR_INPUT
                numberOfSides:int;
            END_VAR            
            sides:=numberOfSides;
        END_METHOD      
    END_CLASS

    CLASS Triangle EXTENDS Polygon
        VAR PUBLIC
            base : LREAL:=5.0;
            height : LREAL:=10.0;            
        END_VAR
        METHOD PUBLIC OVERRIDE calculateArea : LREAL
            calculateArea := base * height / 2;             
        END_METHOD
    END_CLASS

    CLASS Square EXTENDS Polygon
        VAR PUBLIC
            sideLength : LREAL:=5.0;         
        END_VAR
        METHOD PUBLIC OVERRIDE calculateArea : LREAL
            calculateArea := sideLength * sideLength;             
        END_METHOD        
    END_CLASS

    CLASS Circle EXTENDS Polygon
        VAR PUBLIC
            radius: LREAL:=5.0;
        END_VAR
        VAR CONSTANT PRIVATE
            PI : LREAL:=3.1415;
        END_VAR
        METHOD PUBLIC OVERRIDE calculateArea : LREAL
            calculateArea:=radius * radius * PI;             
        END_METHOD
    END_CLASS   
END_NAMESPACE