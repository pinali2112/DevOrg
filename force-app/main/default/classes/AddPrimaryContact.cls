public class AddPrimaryContact implements Queueable { 
    
    public Contact con {get; set;}
    public String state  {get; set;}
    
    public AddPrimaryContact(Contact c, String state){
        this.con = c;
        this.state = state;
    }
    
    public void execute(QueueableContext context) {

        List<Account> accts = [SELECT id, name FROM Account where billingstate = :this.state LIMIT 200];
        List<Contact> consUpdated = new List<Contact>();
    
        for(Account a :accts){
            
            Contact newCon = this.con.clone(false, false, false, false);
            newCon.AccountId = a.Id;
            consUpdated.add(newCon);
        }
        
        insert consUpdated;
        
       
    
    }
    
}