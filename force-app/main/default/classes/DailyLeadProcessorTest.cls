@isTest
private class DailyLeadProcessorTest {
	public static String CRON_EXP = '0 0 0 15 3 ? 2022';
    
    @testSetup
    static void setup(){
        List<Lead> lds = new List<Lead>();
        for(Integer i = 0; i<200; i++){
            lds.add(new Lead(FirstName = 'FirstName '+i, LastName = 'LastName '+i, Company = 'Demo '+i, LeadSource = ''));
        }
        insert lds;
    }
    
    @isTest static void test(){
        Test.startTest();
        String jobId = System.schedule('ScheduledApexTest',CRON_EXP, new DailyLeadProcessor());
        Test.stopTest();
    }
}