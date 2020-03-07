public class AddPrimaryContact implements Queueable{
    private Contact cnt;
    private String state;
    
    public AddPrimaryContact(Contact cnt, String state){
    	this.cnt = cnt;
        this.state = state;
    }
    public void execute(QueueableContext context){
    	List<Account> lstAcc = [SELECT Id, Name, (SELECT Id, FirstName, LastName FROM contacts) FROM Account WHERE BillingState = :state LIMIT 200];
        List<Contact> lstCnt = new List<Contact>();
        for(Account acc : lstAcc){
            Contact cnt = this.cnt.clone(false,false,false,false);
            cnt.AccountId = acc.Id;
            lstCnt.add(cnt);
        }
        if(lstCnt.size()>0){
            insert lstCnt;
        }
    }
}