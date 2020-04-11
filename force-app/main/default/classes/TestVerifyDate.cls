@IsTest
public class TestVerifyDate {
   public static TestMethod void testDate1() {
    Date d1 =Date.today();
    Date d2 =Date.today().addDays(13);
        
    Date returnDate = VerifyDate.CheckDates(d1,d2);
   }
   public static TestMethod void testDate2() {
    Date d1 =Date.today();
    Date d2 =Date.today().addDays(32);
        
    Date returnDate = VerifyDate.CheckDates(d1,d2);
   }
}