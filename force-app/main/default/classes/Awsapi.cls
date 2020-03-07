public with sharing class Awsapi{
    
    private String consumerKey;
    private String consumerSecret;
    private String url;
    
    public Awsapi(String consumerKey, String consumerSecret, String url){
        this.consumerKey = consumerKey;
        this.consumerSecret = consumerSecret;
        this.url = url;
    }
    
    public String getToken(){
        
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(url);
        req.setMethod('POST');
        
        Blob headerValue = Blob.valueOf(consumerKey + ':' + consumerSecret);
        String authorizationHeader = 'Basic ' + EncodingUtil.base64Encode(headerValue);
        req.setHeader('Authorization', authorizationHeader);
        req.setHeader('Content-Type', 'application/x-www-form-urlencoded');
        req.setBody('grant_type=client_credentials');
        
        HttpResponse res = h.send(req);
      
        String jsonString = res.getBody();
        
        Map<String, Object> result = (Map<String, Object>)JSON.deserializeUntyped(jsonString);
        
        String token = result.get('token_type')+' '+result.get('access_token');
        
        /*
        System.debug(consumerKey);
        System.debug(consumerSecret);
        System.debug(url);
        System.debug(authorizationHeader);
        System.debug(jsonString);
        */
        System.debug(token);
        
        return token;
        
    }
    
}