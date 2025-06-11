public class ExportController {
    @RemoteAction
    public static List<JK_Employee__c> showResults() {
        
        List<JK_Employee__c> empList = [SELECT Emp_firstName__c, Emp_midName__c, Emp_lastName__c, Emp_dateOfBirth__c, Emp_maritalStatus__c, Emp_gender__c, Emp_emailId__c, Emp_telephone__c FROM JK_Employee__c LIMIT 100];

        return empList;
    }
}