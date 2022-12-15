public class OpportunityTriggerHandler {
    Public void createOrder(List<opportunity> OppList){
        List<order> orderList = new List<order>();
        for (opportunity opp : oppList){
            if(opp.StageName == 'closed won')
            {
                order newOrder = new order();
                newOrder.Effectivedate = opp.CloseDate;
                newOrder.Pricebook2Id = opp.Pricebook2Id;
                newOrder.OpportunityId = opp.id;
                newOrder.AccountId = opp.AccountId;
                newOrder.Status = 'Draft';
                
                OrderList.add(newOrder);
                
            }  
            
        }
        if(!orderlist.isEmpty()){
            insert orderlist;
            createOrderLineItems(orderlist);
        }
    }
    Public void createOrderLineItems(list<order> ordersList){
        List<OrderItem> orderLI = new list<OrderItem>();
        list<string> oppIds = new list<string>();
        map<string,List<OpportunityLineItem>> oppProducts = new  map<string,List<OpportunityLineItem>>();
        List<OpportunityLineItem> prodList = new list<OpportunityLineItem>();
        system.debug('karim '+ordersList);
        for (order ord : ordersList){
            oppids.add(ord.OpportunityId);
        }
        oppProducts= getOppProd(oppids);
        for (order ord : orderslist){
            if(oppProducts.containsKey(ord.OpportunityId)){
                prodList = oppProducts.get(ord.OpportunityId);
                system.debug('karim opp prod '+oppProducts.get(ord.OpportunityId));
                for (integer i = 0 ; i<prodList.size();i++){  
                    orderItem xxx = new orderItem(); 
                    xxx.Product2Id = prodList[i].product2id;
                    xxx.UnitPrice = prodList[i].listPrice;
                    xxx.Quantity = prodList[i].quantity;
                    xxx.ListPrice = prodList[i].listPrice;
                    xxx.PricebookEntryId = prodlist[i].pricebookentryid;
                    xxx.OrderId = ord.Id;
                    orderLI.add(xxx);
                }
            }
            
        }
        system.debug('Karim OrderLI'+orderLI);
        insert orderLI;
    }
    public map<string,List<OpportunityLineItem>> getOppProd (list<string> oppList){
        Map<string,List<opportunityLineItem>> OppProdbyId = new Map<string,List<opportunityLineItem>>();
        //   list<opportunityLineItem> opportunityProducts = new List<opportunityLineItem>();
        for(opportunityLineItem oppLI : [select Id,PricebookEntryId,opportunityid,Product2Id,Quantity,ListPrice from opportunityLineItem where opportunityId in :opplist]){
            if(!OppProdbyId.containskey(oppLI.opportunityId)){
                OppProdbyId.put(oppLI.opportunityId,new list<opportunitylineitem>()); 
                
            }
            if (OppProdbyId.containskey(oppLI.opportunityId)) { 
                OppProdbyId.get(oppLI.opportunityId).add(oppLI);
            }
            
            
        }
        
        system.debug('karim map' +OppProdbyId) ;
        return OppProdbyId;
    }
    
}