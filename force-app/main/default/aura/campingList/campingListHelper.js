({
    handleAddItem: function(component, event, helper) {
    var addItm = event.getParam("item");
    helper.createItem(component, addItm);

},

    createItem: function(component, newItem) {
    var action = component.get("c.saveItem");
    action.setParams({
        "item": newItem
    });
    action.setCallback(this, function(response){
        var state = response.getState();
        if (component.isValid() && state === "SUCCESS") {
            var items = component.get("v.items");
            items.push(response.getReturnValue());
            component.set("v.items", items);
        }
    });
    $A.enqueueAction(action);
},
 })