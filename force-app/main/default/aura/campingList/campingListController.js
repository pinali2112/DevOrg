({
    
    doInit: function(component, event, helper) {
        
        var action = component.get("c.getItems");
        
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (component.isValid() && state === "SUCCESS") {
                component.set("v.items", response.getReturnValue());
            }
            else {
                console.log("Failed with state: " + state);
            }
        });
        
        $A.enqueueAction(action);
    },    
    clickCreateItem : function(component, event, helper) {
        var validCamping = component.find('campingform').reduce(function (validSoFar, inputCmp) {
            // Displays error messages for invalid fields
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
        helper.createItem(component, addItm);
        if(validCamping){
            var newCampingItem = component.get("v.newItem");
            //helper.createCamping(component,newCampingItem);
            var campings = component.get("v.items");
            var item = JSON.parse(JSON.stringify(newCampingItem));
            
            campings.push(item);
            
            component.set("v.items",campings);
            component.set("v.newItem",{ 'sobjectType': 'Camping_Item__c','Name': '','Quantity__c': 0,
                                       'Price__c': 0,'Packed__c': false });
        }
    },
    handleAddItem: function(component, event, helper) {
         var newItem = event.getParam("item");
         var action = component.get("c.saveItem");
         action.setParams({"item": newItem});
  action.setCallback(this, function(response){
                var state = response.getState();
                if (component.isValid() && state === "SUCCESS") {
                    // all good, nothing to do.
                }
            });
            $A.enqueueAction(action);
       
     }
})