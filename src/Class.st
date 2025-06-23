CLASS BaseClass
    VAR
        state : INT;    // Available in 'SubClass'
    END_VAR
    VAR PRIVATE
        inner_state : INT;  // Not available in 'SubClass'
    END_VAR
    METHOD Test
        inner_state := 10;
    END_METHOD
    METHOD PRIVATE InnerTest  // Not available in 'SubClass'
        ;
    END_METHOD
END_CLASS

CLASS SubClass EXTENDS BaseClass
    VAR
        additional_state : INT;    // Inherited by 'SubClass'
    END_VAR
    METHOD AdditionalTest
        THIS.Test();    // Access to method of 'BaseClass'
        state := 10;    // Access to fields of 'BaseClass'
        additional_state := 20;
    END_METHOD
END_CLASS

CLASS FINAL SealedSubClass EXTENDS BaseClass
    // 'SealedSubClass' is final and cannot be extended.
END_CLASS

INTERFACE I1
  METHOD MyMethod : INT
      VAR_INPUT
          a : INT := 2;
      END_VAR
  END_METHOD
END_INTERFACE

INTERFACE I2
  METHOD MyMethod : REAL
      VAR_INPUT
          a : REAL := 2;
      END_VAR
  END_METHOD
END_INTERFACE

CLASS MyImplementation IMPLEMENTS I1, I2 
    METHOD PUBLIC MyMethod : INT        // Interface methods must be implement as PUBLIC
        VAR_INPUT
            a : INT;
        END_VAR
        VAR_TEMP
            temp : INT;     // You can add temporary variables and code as required.
        END_VAR
        MyMethod := 10;
    END_METHOD

    METHOD PUBLIC MyMethod : REAL        // Interface methods must be implement as PUBLIC
        VAR_INPUT
            a : REAL;
        END_VAR
        VAR_TEMP
            temp : INT;     // You can add temporary variables and code as required.
        END_VAR
        MyMethod := REAL#10.0;
    END_METHOD

    // Error: Class does not implement all interfaces. 'AnotherMethod' is missing.
END_CLASS

CLASS PUBLIC  FINAL A EXTENDS  BaseClass IMPLEMENTS I1, I2
    VAR
        
    END_VAR
    METHOD PUBLIC MyMethod : INT        // Interface methods must be implement as PUBLIC
        VAR_INPUT
            a : INT;
        END_VAR
        VAR_TEMP
            temp : INT;     // You can add temporary variables and code as required.
        END_VAR
        MyMethod := 10;
    END_METHOD

    METHOD PUBLIC MyMethod : REAL        // Interface methods must be implement as PUBLIC
        VAR_INPUT
            a : REAL;
        END_VAR
        VAR_TEMP
            temp : INT;     // You can add temporary variables and code as required.
        END_VAR
        MyMethod := REAL#10.0;
    END_METHOD
    
END_CLASS