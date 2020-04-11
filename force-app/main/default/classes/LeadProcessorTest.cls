@isTest
public class LeadProcessorTest {
    
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
         
       Id batchID =  Database.executeBatch(new LeadProcessor());
        
         Test.stopTest();
         
     System.abortJob(batchID) ;
  
    }
    
}