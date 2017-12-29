trigger ContactTrigger on Contact (before update) {
	ContactHandler.handleContactUpdate(Trigger.new, Trigger.oldMap);
}