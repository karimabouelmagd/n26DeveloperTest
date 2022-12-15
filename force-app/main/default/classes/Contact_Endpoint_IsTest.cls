@IsTest
public class Contact_Endpoint_IsTest {
    @IsTest
    public Static void testEndpoint(){
        test.startTest();   
        account acct = new account();
        acct.name = 'n26';
        Insert Acct;
        
        contact cont = new contact();
        cont.FirstName='karim';
        cont.lastname='Ahmed';
        cont.Home_Country__c='FR';
        cont.UUID__c='1234567';
        cont.Product__c='Metal';
        cont.AccountId=acct.id;   
        Insert cont;
        
        case case1 = new case();
        case1.origin = 'phone';
        case1.AccountId=acct.id;
        case1.ContactId=cont.id;
        Insert case1;
        
       
        
        RestRequest req = new RestRequest();
        req.requestURI = '/contact/'+cont.UUID__c;
        req.httpMethod = 'GET';
        
        RestContext.request = req;
        
        RestResponse res = new RestResponse();
        RestContext.response = res;
    
        Contact_Endpoint.getContactProducts();
        test.stopTest();
        system.AssertEquals(1,getproductdetails.getProductDetails('', cont.uuid__c).size());
        System.assertEquals(200, RestContext.response.statusCode, 'Expected a 200 reponse');
        system.debug(json.deserializeUntyped(RestContext.response.responsebody.tostring()));
    }
    @isTest
    public Static void testEndpoint_fail(){
        RestRequest req = new RestRequest();
        req.requestURI = '/contact/*';
        req.httpMethod = 'GET';
        
        RestContext.request = req;
        
        RestResponse res = new RestResponse();
        RestContext.response = res;
        
        test.startTest();
        Contact_Endpoint.getContactProducts();
        test.stopTest();

        System.assertEquals(404, RestContext.response.statusCode, 'Expected a 404 reponse');
    }
    
}