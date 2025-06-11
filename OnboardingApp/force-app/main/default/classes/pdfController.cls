public with sharing class pdfController
{
    //Wrapper Class
    public class EmployeeInfo
    {
        JK_Employee__c employeeInfo;
        List<JK_KycDetail__c> employeeKycInfo;
        List< JK_FamilyInfo__c> employeeFamilyInfo;
        List <JK_EducationalQualification__c> employeeEducationInfo;
        List <JK_WorkExperience__c> employeeWorkInfo;
    }

    @RemoteAction
    public static EmployeeInfo pdfData(String employeeId)
    {
        EmployeeInfo e1 = new EmployeeInfo();
        e1.employeeInfo = [SELECT Emp_firstName__c, Emp_midName__c, Emp_lastName__c, Emp_dateOfBirth__c, 
                            Emp_maritalStatus__c, Emp_gender__c, Emp_bloodGroup__c, Emp_nationality__c, 
                            Emp_emailId__c, Emp_telephone__c, Emp_mobilePhone__c, Emp_resAddress__c,
                            Emp_resCity__c, Emp_resState__c, Emp_resZipCode__c, Emp_commonAddressCheck__c, 
                            Emp_commAddress__c, Emp_commCity__c, Emp_commState__c, Emp_commZipcode__c, 
                            Emp_tShirtSize__c, Emp_foodPref__c, Emp_lang1__c, Emp_lang1Read__c, 
                            Emp_lang1Write__c, Emp_lang1Speak__c, Emp_lang2__c, Emp_lang2Read__c, 
                            Emp_lang2Write__c, Emp_lang2Speak__c, Emp_lang3__c, Emp_lang3Read__c, 
                            Emp_lang3Write__c, Emp_lang3Speak__c
                            FROM JK_Employee__c WHERE Id = :employeeId];

        e1.employeeKycInfo = [SELECT Id,Kyc_documentType__c,Kyc_nameOnDocument__c,Kyc_documentNumber__c,
                                Kyc_remarks__c FROM JK_KycDetail__c WHERE KycToEmp__c = :employeeId ];
        
        e1.employeeFamilyInfo = [SELECT Id,Fi_firstName__c , Fi_middleName__c , Fi_lastName__c , Fi_relation__c , Fi_dob__c  
                                    FROM JK_FamilyInfo__c WHERE EmpToFi__c =: employeeId];

        e1.employeeEducationInfo = [SELECT EQ_boardOrUniversity__c, EQ_branchTwelth__c, EQ_degree__c, 
                                    EQ_educationalLevel__c, EQ_marksType__c, EQ_percentageMarks__c, 
                                    EQ_postGradDegree__c, EQ_schoolOrCollegeName__c, EQ_specialisation__c, 
                                    EQ_yearOfPassing__c, EqToEmp__c, Id
                                    FROM JK_EducationalQualification__c WHERE EqToEmp__c=:employeeId ORDER BY EQ_yearOfPassing__c ASC];

        e1.employeeWorkInfo = [SELECT Id, WE_organizationName__c, WE_designationWhenLeaving__c, WE_from__c, 
                                WE_to__c, WE_reasonForLeaving__c, WeToEmp__c 
                                FROM JK_WorkExperience__c WHERE WeToEmp__c =: employeeID];
        return e1;
    }
}