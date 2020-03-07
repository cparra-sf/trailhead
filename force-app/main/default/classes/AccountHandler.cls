public with sharing class AccountHandler {
    public static Account insertNewAccount(String nameAccount){
        try{
        	Account acc = new Account(Name=nameAccount);
     		insert acc;
        	return acc;    
        }catch(DMLException ex){
            return null;
        }
    }
}