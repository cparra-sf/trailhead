@isTest
public class LeadProcessorTest {
	@testSetup
    static void setup(){
        List<Lead> lds = new List<Lead>();
        for (Integer i=0;i<200;i++) {
        	lds.add(new Lead(FirstName ='FirstName', LastName ='LastName '+i, Company ='Demo '+i));
        }
        insert lds;
    }
    @isTest static void test(){
        Test.startTest();
        LeadProcessor lp = new LeadProcessor();
        Id batchId = Database.executeBatch(lp);
        Test.stopTest();
        System.assertEquals(200, [SELECT count() FROM Lead WHERE LeadSource = 'Dreamforce']);
    }
}