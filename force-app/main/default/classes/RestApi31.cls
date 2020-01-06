global class RestApi31 {
    global static void sendRequest1(){
	Http http = new Http();
    HttpRequest request = new HttpRequest();
    request.setEndpoint('http://srv-om-q:8080/inputs/salesforce');
    request.setMethod('POST');
    //request.setHeader('Content-Type', 'application/json;charset=UTF-8');
    // Set the body as a JSON object
    request.setBody('{"name":"test 1"}');
    HttpResponse response = http.send(request);
    // Parse the JSON response
    if (response.getStatusCode() != 201) {
        System.debug('The status code returned was not expected: ' +
            response.getStatusCode() + ' ' + response.getStatus());
    } else {
        System.debug(response.getBody());
    }
    }
}