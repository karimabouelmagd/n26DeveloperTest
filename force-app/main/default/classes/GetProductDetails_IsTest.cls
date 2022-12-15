@IsTest
public class GetProductDetails_IsTest {
    @testSetup
    public static void Datasetup(){
       account acc = new Account(name='karim12123');
        insert acc;
    }
    @isTest
    public static void test_getproductdetails(){
        test.startTest();   
        account acct = new account();
        acct.name = 'n26';

        contact cont = new contact();
        cont.FirstName='karim';
        cont.lastname='Ahmed';
        cont.Home_Country__c='FR';
        cont.UUID__c='1234567';
        cont.Product__c='Metal';
        cont.AccountId=acct.id;   
        Insert cont;
        
        contact cont2 = new contact();
        cont2.FirstName='karim';
        cont2.lastname='Ahmed';
        cont2.Home_Country__c='FR';
        cont2.UUID__c='12345674';
        cont2.AccountId=acct.id;   
        Insert cont2;
        
        case case1 = new case();
        case1.origin = 'phone';
        case1.AccountId=acct.id;
        case1.ContactId=cont.id;
        Insert case1;
        
        case case2 = new case();
        case2.origin = 'phone';
        case2.AccountId=acct.id;
        case2.ContactId=cont2.id;
        Insert case2;
        
        test.stopTest();
        system.assertEquals(getproductdetails.getProductDetails(case1.contactId, ''), getproductdetails.getProductDetails('', cont.uuid__c));
        system.AssertEquals(1,getproductdetails.getProductDetails(case1.contactId, '').size());
        system.AssertEquals(1,getproductdetails.getProductDetails('', cont.uuid__c).size());
        system.assertequals('NA',getproductdetails.getProductDetails(case2.contactId, '')[0].masterlabel);
        system.assertEquals(getproductdetails.getProductDetails(case2.contactId, ''), getproductdetails.getProductDetails('', cont2.uuid__c));
        
    }
    
}