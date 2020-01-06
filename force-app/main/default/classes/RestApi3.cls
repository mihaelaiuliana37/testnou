@RestResource(urlMapping='/api/*/testapi3')
global class RestApi3 {
    global static void sendRequest(){
        // get the list of all the accounts we need to send
        List<Account> accountList = [SELECT Id, Name FROM Account ORDER BY Name ASC LIMIT 1];
        
        // start preparing the xml file
        XmlStreamWriter xmls = new XmlStreamWriter();
        xmls.writeStartDocument(null, '1.0'); // start the xml file
        xmls.writeProcessingInstruction('target', 'data');
        xmls.writeStartElement(null, 'Accounts', null); // this will start the xml with <accounts>
        
        // loop through all the accounts
        for(Account a : accountList){
            // this will write <account> in the xml file
            xmls.writeStartElement(null, 'Account', null);
            // open the tag with <accountId>
            xmls.writeStartElement(null, 'Id', null);
            // write the value
            xmls.writeCharacters(a.Id);
            // close the <accountId> tag
            xmls.writeEndElement();
            // open the tag with <accountName>
            xmls.writeStartElement(null, 'Name', null);
            // write the value
            xmls.writeCharacters(a.Name);
            // close the <accountName> tag
            xmls.writeEndElement();
            // close the <account> tag
            xmls.writeEndElement();            
        }
        // close <accounts>
        xmls.writeEndElement();
        xmls.writeEndDocument();
        
        String xmlOutput = xmls.getXmlString();
        System.debug('xmlOutput: '+xmlOutput);
        //xmls.close();
          
        Http h = new Http();
        // send the xml file to the external system
        HttpRequest request = new HttpRequest();
        // set the endpoint for the xml destination
        //request.setEndpoint('https://apitest2.free.beeceptor.com/my/api/path');
        request.setEndpoint('http://srv-om-q:8080/inputs/salesforce');
        request.setHeader('Content-Type','application/xml');
        request.setHeader('Accept','application/xml');
        request.setMethod('POST');
        // get the xmloutput
        request.setBody(xmlOutput);
                
        try{
            // send the response
        HttpResponse response = h.send(request);
        System.debug('response' + response.getBody());
        }
        catch(Exception e){
            System.debug('Exception is: '+e);
        }
    }
}