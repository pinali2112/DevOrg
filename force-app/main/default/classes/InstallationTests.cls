/* 
 * This class can be safely deleted from your org. 
 * It was only used to ensure 100% test coverage
 * for the managed package installation.
 */

@IsTest
private class InstallationTests {
    static testmethod void testMaintenanceRequest() {
        Map<Id,Case> applicableCases = new Map<Id,Case>();  
        Case c = new Case();
        c.Type = 'Repair';
        c.Status = 'Closed';
        insert c;
        
        applicableCases.put(c.Id, c);
        Test.startTest();
            MaintenanceRequestHelper.updateWorkOrders(applicableCases);
        Test.stopTest();
        
    }
    static testmethod void testWarehouseSync() {
         Test.setMock(HttpCalloutMock.class, new WarehouseCalloutServiceMock());        
        String CRON_EXP =  '0 0 0 3 9 ? 2022';
        Test.startTest();
        
        // Schedule the test job
        String jobId = System.schedule('testScheduledApex', CRON_EXP, new WarehouseSyncSchedule());
        
        Test.stopTest();
        
        // Get the information from the CronTrigger API object
        CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, 
                          NextFireTime FROM CronTrigger WHERE id = :jobId];
        
        // Verify the expressions are the same
        System.assertEquals(CRON_EXP,ct.CronExpression);
        // Verify the job has not run
        System.assertEquals(0, ct.TimesTriggered);
    }    
}