public class CalculateWorkDays {
    @InvocableMethod(label='Calculate Working Date')
    //this method is called from process builder 
    public static void CalcWorkingDays(List<Id> requestId) {
       List<leave_request__C> RRequest = [select ID,start_date__C,end_date__C from leave_request__c where id IN :requestId];
        system.debug(RRequest);
        for(Leave_Request__C LREQUEST: RRequest)
        {
        date startdate = LRequest.Start_Date__c;
        integer number_of_Vacation_Days = 0;
    //Checking for weekends to exclude them from the duration.    
        while (startdate < LRequest.End_date__c){
            integer dayofweek=Math.mod(Date.newInstance(1900, 1, 7).daysBetween(startdate),7);
            if(Dayofweek!=0 && dayofweek !=6){
                
                number_of_vacation_days+=1;
                
            }
            startdate+=1;
        }
        //Adding the days of the submission.
        number_of_vacation_days+=1;
       
        //one day vacation.
        if(LREQUEST.Start_date__C==LREquest.End_Date__c && Math.mod(Date.newInstance(1900, 1, 7).daysBetween(LREQUEST.Start_Date__c),7)!=0 && Math.mod(Date.newInstance(1900, 1, 7).daysBetween(LREquest.Start_Date__c),7)!=6){
            number_of_vacation_days=1;
            
        }
        
        //Updating Record.
        lrequest.weekdays__c = number_of_vacation_days;
        
    }
       update RRequest; 
}
}