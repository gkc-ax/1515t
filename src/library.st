using gkc.math;
NAMESPACE ns1   
    class  MyClass 
        VAR PRIVATE
            _cal: MyMath;
        END_VAR

        METHOD public Math : Int
            VAR_INPUT
                a : INT;
                b : INT;
                operator : CHAR;
                
            END_VAR
            VAR_IN_OUT
                
            END_VAR
            Math:=_cal.Arithmometer(a,b,operator);
        END_METHOD
        
    END_CLASS
END_NAMESPACE