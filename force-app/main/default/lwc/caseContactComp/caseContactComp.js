import ContactId from '@salesforce/schema/Case.ContactId';
import {getRecord,getFieldValue} from 'lightning/uiRecordApi';
import getProductDetails from '@salesforce/apex/GetProductDetails.getProductDetails';
import { LightningElement,track,wire,api } from 'lwc';
const fields = [ContactId];
const columns = [
{ label: 'ATM Fee in other currencies', fieldName: 'ATM_Fee_in_other_currencies__c' },
{ label: 'Card Replacement Cost', fieldName: 'Card_Replacement_Cost__c' },
{ label: 'Cost per Calendar Month', fieldName: 'Cost_per_Calendar_Month__c'},

];
export default class MyLWC extends LightningElement {
@api recordId; // get record id from the record page
data = [];
columns = columns;
// call the getproductDetails method 
@wire(getRecord, { recordId: '$recordId', fields })
loadFields({error, data}){
if(error){
    console.log('error', JSON.parse(JSON.stringify(error)));
}else if(data){
    getProductDetails({ContactID: getFieldValue(data, ContactId)})
    .then((result) => {
        this.data=result;
        
        
    })
    .catch((error) => {
        console.log('In connected call back error....');
        this.error = error;
        // This way you are not to going to see [object Object]
        console.log('Error is', this.error); 
    });
    
}
}

}