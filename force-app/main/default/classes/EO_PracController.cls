public with sharing class EO_PracController 
{
   
    //Wrapper Class
    public class EmployeeInfo
    {
        JK_Employee__c basicEmployeeInfo;
        List <JK_WorkExperience__c> employeeWorkExperience;
        List< JK_FamilyInfo__c> employeeFamilyInfo;
    }


    @RemoteAction
    public static EmployeeInfo employeeData()
    {
        String Id = 'a025h00000t9H7TAAU';
        EmployeeInfo e1 = new EmployeeInfo();
        e1.basicEmployeeInfo = [SELECT Id from JK_Employee__c WHERE Id = :Id];
        e1.employeeFamilyInfo = [SELECT CreatedById, CreatedDate, EmpToFi__c, Fi_dob__c, Fi_firstName__c, Fi_lastName__c, Fi_middleName__c, Fi_relation__c, Id, IsDeleted, LastModifiedById, LastModifiedDate, LastReferencedDate, LastViewedDate, Name, SystemModstamp FROM JK_FamilyInfo__c WHERE EmpToFi__c = :Id];
        e1.employeeWorkExperience = [SELECT Id, WE_organizationName__c, WE_designationWhenLeaving__c, WE_from__c, WE_to__c, WE_reasonForLeaving__c, WeToEmp__c FROM JK_WorkExperience__c  WHERE WeToEmp__c =: Id];
        //same or work and family
        return e1;
    }
}