global class RestApi4{
    global static void sendInfo(){
        try{
        HttpRequest req = new HttpRequest();
        req.setEndPoint('https://apitest2.free.beeceptor.com/my/api/path');
        req.setMethod('POST');
        req.setBody('Hello World');
        
        Http h = new Http();
        HTTPResponse res = h.send(req);
        System.debug(res.getBody()); 
        }catch(Exception e){
            System.debug('Exception: '+e);
        }
    }
    
}