public class EmailManager{

    public static void sendEmail(String address, String subject, String body){
    
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {address};
        mail.setToAddresses(toAddresses);
        mail.setSubject(subject);
        mail.setPlainTextBody(body);
        Messaging.SendEmailResult[] results = Messaging.sendEmail(new Messaging.SingleemailMessage[]{mail});
        inspectResults(results);         
    
    }
    
    private static Boolean inspectResults(Messaging.SendEmailResult[] results){
    
        Boolean sendResult = true;
        for(Messaging.SendEmailResult res : results){
        
            if(res.isSuccess()){
            
                System.debug('Email sent sucessfully');
            
            }else{
            
                sendResult = false;
                System.debug('The following errors occurred : ' + res.getErrors());
            
            }
        
        }
        
        return sendResult;
    
    }

}