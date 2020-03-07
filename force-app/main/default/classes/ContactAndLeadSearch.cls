public class ContactAndLeadSearch {
    public static List<List<SObject>> searchContactsAndLeads(String name){
        List<List<SObject>> searchList = [FIND :name IN NAME FIELDS RETURNING Contact(Name),Lead(Name)]; 
        return searchList;
    }
}