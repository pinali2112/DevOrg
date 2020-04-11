trigger AccountAddressTrigger on Account (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    System.debug('Trigger on Account fired ');
    TriggerDispatcher.run(new AccountTriggerHandler());

    /*if (Trigger.isInsert || Trigger.isUpdate){
    	for(Account a: Trigger.New){
        	if( a.Match_Billing_Address__c == true){
         	   a.ShippingPostalCode = a.BillingPostalCode;
        	}
   		}
   } */
    
}