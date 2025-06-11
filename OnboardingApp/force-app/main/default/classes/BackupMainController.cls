public class BackupMainController {
    String empId='';
    //********************************** EMPLOYEE INFO CRUD FUNCTION CALLS TO DML *******************************************
    @RemoteAction
    public static JK_Employee__c fetchEmployee(Id employeeId)
    {
        return DML.getInstance().fetchEmployee(employeeId);
    }
    @RemoteAction
    public static JK_Employee__c saveEmployee(String firstName, String midName, String lastName,
                                              String dob, String maritalStatus, String gender,
                                              String bloodGroup, String nationality, String email,
                                              String telephone, String mobile,String tShirt,
                                              String resAddress, String resCity, String resState,
                                              String resCode, String foodPref,String lang1,Boolean lang1Read,
                                              Boolean lang1Write,Boolean lang1Speak, String lang2,
                                              Boolean lang2Read, Boolean lang2Write, Boolean lang2Speak,
                                              String lang3, Boolean lang3Read, Boolean lang3Write,
                                              Boolean lang3Speak,Id employeeId){
    
    JK_Employee__c emp= DML.getInstance().saveEmployee(firstName,midName,lastName,dob,maritalStatus,gender,
                                                        bloodGroup,nationality,email,telephone,mobile,
                                                        tShirt,resAddress,resCity,resState,resCode,foodPref,lang1,lang1Read,
                                                        lang1Write,lang1Speak,lang2,lang2Read,lang2Write,lang2Speak,
                                                        lang3,lang3Read,lang3Write,lang3Speak,employeeId);
    return emp;                                            
    }
    @RemoteAction
    public static JK_Employee__c saveCommAddress(Boolean commonAddressCheck, String commAddress, String commCity,
                                                 String commState, String commZipcode, Id employeeId)
    {
        JK_Employee__c emp = DML.getInstance().saveCommAddress(commonAddressCheck,commAddress,commCity,
                                                                commState,commZipcode,employeeId);
        return emp;
    }

    //********************************** FAMILY INFO CRUD FUNCTION CALLS TO DML *******************************************
	@RemoteAction
	public static JK_FamilyInfo__c insertUpdateFamilyInfo(String relation , String fname , String mname , String lname , String dob, String recordId,String empId)
	{
		return DML.getInstance().saveUpdateFamilyInfo(relation,fname,mname,lname,dob,recordId,empId);
	}
	@RemoteAction
	public static List<JK_FamilyInfo__c> getFamilyInfo(String empId)
	{
		return DML.getInstance().fetchFamilyInfo(empId);
	}

	@RemoteAction
	public static void deleteFamilyInfoRecord(String recordId , String empId )
	{
		DML.getInstance().deleteFamilyInfo(empId, recordId);
	}
    
    //********************************** KYC INFO CRUD FUNCTION CALLS TO DML *******************************************
    @RemoteAction
    public static JK_KycDetail__c saveKyc(Id empId,String document,String nameondoc, String docnumber, String remarks,Id recordId , String expDate , String ifscCode)
    {   
        JK_KycDetail__c emp = DML.getInstance().saveKyc(empId,document,nameondoc,docnumber,remarks,recordId,expDate,ifscCode);
        System.debug(recordId);
        return emp;
    }
    @RemoteAction
    public static List<JK_KycDetail__c> fetchKyc(Id empId){

        List<JK_KycDetail__c> records = DML.getInstance().fetchKyc(empId);
        System.debug(records);
        return records;
    }
    @RemoteAction
    public static String deleteKyc(Id recordId){
        String res=DML.getInstance().deleteKyc(recordId);
        return res;
    }
    
    //********************************** EDUCATIONAL INFO CRUD FUNCTION CALLS TO DML *******************************************
    @RemoteAction 
    public static String deleteEducationalDetail(Id recordID){
    String deleteEducationalQualificationStatus= DML.getInstance().deleteEducationalDetail(recordID);
    return deleteEducationalQualificationStatus;
    }
    
    @RemoteAction
    public static JK_EducationalQualification__c saveOrUpdateEducationalDetail(Id employeeId,String educationalLevel,String degree,String boardOrUniversity,String schoolOrCollegeName,String yearOfPassing,String percentageMarks,String branch, String specialisation, String postGradDegree, String marksType, Id recordId){
        System.debug(employeeId+'Id'+educationalLevel+'Level'+degree+'Degree'+boardOrUniversity+'board/university'+schoolOrCollegeName+'school name'+yearOfPassing+'year of passing'+percentageMarks+'percentage'+recordId+'record Id');       
        System.debug(recordId);
        JK_EducationalQualification__c detailList=DML.getInstance().saveOrUpdateEducationalDetail(employeeId,educationalLevel,degree,boardOrUniversity,schoolOrCollegeName,yearOfPassing,percentageMarks,branch,specialisation,postGradDegree,marksType,recordId);
        return detailList;
    }

    @RemoteAction
    public static List<JK_EducationalQualification__c> fetchEducationalQualificationData(Id employeeId){      
        System.debug(employeeId);
        List<JK_EducationalQualification__c> eduDetails=DML.getInstance().fetchEducationalQualificationData(employeeId);
        System.debug(eduDetails);
        return eduDetails;
   }

       //********************************** WORKEXP INFO CRUD FUNCTION CALLS TO DML *******************************************

       @RemoteAction
       public static JK_WorkExperience__c insertUpdateWorkData(String recordID, String employeeID, String organisationName, 
       String designation, String startDate, String endDate, String reason)
       {   
        JK_WorkExperience__c work  = DML.getInstance().saveUpdateData(recordID, employeeID, organisationName, designation, startDate, endDate, reason);
           System.debug(recordId);
           return work;
       }
       @RemoteAction
       public static List<JK_WorkExperience__c> fetchWorkExpData(String employeeID){
           List<JK_WorkExperience__c> records = DML.getInstance().fetchWorkExp(employeeID);
           System.debug(records);
           return records;
       }
       @RemoteAction
       public static void deleteWorkExpData(String recordId, String employeeID){
        DML.getInstance().deleteWorkExp(recordId, employeeID);
       }

       //********************************** DOC LIST INFO CRUD FUNCTION CALLS TO DML *******************************************
        // @RemoteAction
        // public static List<JK_Employee__c> saveCheckList(Id empId, Boolean isResumeAvailable,Boolean isPhotoAvailable,Boolean isEduCertificatesAvailable,Boolean isSalarySlipAvailable,Boolean isPanCardAvailable,
        //                              Boolean isAddressProofAvailable,
        //     Boolean isProvidentFormAvailable,Boolean isGratuityFormAvailable,Boolean isOfferLetterAvailable,Boolean isExperienceLetterAvailable,
        //     Boolean isBankStatementAvailable,Boolean isBloodGroupAvailable,Boolean isCodeOfConductAvailable){
                
        //         List<JK_Employee__c> employee=DML.getInstance().saveCheckList(empId,isResumeAvailable,isPhotoAvailable,isEduCertificatesAvailable,isSalarySlipAvailable,
        //                                       isPanCardAvailable,isAddressProofAvailable,isProvidentFormAvailable,isGratuityFormAvailable,isOfferLetterAvailable,isExperienceLetterAvailable,
        //                                       isBankStatementAvailable,isBloodGroupAvailable,isCodeOfConductAvailable);
        //         return employee;    
        // }
        // @RemoteAction
        // public static JK_Employee__c fetchCheckList(Id empId){
        // JK_Employee__c employee=DML.getInstance().fetchCheckList(empId);
        // return employee;
        
        // }

    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////// IGNORE THE CODE BELOW
    ////////////////////////////////////////////////////////////////////////////////////
    @RemoteAction
    public static List<JK_FamilyInfo__c> insertUpdateFamilyInfoBulk(String data)
    {
        List<JK_FamilyInfo__c> jsonRecords = (List<JK_FamilyInfo__c>)JSON.deserialize(data, List<JK_FamilyInfo__c>.class);
        List<JK_FamilyInfo__c> records = new List<JK_FamilyInfo__c>();
        for(JK_FamilyInfo__c i : jsonRecords)
        {
            Schema.SObjectType objType = i.getSObjectType();
            Schema.DescribeSObjectResult objDescribe = objType.getDescribe();
            if (objDescribe.fields.getMap().containsKey('Id')) {
                // The object has a field named "Id"
                records.add(i);
            } else {
                // The object does not have a field named "Id"
                JK_FamilyInfo__c record = new JK_FamilyInfo__c();
                record.Fi_relation__c = i.Fi_relation__c;
		        record.Fi_firstName__c = i.Fi_firstName__c;
		        record.Fi_middleName__c = i.Fi_middleName__c;
		        record.Fi_lastName__c = i.Fi_lastName__c;
		        record.Fi_dob__c = i.Fi_dob__c;
                records.add(record);
            }
        }
        upsert records;
        return records;
    }
    @RemoteAction
    public static List<JK_EducationalQualification__c> saveOrUpdateEducationalDetailBulk(String jsonData)
    {
        List<JK_EducationalQualification__c> jsonRecords = (List<JK_EducationalQualification__c>)JSON.deserialize(jsonData, List<JK_EducationalQualification__c>.class);
        List<JK_EducationalQualification__c> records = new List<JK_EducationalQualification__c>();

        for(JK_EducationalQualification__c i : jsonRecords)
        {
            Schema.SObjectType objType = i.getSObjectType();
            Schema.DescribeSObjectResult objDescribe = objType.getDescribe();
            if (objDescribe.fields.getMap().containsKey('Id')) {
                // The object has a field named "Id"
                records.add(i);
            } else {
                // The object does not have a field named "Id"
                JK_EducationalQualification__c record = new JK_EducationalQualification__c();
                record.EQ_educationalLevel__c =i.EQ_educationalLevel__c;
                record.EQ_degree__c =  i.EQ_degree__c;
                record.EQ_schoolOrCollegeName__c= i.EQ_schoolOrCollegeName__c;
                record.EQ_boardOrUniversity__c=i.EQ_boardOrUniversity__c;
                record.EQ_percentageMarks__c=i.EQ_percentageMarks__c;
                record.EQ_yearOfPassing__c=i.EQ_yearOfPassing__c;
                record.EQ_branchTwelth__c=i.EQ_branchTwelth__c;
                record.EQ_specialisation__c=i.EQ_specialisation__c;
                record.EQ_postGradDegree__c=i.EQ_postGradDegree__c;
                record.EQ_marksType__c=i.EQ_marksType__c;
                record.EqToEmp__c=i.EqToEmp__c;
                records.add(record);
            }
        }
        upsert records;
        return records;
    }
    @RemoteAction
    public static void insertUpdateWorkDataBulk(String jsonData){
        List<JK_WorkExperience__c> jsonRecords = (List<JK_WorkExperience__c>)JSON.deserialize(jsonData, List<JK_WorkExperience__c>.class);
        List<JK_WorkExperience__c> records = new List<JK_WorkExperience__c>();

        for(JK_WorkExperience__c i : jsonRecords)
        {
            Schema.SObjectType objType = i.getSObjectType();
            Schema.DescribeSObjectResult objDescribe = objType.getDescribe();
            if (objDescribe.fields.getMap().containsKey('Id')) {
                // The object has a field named "Id"
                records.add(i);
            } else {
                JK_WorkExperience__c newRecord =new  JK_WorkExperience__c();
                    newRecord.WE_organizationName__c = i.WE_organizationName__c;
                    newRecord.WE_designationWhenLeaving__c =i.WE_designationWhenLeaving__c;
                    newRecord.WE_from__c = i.WE_from__c;
                    newRecord.WE_to__c =i.WE_to__c;
                    newRecord.WE_reasonForLeaving__c = i.WE_reasonForLeaving__c;
                    newRecord.WeToEmp__c=i.WeToEmp__c;
                    newRecord.WE_duration__c = i.WE_duration__c;
                    records.add(newRecord);
            }
        }
        upsert records;
    }
    @RemoteAction 
    public static void insertUpdateKycBulk(String jsonData)
    {
        List<JK_KycDetail__c> jsonRecords = (List<JK_KycDetail__c>)JSON.deserialize(jsonData, List<JK_KycDetail__c>.class);
        List<JK_KycDetail__c> records = new List<JK_KycDetail__c>();

        for(JK_KycDetail__c i : jsonRecords)
        {
            Schema.SObjectType objType = i.getSObjectType();
            Schema.DescribeSObjectResult objDescribe = objType.getDescribe();
            if (objDescribe.fields.getMap().containsKey('Id')) {
                // The object has a field named "Id"
                records.add(i);
            } else {
                JK_KycDetail__c newRecord =new  JK_KycDetail__c();
                    newRecord.Kyc_documentType__c = i.Kyc_documentType__c;
                    newRecord.Kyc_nameOnDocument__c =i.Kyc_nameOnDocument__c;
                    newRecord.Kyc_documentNumber__c = i.Kyc_documentNumber__c;
                    newRecord.Kyc_remarks__c = i.Kyc_remarks__c;
                    newRecord.KycToEmp__c = i.KycToEmp__c;
                    if (objDescribe.fields.getMap().containsKey('Kyc_expDate__c'))
                    {
                        newRecord.Kyc_expDate__c=i.Kyc_expDate__c;
                    }
                    if (objDescribe.fields.getMap().containsKey('Kyc_ifscCode__c'))
                    {
                        newRecord.Kyc_ifscCode__c=i.Kyc_ifscCode__c;
                    }
                    records.add(newRecord);
            }
        }
        upsert records;
    }


    // Document Checklist Employee

    @RemoteAction
    public static JK_Employee__c fetchCheckList(Id empId){
        List<JK_Employee__c> employee=[SELECT Emp_isBankStatementAvailable__c, Emp_isBloodGroupReportAvailable__c, Emp_isCodeOfConductAvailable__c, Emp_isEduCertificatesAvailable__c, Emp_isExperienceLetterAvailable__c, Emp_isGratuityFormAvailable__c, Emp_isPFNominationAvailable__c, Emp_isPanCardAvailable__c, Emp_isPhotoAvailable__c, Emp_isProofOfAddressAvailable__c, Emp_isResumeAvailable__c, Emp_isSalaryS__c, Emp_isSignedOfferLetterAvailable__c
                FROM JK_Employee__c where Id=:empId];
        System.debug(employee);
        if(employee.size()==0) return null;
        return employee[0];
    }


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



    @RemoteAction
    public static String FinalSubmission(Id empId){
        try {
            JK_Employee__c employee=[SELECT Emp_submittedDate__c,Emp_finalSubmission__c From JK_Employee__c where Id=:empId];
            employee.Emp_finalSubmission__c=true;

            DateTime myDateTime = DateTime.now();
            String dateTimeString = myDateTime.format('dd-MM-yyyy');

            employee.Emp_submittedDate__c=dateTimeString;
        
            update employee;
            return 'Success';

            
        } catch (Exception e) {

            return 'Failure';
            
        } 
    }
}