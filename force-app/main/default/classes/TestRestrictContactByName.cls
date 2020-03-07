@isTest
public class TestRestrictContactByName {
    @isTest static void TestAssignLastNameContact() {
        List<Contact> conts = RandomContactFactory.generateRandomContacts(2,'VALIDNAME');   
        Test.startTest();
            try
            {
                insert conts; 
            }
            catch(Exception ee)
            {
            }
        
        Test.stopTest(); 
    }
    
}