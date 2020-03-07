@isTest
public class TestVerifyDate {
    @isTest static void testDateSuccess() {
        Date date1= date.today();
        Date date2= date1.addDays(15);
        Date dt = VerifyDate.CheckDates(date1, date2);
        System.assertEquals(date2, dt);
    }
    @isTest static void testDateHigh() {
        Date date1= date.today();
        Date date2= date1.addDays(31);
        Integer totalDays = Date.daysInMonth(date1.year(), date1.month());
		Date lastDay = Date.newInstance(date1.year(), date1.month(), totalDays);
        Date dt = VerifyDate.CheckDates(date1, date2);
        System.assertEquals(lastDay, dt);
    }
    @isTest static void testDateLess() {
        Date date1= date.today();
        Date date2= date1.addDays(-1);
        Integer totalDays = Date.daysInMonth(date1.year(), date1.month());
		Date lastDay = Date.newInstance(date1.year(), date1.month(), totalDays);
        Date dt = VerifyDate.CheckDates(date1, date2);
        System.assertEquals(lastDay, dt);
    }
}