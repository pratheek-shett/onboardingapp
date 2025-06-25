public class EO_Login {
  public class EmployeeInfo
    {
        JK_Employee__c employeeInfo;
        List<JK_KycDetail__c> employeeKycInfo;
        List< JK_FamilyInfo__c> employeeFamilyInfo;
        List <JK_EducationalQualification__c> employeeEducationInfo;
        List <JK_WorkExperience__c> employeeWorkInfo;
    }

  @RemoteAction
  public static String check(String username , String password)
  {
    List<JK_Admin__c> adm = [SELECT Id,Adm_userName__c,Adm_password__c,Admin_lastUsedOn__c FROM JK_Admin__c where Adm_userName__c =:username];
    List<JK_Employee__c> user = [SELECT Id,Emp_password__c,Emp_initialLogin__c,Emp_finalSubmission__c ,Emp_lastModified__c from JK_Employee__c where Emp_userName__c =:username];
    if(adm.size()==0)
    {
      if(user.size()==0)
      {
        return 'User Name Does Not Exist!';
      }
      else
      {
        Integer userResult = password.compareTo(user[0].Emp_password__c);
        if(userResult != 0)
        {
          return 'Incorrect Password';
        }
        else
        {
          DateTime myDateTimes = DateTime.now();
          String dateTimeStrings = myDateTimes.format('yyyy-MM-dd HH:mm:ss'); 
          if(user[0].Emp_finalSubmission__c == true)
          {
            return 'You have already submitted the form, to download a copy click on the below shown button';
          }
          else {
            user[0].Emp_initialLogin__c=true;
            user[0].Emp_lastModified__c=dateTimeStrings;
            update user;
            return 'Success '+user[0].Id; 
          }
        }
      }
    }
    else
    {
      Integer passwordResult = password.compareTo(adm[0].Adm_password__c);
      if(passwordResult != 0)
      {
        return 'Incorrect Password';
      }
      else
      {
        DateTime myDateTimes = DateTime.now();
        String dateTimeStrings = myDateTimes.format('yyyy-MM-dd'); 
        adm[0].Admin_lastUsedOn__c = dateTimeStrings;
        update adm;
        return 'Admin '+adm[0].Id;
      }
    }
  }

  @RemoteAction
  public static Id getEmpId(String username, String password)
  {
      try
      {
        JK_Employee__c emp = [SELECT Id FROM JK_Employee__c WHERE Emp_userName__c =: username AND Emp_password__c =: password];
        return emp.Id;
      }
      catch(Exception e){
          return null;
      }
  }

  @RemoteAction
  public static EmployeeInfo pdfDataForUser(Id employeeId)
  {
    EmployeeInfo e1 = new EmployeeInfo();
    e1.employeeInfo = [SELECT Emp_firstName__c, Emp_midName__c, Emp_lastName__c, Emp_dateOfBirth__c, 
                        Emp_maritalStatus__c, Emp_gender__c, Emp_bloodGroup__c, Emp_nationality__c, 
                        Emp_emailId__c, Emp_telephone__c, Emp_mobilePhone__c, Emp_resAddress__c,
                        Emp_resCity__c, Emp_resState__c, Emp_resZipCode__c, Emp_commonAddressCheck__c, 
                        Emp_commAddress__c, Emp_commCity__c, Emp_commState__c, Emp_commZipcode__c, 
                        Emp_tShirtSize__c, Emp_foodPref__c, 
                        Emp_lang1__c, Emp_lang1Read__c, Emp_lang1Write__c, Emp_lang1Speak__c, 
                        Emp_lang2__c, Emp_lang2Read__c, Emp_lang2Write__c, Emp_lang2Speak__c, 
                        Emp_lang3__c, Emp_lang3Read__c, Emp_lang3Write__c, Emp_lang3Speak__c,
                        Emp_isBankStatementAvailable_Adminn__c, Emp_isBankStatementAvailable__c, 
                        Emp_isBloodGroupReportAvailable_Admin__c, Emp_isBloodGroupReportAvailable__c, 
                        Emp_isCodeOfConductAvailable_Admin__c, Emp_isCodeOfConductAvailable__c, 
                        Emp_isEduCertificatesAvailable_Admin__c, Emp_isEduCertificatesAvailable__c, 
                        Emp_isExperienceLetterAvailable_Admin__c, Emp_isExperienceLetterAvailable__c, 
                        Emp_isGratuityFormAvailable_Admin__c, Emp_isGratuityFormAvailable__c, 
                        Emp_isPFNominationAvailable_Admin__c, Emp_isPFNominationAvailable__c, 
                        Emp_isPanCardAvailable_Admin__c, Emp_isPanCardAvailable__c, 
                        Emp_isPhotoAvailable_Admin__c, Emp_isPhotoAvailable__c, 
                        Emp_isProofOfAddressAvailable_Admin__c, Emp_isProofOfAddressAvailable__c, 
                        Emp_isResumeAvailable_Admin__c, Emp_isResumeAvailable__c, 
                        Emp_isSalaryS__c, Emp_isSalarySlipAvailable_Admin__c, 
                        Emp_isSignedOfferLetterAvailable_Admin__c, Emp_isSignedOfferLetterAvailable__c,
                        Emp_EmergencyContact_Phone__c, Emp_EmergencyContact_Relation__c, Emp_Emergency__c,
                        Emp_dateOfJoining__c, Emp_isEmployeeDocumentVerficationDone__c
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