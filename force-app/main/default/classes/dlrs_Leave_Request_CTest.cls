/**
 * Auto Generated and Deployed by the Declarative Lookup Rollup Summaries Tool package (dlrs)
 **/
@IsTest
private class dlrs_Leave_Request_CTest
{
    @IsTest
    private static void testTrigger()
    {
        // Force the dlrs_Leave_Request_CTrigger to be invoked, fails the test if org config or other Apex code prevents this.
        dlrs.RollupService.testHandler(new Leave_Request__C());
    }
}