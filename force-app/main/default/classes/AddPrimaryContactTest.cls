@isTest
public class AddPrimaryContactTest {
	@testSetup
    static void setup() {
        List<Account> lstAcc = new List <Account>();
        for(Integer i=0;i<50;i++){
            lstAcc.add(new Account(BillingState = 'CA', name = 'Test '+i));
        }
        for(Integer j=0;j<50;j++){
            lstAcc.add(new Account(BillingState = 'NY', name = 'Test '+j));
        }
        insert lstAcc;
    }
    @isTest static void test(){
        Contact cnt = new Contact();
        cnt.FirstName='demo';
        cnt.LastName ='demo';
        insert cnt;
        String state = 'CA';
        
        AddPrimaryContact apc = new AddPrimaryContact(cnt, state);
        Test.startTest();
        System.enqueueJob(apc);
        Test.stopTest();
    }
}