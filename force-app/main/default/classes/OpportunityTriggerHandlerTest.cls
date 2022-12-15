@isTest
private class OpportunityTriggerHandlerTest {
    @isTest static void CreateORderItems() {
      
        Account acct = new Account(Name='Test Account');
        insert acct;
        Opportunity opp = new Opportunity(Name=acct.Name + ' Opportunity',
                                          StageName='Prospecting',
                                          CloseDate=System.today().addMonths(1),
                                          AccountId=acct.Id);
        insert opp;
        //Create your product
        Product2 prod = new Product2(
            Name = 'Product X',
            ProductCode = 'Pro-X',
            isActive = true
        );
        insert prod;
        
        //Create your pricebook entry
        PricebookEntry pbEntry = new PricebookEntry(
            Pricebook2Id = Test.getStandardPricebookId(),
            Product2Id = prod.Id,
            UnitPrice = 100.00,
            IsActive = true
        );
        insert pbEntry;
        
        //create your opportunity line item.  This assumes you already have an opportunity created, called opp
        OpportunityLineItem oli = new OpportunityLineItem(
            OpportunityId = opp.Id,
            Quantity = 5,
            PricebookEntryId = pbEntry.Id,
            TotalPrice = 5 * pbEntry.UnitPrice
        );
        insert oli;
        
        // Perform test
        Test.startTest();
       
        opp.StageName = 'closed won';
         Database.saveresult result = Database.update(opp, false);
        Test.stopTest();
        System.assert(result.isSuccess());
        System.assert(result.getErrors().size() <= 0);
       }
}