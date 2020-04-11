@isTest
public class AccountManagerTest {

    @isTest public static void executeGetAccount(){
        //making Data ready for Testing
        Account acc = new Account(Name='Jayanth B');
        insert acc;
        insert new Contact(LastName='Jayanth',FirstName='b',AccountId=acc.id);
        
        // Set up a test request
        RestRequest request = new RestRequest();
        request.requestURI = 'https://ap4.salesforce.com/services/apexrest/Accounts/'+(String)acc.id+'/contacts';
        request.httpMethod ='GET';
        //set up request Context 
        RestContext.request =  request;
        // call the method
        Account returnedAcc = AccountManager.getAccount();

    }
}