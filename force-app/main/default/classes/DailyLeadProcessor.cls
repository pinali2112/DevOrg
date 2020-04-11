public class DailyLeadProcessor implements Schedulable {
    public DailyLeadProcessor(){
        
    }
    
    public void execute(SchedulableContext ctx) {
        
        List<Lead> records = [Select id from Lead];
        
            
         
        
        System.debug('calling Lead batch');
            
        List<Lead> updatedLeads = new List<Lead>();
        
        for(Lead l : records){
            l.LeadSource = 'Dreamforce';
            updatedLeads.add(l);
        }
        
        update updatedLeads;
        
        Database.executeBatch(new LeadProcessor()); //Set default batch size of 10 to avoid too many emails per batch (max 10)
    }
            

    
}