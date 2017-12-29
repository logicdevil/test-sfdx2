public class ContactHandler {
    public static void handleContactUpdate(List<Contact> contsList, Map<Id, Contact> contsMap) {
    	List<Contact> changedConts = new List<Contact>();
        for(Contact cont : contsList) {
            if(String.isEmpty(cont.AccountId) && String.isNotEmpty(cont.Building__c)) {
                cont.Building__c = null;
                changedConts.add(cont);
            }
        }
    }
}