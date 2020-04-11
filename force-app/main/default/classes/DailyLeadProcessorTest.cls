@isTest
public class DailyLeadProcessorTest {
  public static TestMethod void testMethod1() {
        

        List<Lead> leadList = new List<Lead>();
        for( Integer i= 0; i< 200; i++){
            Lead lead = new Lead();
            lead.LastName = 'Test'+i;
            Lead.Company = 'TEstComp';
            leadList.add(lead);
        }
        insert leadList;
         
        Test.startTest();
         
        String jobId = System.schedule('ScheduledApexTest', '20 30 8 10 2 ?', new DailyLeadProcessor());
         Test.stopTest();
         System.abortJob(jobId) ;
  
    }

}