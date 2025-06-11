public with sharing class sknPage2Controller {
    public class EmployeeInfo
    {
        JK_Employee__c employeeInfo;
        List<JK_KycDetail__c> employeeKycInfo;
        List< JK_FamilyInfo__c> employeeFamilyInfo;
        List <JK_EducationalQualification__c> employeeEducationInfo;
        List <JK_WorkExperience__c> employeeWorkInfo;
    }
  
    @RemoteAction  
    public static JK_Employee__c addEmployee(String novigoEmailId,String password){
        
        List<JK_Employee__c> empoloyeeExist=[select Emp_novigoEmailId__c,Emp_password__c from JK_Employee__c where Emp_NovigoEmailId__c=:novigoEmailId];
        if(empoloyeeExist.size()==0){
            //employee does not exist, create candidate
            System.debug('Employee Does not Exist');
            DateTime myDateTime = DateTime.now();
            String dateTimeString = myDateTime.format('yyyy-MM-dd');
            System.debug(dateTimeString);
            String year=dateTimeString.split('-')[0];
            String month=dateTimeString.split('-')[1];
            String day=dateTimeString.split('-')[2];
            System.debug('year: '+year);
            System.debug('month: '+month);
            System.debug('day: '+day);
            //getting last employee for employee no
            List<JK_Employee__c> lastEmp=[Select Emp_userName__c from JK_Employee__c LIMIT 1];
            String username;
            //no employees exist
            if(lastEmp.size()==0){
                Integer empNo=1;
                userName='C'+year+month+day+'00'+String.valueOf(empNo);    
            }
            else{  
                List<JK_Employee__c>userList=[Select Emp_userName__c from JK_Employee__c ORDER BY createddate DESC];
                String emp=userList[0].Emp_userName__c;
                System.debug('empNo');
                System.debug(emp);
                Integer empNo=Integer.valueOf(emp.substring(9));
                empNo++;
                System.debug(empNo);
                if(empNo<10){
                    userName='C'+year+month+day+'00'+String.valueOf(empNo);
                }
                else if(empNo<100){
                  userName='C'+year+month+day+'0'+String.valueOf(empNo); 
                }
                else{
                userName='C'+year+month+day+String.valueOf(empNo);
                }
                System.debug(userName+' userName');
            }
            // insert employee with username and password
            JK_Employee__c newEmployee=new JK_Employee__c();
            newEmployee.Emp_novigoEmailId__c=novigoEmailId;
            newEmployee.Emp_password__c=password;
            newEmployee.Emp_userName__c=userName;
            insert newEmployee;
            return newEmployee;
        } 
        else{
            //employee exists 
            // here to change the password.
            System.debug('Employee exists.');
        }
       JK_Employee__c dum=new JK_Employee__c();
       return dum;
    }

    @RemoteAction 
    public static String deleteEmployee(Id recId){
      List<JK_Employee__c> employeeToDelete=[select Id,Emp_password__c from JK_Employee__c where Id=:recId];
      if(employeeToDelete.size()==0){
        return 'No Employee Exists';
      }
      else{
        delete employeeToDelete;
        return 'Successfully Deleted Employee';
      }
    }

    @RemoteAction 
    public static List<JK_Employee__c> fetchEmployees(){
        List<JK_Employee__c> employeeList=[select Id,Emp_password__c,Emp_userName__c,Emp_NovigoEmailId__c from JK_Employee__c];
        return employeeList;
    }

    @RemoteAction
    public static List<JK_Employee__c> exportToExcel(){
      List<JK_Employee__c> emp = DML.getInstance().exportToExcel();
      return emp;
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
                            Emp_isSignedOfferLetterAvailable_Admin__c, Emp_isSignedOfferLetterAvailable__c
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