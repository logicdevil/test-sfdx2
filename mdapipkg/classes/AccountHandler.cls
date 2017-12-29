public class AccountHandler {
    public static void handleAccountUpdate(List<Account> accsList, Map<Id, Account> accsMap) {
        List<Account> changedAccs = new List<Account>();
        for(Account acc : accsList) {
            if(acc.Valuation__c != accsMap.get(acc.Id).Valuation__c) {
                changedAccs.add(acc);
            }
        }
        if(!changedAccs.isEmpty()) {
            recalculateBuildingsCost(changedAccs);
        }
    }
    
    public static void recalculateBuildingsCost(List<Account> accs) {
        Set<Id> accIds = new Map<Id, Account>(accs).keySet();
        List<Building__c> bldgs = new List<Building__c>();
        List<Account> changedAccs = [SELECT Id, Name, Valuation__c, (SELECT Id, Cost__c, InitialCost__c FROM Buildings__r) FROM Account WHERE Id IN :accIds];
        for(Account acc : changedAccs) {
            for(Building__c bldg : acc.Buildings__r) {
                System.debug('!!!!!!!!!');
                bldg.Cost__c = bldg.InitialCost__c * acc.Valuation__c;
                bldgs.add(bldg);
            }
        }
        update bldgs;
	}
        
}