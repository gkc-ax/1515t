USING AxUnit;
// USING MyLibrary;
USING AxUnit.ResultFunctions;

NAMESPACE Test2
    {Test}
    FUNCTION MyTest1
         Assert.Equal(12, 12);
    END_FUNCTION
    
    // {TestFixture}    
    // CLASS MyTestFixture

    //     VAR PROTECTED
    //         testInstance : MyClass;
    //     END_VAR

    //     {Test}
    //     METHOD PUBLIC MyTestMethod
    //         VAR_TEMP
    //             result : BOOL;
    //         END_VAR

    //         result := testInstance.MyMethod();

    //         Assert.Equal(actual := result, expected := FALSE);
        
    //     END_METHOD
    // END_CLASS

    {Test(value1 := 22, value2:= 22)}
    {Test(10, 10)}
    FUNCTION PUBLIC AddingTwoNumbersReturnsTheSum
        VAR_INPUT
            value1: INT;
            value2: INT;
        END_VAR
        // some test code
        Assert.Equal(value1, value2);
    END_FUNCTION

    // {TestFixture}    
    // FUNCTION PUBLIC MotorIsRunning
    //     VAR_IN_OUT
    //         motor : MyLibrary.Motor;
    //     END_VAR

    //     VAR_INPUT
    //         {CallerFilePath}
    //         file : WSTRING[1024];
    //         {CallerLineNumber}
    //         line : INT;
    //     END_VAR

    //     IF motor.IsRunning() THEN
    //         axunit_Succeed();
    //     ELSE
    //         axunit_Fail('Expected the motor to be running but it is stopped.', file, line);
    //     END_IF;

    // END_FUNCTION

END_NAMESPACE