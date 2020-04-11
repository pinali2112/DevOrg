trigger ClosedOpportunityTrigger on Opportunity (after insert,after update) {
    List<Task> apmTasks = new List<Task>();
    for (Opportunity opp : Trigger.New) {
        if(opp.StageName == 'Closed Won'){
            
                Task apmTask = new Task();
                apmTask.subject = 'Follow Up Test Task';
                apmTask.Description = 'Follow Up Test Task';
                apmTask.Type = 'Email';
                apmTask.ActivityDate = Date.today();
                apmTask.WhatId = opp.Id;
                apmTask.WhoId = opp.owner.Id;
                apmTask.Status = 'Completed'; 
                apmTasks.add(apmTask); 
        }
    }
    
    if(apmTasks.size() > 0)
        insert apmTasks;

    
}