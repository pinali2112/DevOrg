public interface iTriggerHandler {

    
    Boolean isDisabled();
    
    void beforeInsert(List<sObject> newItems);
    void beforeUpdate(Map<id,sObject> newItems, Map<id, sObject> oldItems);
    void beforeDelete(List<sObject> deletedItems);
    void afterInsert(List<sObject> newItems);
    void afterUpdate(Map<id,sObject> newItems, Map<id, sObject> oldItems);
    void afterDelete(List<sObject> deletedItems);
    void afterUndelete(List<sObject> deletedItems);
    //System.debug('iTriggerHandler interface called');
     //System.debug('TriggerDispatcher getting executed');
}