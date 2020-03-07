public class CreateTokenAwsApi {

    @InvocableMethod
    public static List<String> getToken(List<List<String>> joselito){
        System.debug(joselito);
		
		List<String> input = new List<String>(); 
        input =joselito.get(0);
        String consumerKey = input.get(0);
        String consumerSecret = input.get(1);
        String url = input.get(2);
        
        Awsapi api = new Awsapi(consumerKey , consumerSecret, url);
        String token = api.getToken();
        
        List<String> out = new List<String>();
        out.add('jacinto');
        out.add(token);
       	System.debug(token);
        return out;
    }
        
}