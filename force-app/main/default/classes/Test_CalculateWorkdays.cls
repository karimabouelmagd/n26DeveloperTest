@isTest
public class Test_CalculateWorkdays {
@isTest
   static void test_Workdays(){
       test.startTest();
       leave_request__c req = new leave_request__c();
       req.Start_Date__c=system.today();
       req.End_Date__c=system.today()+1;
       req.Type__c='Urgent Vacation';
       Insert req;
       leave_request__c req2 = new leave_request__c();
       req.Start_Date__c=system.today();
       req.End_Date__c=system.today();
       req.Type__c='sick Leave';
       Insert req2;
       
       List<id> reqId = new list<Id>();
           reqId.add(req.id);
       	   reqId.add(req2.id);
      
   CalculateWorkDays.CalcWorkingDays(reqId);
       
      // system.assertEquals(expected, actual, msg)
   
   test.stopTest();
   
   
   
   
   }
    
}