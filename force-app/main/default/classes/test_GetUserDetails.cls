@isTest
public class test_GetUserDetails {
    @isTest
   static void test_getuserDetails(){
    
    test.startTest();
    
   user U = getuserDetails.getcurrentUser(UserInfo.getUserId());
    system.assertEquals(UserInfo.getUserId(), U.Id, 'Right');
    test.stopTest();
                     
                     }                   
         }