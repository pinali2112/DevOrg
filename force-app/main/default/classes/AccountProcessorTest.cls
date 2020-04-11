@isTest
public class AccountProcessorTest {
        
    public static TestMethod void testDate1() {
        List<Account> accs = [SELECT id,Number_of_Contacts__c FROM Account];
        List<Id> accIds = new List<Id>();
        for(Account a : accs){
            accIds.add(a.Id);
        }
        Test.startTest();
        AccountProcessor.countContacts(accIds);
        Test.stopTest();
    }
    
    
    @testsetup
    static void testSet(){
        Account acc = new Account();
        acc.Name = 'name';
        acc.BillingCountry = 'Australia';
        acc.BillingStreet = 'UnitTest Street';
        acc.BillingCity = 'Melbourne';
        acc.BillingState = 'VIC';
        acc.BillingPostalCode = '3000';
        insert acc;
        
        Contact con = new Contact();
        con.LastName = 'Unit Test Contact';
        con.AccountId = acc.Id;
        con.Phone = '1234567890';
        con.MobilePhone = '0400111222';
        con.Email = 'UnitTestUser@fairfaxmedia.com.au.test';
    
        insert con;
        
        Contact con2 = new Contact();
        con2.LastName = 'Unit Test Contact 1' ;
        con2.AccountId = acc.Id;
        con2.Phone = '1234567890';
        con2.MobilePhone = '0400111222';
        con2.Email = 'UnitTestUser@fairfaxmedia.com.au.test';
        
        insert con2; 
            
            
        Account acc1 = new Account();
        acc1.Name = 'name';
        acc1.BillingCountry = 'Australia';
        acc1.BillingStreet = 'UnitTest Street';
        acc1.BillingCity = 'Melbourne';
        acc1.BillingState = 'VIC';
        acc1.BillingPostalCode = '3000';
        insert acc1;
        
        Contact con1 = new Contact();
        con1.LastName = 'Unit Test Contact';
        con1.AccountId = acc1.Id;
        con1.Phone = '1234567890';
        con1.MobilePhone = '0400111222';
        con1.Email = 'UnitTestUser@fairfaxmedia.com.au.test';
    
        insert con1;
        
        Contact con12 = new Contact();
        con12.LastName = 'Unit Test Contact 1' ;
        con12.AccountId = acc1.Id;
        con12.Phone = '1234567890';
        con12.MobilePhone = '0400111222';
        con12.Email = 'UnitTestUser@fairfaxmedia.com.au.test';
        
        insert con12;       
               
    }
}