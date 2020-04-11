@IsTest
public class TestRestrictContactByName {
    public static TestMethod void testMethod1() {
        Contact c = new Contact();
        c.FirstName = 'Test';
        c.LastName = 'INVALIDNAME';
        c.Phone = '0111111111';
        c.Email = 'Test@ac.com';
        Boolean expectedExceptionThrown = false;
        Test.startTest();
        try{
         insert c;   
        }Catch(Exception e){
            expectedExceptionThrown = e.getMessage().contains('INVALIDNAME') ? true : false;
        }
System.AssertEquals(expectedExceptionThrown, true);
        Test.stopTest();
    }

}