public class AccountProcessor {
    
    @Future(callout=true) 
    public static void countContacts(List<Id> accIds){
        
  
        Map<Id,Account> accRecs = new Map<Id,Account>([SELECT id, Number_of_Contacts__c from Account where Id IN :accIds]);
        List<Account> updateAcc = new List<Account>();
        
        for(Id i : accIds){
            Integer count = [Select count() from contact where AccountId = :i];
            Account a = accRecs.get(i);
            a.Number_of_Contacts__c = count;
            updateAcc.add(a);
            
            
        }
        
        update updateAcc;
    }
    
}