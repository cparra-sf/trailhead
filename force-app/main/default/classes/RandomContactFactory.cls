public class RandomContactFactory {
    public static List<Contact> generateRandomContacts(Integer numContacts, String lastName) {
    	List<Contact> conts = new List<Contact>();
        for(Integer i=1;i<=numContacts;i++) {
            Contact c = new Contact(FirstName='Test ' + i, LastName = lastName);
            conts.add(c);
        }
        return conts;
    }
}