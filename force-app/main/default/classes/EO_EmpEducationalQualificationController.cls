public class EO_EmpEducationalQualificationController {
    @RemoteAction
   public static List<JK_EducationalQualification__c> fetchEducationalQualificationData(Id employeeId){
        System.debug(employeeId);
        List<JK_EducationalQualification__c> eduDetails=EO_EDML.getInstance().fetchEducationalQualificationData(employeeId);
        System.debug(eduDetails);
       return eduDetails;
   }
    
    @RemoteAction
    public static JK_EducationalQualification__c saveOrUpdateEducationalDetail(Id employeeId,String educationalLevel,String degree,String boardOrUniversity,String schoolOrCollegeName,String yearOfPassing,String percentageMarks, Id recordId){

        System.debug(employeeId+'Id'+educationalLevel+'Level'+degree+'Degree'+boardOrUniversity+'board/university'+schoolOrCollegeName+'school name'+yearOfPassing+'year of passing'+percentageMarks+'percentage'+recordId+'record Id');
       // JK_EducationalQualification__c detail=[select EQ_educationalLevel__c,EQ_degree__c,EQ_boardOrUniversity__c,EQ_schoolOrCollegeName__c,EQ_yearOfPassing__c,EQ_percentageMarks__c from JK_EducationalQualification__c where EqToEmp__c=:employeeId AND Id=:recordId];
        System.debug(recordId);
        JK_EducationalQualification__c detailList=EO_EDML.getInstance().saveOrUpdateEducationalDetail(employeeId,educationalLevel,degree,boardOrUniversity,schoolOrCollegeName,yearOfPassing,percentageMarks,recordId);
   return detailList;
}

@RemoteAction 
public static String deleteEducationalDetail(Id recordID){

   // JK_KycDetail__c recordToBeDeleted = [SELECT Kyc_documentType__c,Kyc_nameOnDocument__c,Kyc_documentNumber__c,Kyc_remarks__c FROM JK_KycDetail__c WHERE Id=:id];
      
    String deleteEducationalQualificationStatus= EO_EDML.getInstance().deleteEducationalDetail(recordID);

    return deleteEducationalQualificationStatus;

} 
}