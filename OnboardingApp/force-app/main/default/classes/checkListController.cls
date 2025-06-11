public class checkListController {

    @RemoteAction
    public static List<JK_Employee__c> saveCheckList(Id empId, Boolean isResumeAvailable,Boolean isPhotoAvailable,Boolean isEduCertificatesAvailable,Boolean isSalarySlipAvailable,Boolean isPanCardAvailable,
                                     Boolean isAddressProofAvailable,
            Boolean isProvidentFormAvailable,Boolean isGratuityFormAvailable,Boolean isOfferLetterAvailable,Boolean isExperienceLetterAvailable,
            Boolean isBankStatementAvailable,Boolean isBloodGroupAvailable,Boolean isCodeOfConductAvailable){
                
                List<JK_Employee__c> employee=[SELECT Emp_isBankStatementAvailable__c, Emp_isBloodGroupReportAvailable__c, Emp_isCodeOfConductAvailable__c, Emp_isEduCertificatesAvailable__c, Emp_isExperienceLetterAvailable__c, Emp_isGratuityFormAvailable__c, Emp_isPFNominationAvailable__c, Emp_isPanCardAvailable__c, Emp_isPhotoAvailable__c, Emp_isProofOfAddressAvailable__c, Emp_isResumeAvailable__c, Emp_isSalaryS__c, Emp_isSignedOfferLetterAvailable__c
                FROM JK_Employee__c where Id=:empId];
                if(employee.size()==0) return null;
                
                
                employee[0].Emp_isBankStatementAvailable__c=isBankStatementAvailable;
                employee[0].Emp_isBloodGroupReportAvailable__c=isBloodGroupAvailable;
                employee[0].Emp_isCodeOfConductAvailable__c=isCodeOfConductAvailable;
                employee[0].Emp_isEduCertificatesAvailable__c=isEduCertificatesAvailable;
                employee[0].Emp_isExperienceLetterAvailable__c=isExperienceLetterAvailable;
                employee[0].Emp_isGratuityFormAvailable__c=isGratuityFormAvailable;
                employee[0].Emp_isPFNominationAvailable__c=isProvidentFormAvailable;
                employee[0].Emp_isPanCardAvailable__c=isPanCardAvailable;
                employee[0].Emp_isPhotoAvailable__c=isPhotoAvailable;
                employee[0].Emp_isProofOfAddressAvailable__c=isAddressProofAvailable;
                employee[0].Emp_isResumeAvailable__c=isResumeAvailable;
                employee[0].Emp_isSalaryS__c=isSalarySlipAvailable;
                employee[0].Emp_isSignedOfferLetterAvailable__c=isOfferLetterAvailable;
                
                upsert employee;
                return employee;
        
    }
    
    @RemoteAction
    public static JK_Employee__c fetchCheckList(Id empId){
        List<JK_Employee__c> employee=[SELECT Emp_isBankStatementAvailable__c, Emp_isBloodGroupReportAvailable__c, Emp_isCodeOfConductAvailable__c, Emp_isEduCertificatesAvailable__c, Emp_isExperienceLetterAvailable__c, Emp_isGratuityFormAvailable__c, Emp_isPFNominationAvailable__c, Emp_isPanCardAvailable__c, Emp_isPhotoAvailable__c, Emp_isProofOfAddressAvailable__c, Emp_isResumeAvailable__c, Emp_isSalaryS__c, Emp_isSignedOfferLetterAvailable__c
                FROM JK_Employee__c where Id=:empId];
        System.debug(employee);
        if(employee.size()==0) return null;
        return employee[0];
    }

    @RemoteAction
    public static List<JK_Employee__c> saveOrUpdateVerification(Id empId, Boolean bankVerify,Boolean bloodGroupVerify,Boolean codeOfConductVerify,Boolean eduCertificateVerify,Boolean experienceLetterVerify,
    Boolean gratuityFormVerify,Boolean PFNominationVerify, Boolean panCardVerify,Boolean photoVerify,
    Boolean proofOfAddressVerify,Boolean salarySlipVerify, Boolean offerLetterVerify, Boolean resumeVerify){
        List<JK_Employee__c> employee=[SELECT Emp_isBankStatementAvailable_Adminn__c, Emp_isBloodGroupReportAvailable_Admin__c, Emp_isCodeOfConductAvailable_Admin__c, Emp_isEduCertificatesAvailable_Admin__c, Emp_isExperienceLetterAvailable_Admin__c, Emp_isGratuityFormAvailable_Admin__c, Emp_isPFNominationAvailable_Admin__c, Emp_isPanCardAvailable_Admin__c, Emp_isPhotoAvailable_Admin__c, Emp_isProofOfAddressAvailable_Admin__c, Emp_isSalarySlipAvailable_Admin__c, Emp_isSignedOfferLetterAvailable_Admin__c, Emp_isResumeAvailable_Admin__c
        FROM JK_Employee__c where Id=:empId];

        if(employee.size()==0) return null;

        employee[0].Emp_isBankStatementAvailable_Adminn__c=bankVerify;
        employee[0].Emp_isBloodGroupReportAvailable_Admin__c=bloodGroupVerify;
        employee[0].Emp_isCodeOfConductAvailable_Admin__c=codeOfConductVerify;
        employee[0].Emp_isEduCertificatesAvailable_Admin__c=eduCertificateVerify;
        employee[0].Emp_isExperienceLetterAvailable_Admin__c=experienceLetterVerify;
        employee[0].Emp_isGratuityFormAvailable_Admin__c=gratuityFormVerify;
        employee[0].Emp_isPFNominationAvailable_Admin__c=PFNominationVerify;
        employee[0].Emp_isPanCardAvailable_Admin__c=panCardVerify;
        employee[0].Emp_isPhotoAvailable_Admin__c=photoVerify;
        employee[0].Emp_isProofOfAddressAvailable_Admin__c=proofOfAddressVerify;
        employee[0].Emp_isSalarySlipAvailable_Admin__c=salarySlipVerify;
        employee[0].Emp_isSignedOfferLetterAvailable_Admin__c=offerLetterVerify;
        employee[0].Emp_isResumeAvailable_Admin__c=resumeVerify;

        upsert employee;
        return employee;
        

    }

     


    @RemoteAction 
    public static JK_Employee__c fetchAdminCheckListVerification(Id empId){
        List<JK_Employee__c> documentVerifyStatus=[SELECT Emp_isBankStatementAvailable_Adminn__c, Emp_isBloodGroupReportAvailable_Admin__c, Emp_isCodeOfConductAvailable_Admin__c, Emp_isEduCertificatesAvailable_Admin__c, Emp_isExperienceLetterAvailable_Admin__c, Emp_isGratuityFormAvailable_Admin__c, Emp_isPFNominationAvailable_Admin__c, Emp_isPanCardAvailable_Admin__c, Emp_isPhotoAvailable_Admin__c, Emp_isProofOfAddressAvailable_Admin__c, Emp_isSalarySlipAvailable_Admin__c, Emp_isSignedOfferLetterAvailable_Admin__c, Emp_isResumeAvailable_Admin__c
        FROM JK_Employee__c where Id=:empId];
        System.debug(documentVerifyStatus);
        if(documentVerifyStatus.size()==0) return null;
        return documentVerifyStatus[0];
    }

    
}