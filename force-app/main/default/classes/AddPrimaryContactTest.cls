@isTest
public class AddPrimaryContactTest {

    public static TestMethod void testMethodAddCons() {
        List<Account> accs = new List<Account>();
        
        for(Integer i=0;  i<50; i++){
            Account a = new Account();
            a.name = 'Test'+i;
            a.Type = 'Prospect';
            a.BillingState = 'NY';
            accs.add(a);
        }
        
         for(Integer i=0;  i<50; i++){
            Account a = new Account();
            a.name = 'Test'+i;
            a.Type = 'Prospect';
            a.BillingState = 'CA';
            accs.add(a);
        }
        insert accs;
        Contact c = New Contact();
        c.FirstName = 'Test';
        c.LastName = 'Contact';
        c.Email = 'Test@abc.com';
        insert c;
        
         Test.startTest();
            AddPrimaryContact updater = new AddPrimaryContact(c, 'CA');
            System.enqueueJob(updater);
        Test.stopTest();
        
        List<Contact> contCa = [SELECT id,Name, AccountId FROM Contact];
        System.assertEquals(51, contCa.size());
        
       
    }
}