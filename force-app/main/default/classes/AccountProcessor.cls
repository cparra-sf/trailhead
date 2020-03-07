public class AccountProcessor {
    @future
    public static void countContacts(List<String> accIds){
        List<Account> accs = [SELECT Id, Number_of_Contacts__c, (SELECT Id FROM Contacts) FROM Account WHERE Id in :accIds];
        for(Account acc : accs){
            List<Contact> lstCont = acc.contacts;
            acc.Number_of_Contacts__c = lstCont.size();
        }
        update accs;
    }
}