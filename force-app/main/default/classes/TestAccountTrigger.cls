@IsTest
public class TestAccountTrigger {
    public static TestMethod void testViewAccountTeam() {
        Account a = new Account();
        a.Match_Billing_Address__c = true;
        a.BillingPostalCode = '1234';
        a.name = 'test';
        Test.startTest();
            insert a;
        Test.stopTest();
        List<Account> accs = [Select id,Match_Billing_Address__c,BillingPostalCode,ShippingPostalCode FROM account ];
        System.assertEquals(accs[0].BillingPostalCode, accs[0].ShippingPostalCode);
    }
}