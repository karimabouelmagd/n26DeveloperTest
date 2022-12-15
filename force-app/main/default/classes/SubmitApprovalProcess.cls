public class SubmitApprovalProcess {
    private void SubmitApprovalProcess(id oppId){
 Approval.ProcessSubmitRequest [] requestList = new Approval.ProcessSubmitRequest []{};        
 Approval.ProcessSubmitRequest req1 = new Approval.ProcessSubmitRequest();
 req1.setComments('Submitting request for approval.');
 req1.setObjectId(oppid);
 
 // Submit the record to specific process
 req1.setProcessDefinitionNameOrId('Opportunity Amount Process');
 
 
 
 
 if(requestList.size()>0)
 // Submit the approval request for the opportunity
 Approval.ProcessResult[] result = Approval.process(requestList);
 

    }
    
}