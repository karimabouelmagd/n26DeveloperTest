public class GetProductDetails {
    @AuraEnabled
    public static List<n26__mdt> getProductDetails(string ContactID,string uuid){
        contact Contact = new contact();
        //method called from the caseContactComp LWC
        if(string.isBlank(uuid) && !string.isBlank(ContactID)){
            contact = [SELECT id,product__c, home_country__c, Email FROM Contact WHERE Id= :contactId];
        }
        //method called from the contact_endpoint class
        else if(!string.isBlank(uuid) && string.isBlank(ContactID)){
            contact = [SELECT id,product__c, home_country__c, Email FROM Contact WHERE uuid__c= :uuid];
        }
        //Get details from the custom metadatatype by country and product
        list<n26__mdt> prodList = new list<n26__mdt>();
        if(contact <> null && contact.product__C <> null && contact.Home_Country__c <> null){
            prodList = database.query('select masterlabel,category__c,ATM_Fee_in_other_currencies__c ,Card_Replacement_Cost__c ,Cost_per_Calendar_Month__c from n26__mdt where category__c =\''+contact.product__c+'\' and masterlabel like \'%'+contact.Home_Country__c+'%\' order by masterlabel');
        }else{
            //fill return values with No Data if no records
            n26__mdt emptyRecord = new n26__mdt();
            emptyRecord.masterlabel ='NA';
            emptyRecord.category__c = 'NO DATA';
            emptyRecord.Card_Replacement_Cost__c='NO DATA';
            emptyRecord.ATM_Fee_in_other_currencies__c='NO DATA';
            emptyRecord.Cost_per_Calendar_Month__c='NO DATA';
            prodList.add(emptyrecord);
        }
        
        
        
        return prodlist;
    }
    
}