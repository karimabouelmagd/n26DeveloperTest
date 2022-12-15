trigger OpportunityTrigger on Opportunity (after insert,after update) {
    if(trigger.isAfter && isFirstRun.firstRun){
        OpportunityTriggerHandler Handler = new OpportunityTriggerHandler();
        if(trigger.isInsert ){
            Handler.createOrder(trigger.new);
        }
        else if (trigger.isUpdate ){
            Handler.createOrder(trigger.new);
        }
    }
}