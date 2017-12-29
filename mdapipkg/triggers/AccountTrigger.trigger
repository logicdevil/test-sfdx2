trigger AccountTrigger on Account (before insert, after update) {
    if(Trigger.isAfter && Trigger.isUpdate) {
        AccountHandler.handleAccountUpdate(Trigger.new, Trigger.oldMap);
    }
}