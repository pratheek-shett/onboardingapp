import { LightningElement, track, wire , api } from 'lwc';
import getFieldSetFields from '@salesforce/apex/joiningAppHelper.getFieldSetFields';
import saveRecord from '@salesforce/apex/joiningAppHelper.saveRecord';

export default class JOININGAPP extends LightningElement {
    
    @track EmployeeField = [];
    @wire(getFieldSetFields , {objectName : 'JK_Employee__c' , fieldSetName :'Employee_Page'})
    getResult(result)
    {
        if(result.data)
        {
            console.log('the data retrieved is');
            console.log(result.data);
            result.data.forEach(element => {
                this.EmployeeField.push(element.apiName);
            });
            console.log('the EmployeeField Array ');
            console.log(JSON.stringify(this.EmployeeField));
        }
        if(result.error)
        {
            console.log('there was an error fetching the field set data');
        }
    }


}