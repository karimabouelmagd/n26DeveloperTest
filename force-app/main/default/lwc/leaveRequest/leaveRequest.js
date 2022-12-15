import { LightningElement} from 'lwc';
import {track} from 'lwc';
import {wire}from'lwc'
import {getRecord} from 'lightning/uiRecordApi';
import takeaway from '@salesforce/resourceUrl/TakeAway';
import LeaveRequest_OBJECT from '@salesforce/schema/Leave_Request__c';

import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import {createRecord} from 'lightning/uiRecordApi';
import {NavigationMixin} from 'lightning/navigation'
import userId_FIELD from '@salesforce/user/Id';
import vacation_Days_FIELD from '@salesforce/schema/User.Vacation_Days__c';
import NAME_FIELD from '@salesforce/schema/User.Username';
import getcurrentUser from '@salesforce/apex/getUserDetails.getcurrentUser';
import getpicklistValues from '@salesforce/apex/SplitVacationList.splitVacationList';

import STARTDATE_FIELD from '@salesforce/schema/Leave_Request__c.Start_Date__c';
import ENDDATE_FIELD from '@salesforce/schema/Leave_Request__c.End_Date__c';



export default class LeaveRequest extends NavigationMixin(LightningElement) {
   
  @track name='';
  @track start_date='';
  @track End_date='';
  @track Leave_Type='';
  @track user;
  userId=userId_FIELD;
  @track error;
  @track vacation_Days;
  @wire(getcurrentUser, {
    recId: '$userId'
})
wiredUser({
    error,
    data
}) {
    if (data) {
        this.user = data;

    } else if (error) {

        this.error = error;

    }
}
    EndDateChange(event) {
       
        this.End_date=event.target.value;
    }
    StartdateChange(event) {
        this.start_date=event.target.value;
    }
    TypeChange(event) {
        this.Leave_Type=event.target.value;
    }
  
            
    
    createLR() {
        const fields = {'Start_Date__c':this.start_date,'End_Date__c':this.End_date,'Type__c':this.Leave_Type};
        
        const recordInput = { apiName: LeaveRequest_OBJECT.objectApiName, fields };
        createRecord(recordInput)
            .then(account => {
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Success',
                        message: 'Leave Request Has been Submitted',
                        variant: 'success',
                    }),
                    
                );
                this.template.querySelectorAll('lightning-input').forEach(element => {
                    if(element.type === 'checkbox' || element.type === 'checkbox-button'){
                      element.checked = false;
                    }else{
                      element.value = '';
                    }      
                  });
            })
            .catch(error => {
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Error creating record',
                        message: error.body.output.errors[0].message
                        ,
                        variant: 'error',
                    }),
                );
            });
           
                
           
              
            
    }   
}