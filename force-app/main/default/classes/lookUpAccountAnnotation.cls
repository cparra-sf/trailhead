global class lookUpAccountAnnotation {
   @InvocableMethod
   public static List<String> getAccountIds(List<List<String>> names) {
      List<Id> accountIds = new List<Id>();
      List<String> nombres = names.get(0);
      List<Account> accounts = [SELECT Id FROM Account WHERE Name in :nombres];
      for (Account account : accounts) {
         accountIds.add(account.Id);
      }
      
      return accountIds;
   }
}