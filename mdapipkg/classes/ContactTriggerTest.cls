@isTest
public class ContactTriggerTest {
	@isTest
    public static void testContactUpdate() {
        Account acc = new Account(Name='Test Name');
        insert acc;
        Building__c bldg = new Building__c(Name='Test bldg', InitialCost__c=500.00, Height__c=500, Account__c=acc.Id);
        insert bldg;
        Contact cont = new Contact(LastName='TestName', AccountId=acc.Id, Building__c=bldg.Id);
        insert cont;
        
        cont.AccountId = null;
        update cont;
        
        cont = [SELECT Id, AccountId, Building__c FROM Contact WHERE Id = :cont.Id];
        System.assertEquals(null, cont.AccountId);
        System.assertEquals(null, cont.Building__c);
    }
}