public class GetSuperHeroes {
@AuraEnabled
   public static object returnBody(){
    superheroes s = new superheroes();
    HttpResponse t = makeCallout();
    return json.deserializeUntyped(t.getBody());
    }
    public static HttpResponse makeCallout() {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://salesforce-case-releye.herokuapp.com/rest-api/heroes/?format=json');
        //request.setHeader('X-ChatWorkToken','Your API token');
        //request.setBody('description=group+chat+description&icon_preset=meeting&name=Website+renewal+project');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        if(response.getStatusCode() == 200){
            system.debug('response: ' + response.getBody());
        }
        return response;
    }        

}