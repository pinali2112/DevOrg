public class LeadProcessor implements Database.Batchable<sObject>, Database.Stateful{
    public LeadProcessor() {
        
    }
    
    public Database.QueryLocator start(Database.batchableContext BC) {
        
        String query = 'Select id from Lead';
        
            
        return  Database.getQueryLocator(query);

    }

    public void execute(Database.BatchableContext BC, List<Lead> records) {
        System.debug('calling Lead batch');
        List<Lead> updatedLeads = new List<Lead>();
        
        for(Lead l : records){
            l.LeadSource = 'Dreamforce';
            updatedLeads.add(l);
        }
        
        update updatedLeads;
        
    }
    

    public void finish(Database.BatchableContext BC) {
        
    }
    
}