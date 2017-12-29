@isTest
public class AccountTriggerTest {
	@isTest
    public static void testUpdateAccount() {
        Account acc = new Account(Name='Test Name');
        insert acc;
        Building__c bldg = new Building__c(Name='Test bldg', InitialCost__c=500.00, Height__c=500, Account__c=acc.Id);
        insert bldg;
        System.assertEquals(null, bldg.Cost__c);
        
        acc = [SELECT Id, Valuation__c FROM Account WHERE id = :acc.Id];
        acc.Valuation__c = 4;
        update acc;
        
        bldg = [SELECT Id, Cost__c FROM Building__c WHERE Id = :bldg.Id];
        System.assertEquals(2000.00, bldg.Cost__c);
    }
}