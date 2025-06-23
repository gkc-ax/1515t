TYPE
    Status : (Stop, Run, Maintain) := Stop;
END_TYPE

INTERFACE Equipment
    METHOD start : BOOL END_METHOD      
    METHOD stop : BOOL
        VAR_INPUT
            
        END_VAR
        
    END_METHOD

    METHOD getStatus : Status
        VAR_INPUT
            
        END_VAR        
    END_METHOD

END_INTERFACE

CLASS Sensor
    VAR PRIVATE
        sensorId : STRING;
    END_VAR
    
END_CLASS