@RestResource(urlMapping='/Accounts/*/contacts')
global class AccountManager {
 @HttpGet
    global static Account getAccount(){
       RestRequest request =  RestContext.request;
        return [Select id, name,(SELECT id,name from Contacts) from Account where id=:request.requestURI.substringBetween('Accounts/',                                  '/contacts')];
}
}