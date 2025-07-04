NAMESPACE gkc.Geometry
    {axcode:docs-v0:1513:gkc\geometry\Shape.md}
    INTERFACE Shape
        METHOD calculateArea : LREAL END_METHOD
    END_INTERFACE

    {axcode:docs-v0:1513:gkc\geometry\Circle.md}
    CLASS Circle IMPLEMENTS Shape
        VAR PRIVATE
            radius: LREAL;
        END_VAR
        VAR CONSTANT
            PI : LREAL:=3.1415;
        END_VAR
        METHOD PUBLIC initialize
            VAR_INPUT
                radius:LREAL:=10.0;
            END_VAR
            this.radius:=radius;
        END_METHOD
        METHOD PUBLIC calculateArea : LREAL
            calculateArea:=radius * radius * PI;            
        END_METHOD
    END_CLASS    

    {axcode:docs-v0:1513:gkc\geometry\Polygon.md}
    CLASS ABSTRACT Polygon IMPLEMENTS Shape
        VAR PRIVATE
            sides : int;
        END_VAR
        METHOD PUBLIC ABSTRACT calculateArea : LREAL END_METHOD
        METHOD PUBLIC getSides : Int
            getSides:=sides;
        END_METHOD       
        METHOD PROTECTED setSides
            VAR_INPUT
                sides:int;
            END_VAR            
            this.sides:=sides;
        END_METHOD      
    END_CLASS

    {axcode:docs-v0:1513:gkc\geometry\Triangle.md}
    CLASS Triangle EXTENDS Polygon
        VAR PRIVATE
            base : LREAL;
            height : LREAL;            
        END_VAR
        METHOD PUBLIC initialize
            VAR_INPUT
                base:LREAL:=10.0;
                height:LREAL:=5.0;
            END_VAR
            SUPER.setSides(3);
            this.base:=base;
            this.height:=height;
        END_METHOD
        METHOD PUBLIC OVERRIDE calculateArea : LREAL
            calculateArea := base * height / 2;             
        END_METHOD
    END_CLASS

    {axcode:docs-v0:1513:gkc\geometry\Square.md}
    CLASS Square EXTENDS Polygon
        VAR PRIVATE
            sideLength : LREAL;         
        END_VAR
        METHOD PUBLIC initialize
            VAR_INPUT
                sidelength:LREAL:=25.0;
            END_VAR
            SUPER.setSides(4);
            this.sideLength:=sideLength;
        END_METHOD
        METHOD PUBLIC OVERRIDE calculateArea : LREAL
            calculateArea := sideLength * sideLength;             
        END_METHOD        
    END_CLASS
END_NAMESPACE