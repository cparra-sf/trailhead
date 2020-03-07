@IsTest
public class AccountProcessorTest {
    @IsTest static void testAccountProcessorTest() {
        Account acc = new Account();
        acc.Name = 'Test Account';
        Insert acc;

        Contact cont = New Contact();
        cont.FirstName ='Bob';
        cont.LastName ='Masters';
        cont.AccountId = acc.Id;
        Insert cont;
        
        List<Id> accIds = new List<ID>();
        accIds.add(acc.Id);
 
        Test.startTest();
            AccountProcessor.countContacts(accIds);
        Test.stopTest();
        
        Account accResult = [select Number_of_Contacts__c from Account where Id = :acc.id LIMIT 1];
        System.assertEquals ( Integer.valueOf(accResult.Number_of_Contacts__c) ,1);
  }
}