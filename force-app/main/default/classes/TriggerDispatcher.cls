public class TriggerDispatcher {
    public static void run(iTriggerHandler handler){
       
        // Before trigger logic
        if(Trigger.isBefore){
            
            if(Trigger.isInsert){
                handler.beforeInsert(Trigger.new);
            }
            if(Trigger.isUpdate){
                handler.beforeUpdate(trigger.newMap, trigger.oldMap);
            }
            if(Trigger.isDelete){
                handler.beforeDelete(trigger.new);
            }
        }
        
        //After trigger logic
        if(Trigger.isAfter){
            if(Trigger.isInsert){
                handler.afterInsert(trigger.new);
            }
            if(Trigger.isUpdate){
                handler.afterUpdate(trigger.newMap, trigger.oldMap);
            }
            if(Trigger.isDelete){
                handler.afterDelete(trigger.new);
            }
        }
         System.debug('TriggerDispatcher getting executed');
    }
}