global class RestApi1 {
    global void sendReq(){
        HttpRequest req = new HttpRequest();
        HttpResponse res = new HttpResponse();
        Http http = new Http();
       
        string test = ' <some xml format data>';
        req.setEndpoint('https://apitest2.free.beeceptor.com/my/api/path');
        req.setMethod('POST');
        req.setBody(test);
        req.setCompressed(true); // otherwise we hit a limit of 32000
 
        try {
            res = http.send(req);
        } catch(System.CalloutException e) {
            System.debug('Callout error: '+ e);
            System.debug(res.getBody());
        }
    }
}