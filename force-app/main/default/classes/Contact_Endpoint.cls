@RestResource(urlMapping = '/contact/*')
global class Contact_Endpoint {
    
    @Httpget
    global static void getContactProducts(){
        string jsonObj='';
        list<wrp_product> wrplist = new list<wrp_product>();
        
        try{
            
            RestContext.response.addHeader('Content-Type', 'application/json');
            String uuid = RestContext.request.requestURI.substring(RestContext.request.requestURI.lastIndexOf('/')+1);
            
            //get the output of n_26 metdata type to be wrapped in the Wrp_product class before it's serialized
            for(n26__mdt n1: GetProductDetails.getProductDetails('',uuid)){
                Wrp_product wrp = new Wrp_product();
                wrp.product = n1.Category__c;
                wrp.country = n1.masterlabel.left(2);
                wrp.ATM_Fee_in_other_currencies = n1.ATM_Fee_in_other_currencies__c;
                wrp.Card_Replacement_Cost = n1.Card_Replacement_Cost__c;
                wrp.Cost_per_Calendar_Month = n1.Cost_per_Calendar_Month__c;
                
                wrplist.add(wrp);
            }
            
        }catch (Exception ex) {
            // Log the error and set the HTTP status code to 404 
            System.debug(ex.getMessage());
            restcontext.response.statuscode=404;
            ApiError error = new ApiError(string.valueOf(404), ex.getMessage());
            restcontext.response.responsebody=blob.valueOf(JSON.serialize(error));
            return;
        }
        restcontext.response.statuscode=200;
        RestContext.response.responseBody = blob.valueof(Json.serialize(wrplist));
        return ;
    }
    
    public class Wrp_product{
        public String Product;
        public string Country;
        public string ATM_Fee_in_other_currencies;
        public string Card_Replacement_Cost;
        public string Cost_per_Calendar_Month;
    }
    public class ApiError {
        public String errorCode;
        public String message;
        public ApiError(String errorCode, string message){
            this.errorCode = errorCode;
            this.message = message;
        }
    }
    
}