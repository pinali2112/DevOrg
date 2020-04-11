public class AccountTriggerHandler implements iTriggerHandler{
     
    public Boolean isDisabled(){
        return true;
    }
    
    public void beforeInsert(List<SObject> newItems){
        System.debug('AccountTriggerHandler called');
        String name ;
        for(Account acc: (List<Account>)newItems){
            if(acc.Name.contains('test')){
                acc.Name.addError('Can not create account with word \'test\' in name');
            }
        }
        
    }
    public void beforeUpdate(Map<id,SObject> newItems, Map<id,SObject> oldItems){}
    public void beforeDelete(List<SObject> newItems){}
    
    public void afterInsert(List<SObject> newItems){}
    public void afterUpdate(Map<id,SObject> newItems, Map<id,SObject> oldItems){}
    public void afterDelete(List<SObject> newItems){}
    public void afterUndelete(List<SObject> newItems){}
    
    
}