@isTest
public class TestDataFactory {

    Public static account createaccount(){
        
        account acct = new account();
        acct.name = 'n26';
        insert acct;	
		return acct;	
    }
     Public static list<contact> createContact(){
        List <contact> contlist = new list<contact>();
        account acct = testdatafactory.createaccount();
        contact cont = new contact();
        cont.FirstName='karim';
        cont.lastname='Ahmed';
        cont.Home_Country__c='FR';
        cont.UUID__c='1234567';
        cont.Product__c='Metal';
        cont.AccountId=acct.id;   
        contlist.add(cont);
     
        contact cont2 = new contact();
        cont2.FirstName='karim';
        cont2.lastname='Ahmed';
        cont2.Home_Country__c='FR';
        cont2.UUID__c='12345674';
        //cont.Product__c='Metal';
        cont2.AccountId=acct.id;   
        contlist.add(cont2);
        insert contlist;
        return contlist;
        }
     Public static list<Case> createCase(){
     list<case>caselist = new list<case>();    
     account acct = testdatafactory.createaccount();
     list<contact> contlist = testdatafactory.createcontact();
        case case1 = new case();
        case1.origin = 'phone';
        case1.AccountId=acct.id;
        case1.ContactId=contlist[0].id;
        caselist.add(case1);
        
        case case2 = new case();
        case2.origin = 'phone';
        case2.AccountId=acct.id;
        case2.ContactId=contlist[1].id;
        caselist.add(case2); 
        insert caselist;
        return caselist;
        
    }
  
}