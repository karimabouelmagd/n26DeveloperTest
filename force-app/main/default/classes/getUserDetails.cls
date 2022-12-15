public class getUserDetails {
    @AuraEnabled(cacheable=true)
    public static user getcurrentUser(string recId){
      
        user CurrentUSer = [select Id,Vacation_days__C,Current_Balance__c from user where id=:recId];
        return CurrentUSer;

    }
}