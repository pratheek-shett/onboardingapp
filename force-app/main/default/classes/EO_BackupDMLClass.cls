public class EO_BackupDMLClass {
    private static DML uniqueInstance;

    public static DML getInstance()
    {
        if(uniqueInstance == null)
        {
            uniqueInstance = new DML();
        }
        return uniqueInstance;
    }
    public JK_KycDetail__c saveKyc(Id empId,String document,String nameondoc, String docnumber, String remarks,Id id,String expDate , String ifscCode){
        
        System.debug(Id);
        try{
            JK_KycDetail__c emp = [SELECT Kyc_documentType__c,Kyc_nameOnDocument__c,Kyc_documentNumber__c,Kyc_remarks__c FROM JK_KycDetail__c WHERE Id = :id AND KycToEmp__c= :empId];
            emp.Kyc_documentType__c=document;
            emp.Kyc_nameOnDocument__c=nameondoc;
            emp.Kyc_documentNumber__c=docnumber;    
            emp.Kyc_remarks__c=remarks;
            emp.Kyc_expDate__c = expDate;
            emp.Kyc_ifscCode__c = ifscCode;
            if(expDate == null)
            {
                emp.Kyc_expDate__c = '';
            }
            if(ifscCode == null)
            {
                emp.Kyc_ifscCode__c = '';
            }   
            update emp;
            return emp;
        }
        catch(Exception e){
            JK_KycDetail__c emp = new JK_KycDetail__c(KycToEmp__c= empId);
            emp.Kyc_documentType__c=document;
            emp.Kyc_nameOnDocument__c=nameondoc;
            emp.Kyc_documentNumber__c=docnumber;
            emp.Kyc_remarks__c=remarks;
            emp.Kyc_expDate__c = expDate;
            emp.Kyc_ifscCode__c = ifscCode;
            if(expDate == null)
            {
                emp.Kyc_expDate__c = '';
            }
            if(ifscCode == null)
            {
                emp.Kyc_ifscCode__c = '';
            }   
            upsert emp;
           	return emp;
        }
    }
    public List<JK_KycDetail__c> fetchKyc(Id empId){

        List<JK_KycDetail__c> details = [SELECT Id,Kyc_documentType__c,Kyc_nameOnDocument__c,Kyc_documentNumber__c,Kyc_remarks__c FROM JK_KycDetail__c WHERE KycToEmp__c = :empId ];
        System.debug(details);
        return details;
    }

    public String deleteKyc(Id id){

        JK_KycDetail__c rec = [SELECT Kyc_documentType__c,Kyc_nameOnDocument__c,Kyc_documentNumber__c,Kyc_remarks__c FROM JK_KycDetail__c WHERE Id=:id];
        DELETE rec;
        return 'Success';
    }
    
    public JK_Employee__c saveEmployee(String firstName, String midName, String lastName,
                                              String dob, String maritalStatus, String gender,
                                              String bloodGroup, String nationality, String email,
                                              String telephone, String mobile,String tShirt,
                                              String resAddress, String resCity, String resState,
                                              String resCode, String foodPref,String lang1,Boolean lang1Read,
                                              Boolean lang1Write,Boolean lang1Speak, String lang2,
                                              Boolean lang2Read, Boolean lang2Write, Boolean lang2Speak,
                                              String lang3, Boolean lang3Read, Boolean lang3Write,
                                              Boolean lang3Speak, Id employeeId){

            JK_Employee__c emp = [SELECT Emp_firstName__c,Emp_midName__c,Emp_lastName__c,Emp_dateOfBirth__c,Emp_maritalStatus__c,
                                 Emp_gender__c,Emp_bloodGroup__c,Emp_nationality__c,Emp_emailId__c,Emp_telephone__c,Emp_mobilePhone__c,
                                 Emp_tShirtSize__c,Emp_resAddress__c,Emp_resCity__c,Emp_resState__c,Emp_resZipCode__c,
                                 Emp_foodPref__c,Emp_lang1__c,Emp_lang1Read__c,Emp_lang1Write__c,Emp_lang1Speak__c,
                                 Emp_lang2__c,Emp_lang2Read__c,Emp_lang2Write__c,Emp_lang2Speak__c,Emp_lang3__c,Emp_lang3Read__c,
                                 Emp_lang3Write__c,Emp_lang3Speak__c FROM JK_Employee__c WHERE Id = :employeeId];
            emp.Emp_firstName__c=firstName;
            emp.Emp_midName__c=midName;
            emp.Emp_lastName__c=lastName;
            emp.Emp_dateOfBirth__c=dob;
            emp.Emp_maritalStatus__c=maritalStatus;
            emp.Emp_gender__c=gender;
            emp.Emp_bloodGroup__c=bloodGroup;
            emp.Emp_nationality__c=nationality;
            emp.Emp_emailId__c=email;
            emp.Emp_telephone__c=telephone;
            emp.Emp_mobilePhone__c=mobile;
            emp.Emp_tShirtSize__c=tShirt;
            emp.Emp_resAddress__c=resAddress;
            emp.Emp_resCity__c=resCity;
            emp.Emp_resState__c=resState;
            emp.Emp_resZipCode__c=resCode;
            emp.Emp_foodPref__c=foodPref;
            emp.Emp_lang1__c=lang1;
            emp.Emp_lang1Read__c=lang1Read;
            emp.Emp_lang1Write__c=lang1Write;
            emp.Emp_lang1Speak__c=lang1Speak;
            emp.Emp_lang2__c=lang2;
            emp.Emp_lang2Read__c=lang2Read;
            emp.Emp_lang2Write__c=lang2Write;
            emp.Emp_lang2Speak__c=lang2Speak;
            emp.Emp_lang3__c=lang3;
            emp.Emp_lang3Read__c=lang3Read;
            emp.Emp_lang3Write__c=lang3Write;
            emp.Emp_lang3Speak__c=lang3Speak;
            upsert emp;
            return emp;
    
        }
    
    public JK_Employee__c fetchEmployee(Id employeeId)
    {
        try{
        JK_Employee__c emp = [SELECT Emp_firstName__c,Emp_midName__c,Emp_lastName__c,Emp_dateOfBirth__c,Emp_maritalStatus__c,
                                 Emp_gender__c,Emp_bloodGroup__c,Emp_nationality__c,Emp_emailId__c,Emp_telephone__c,Emp_mobilePhone__c,
                                 Emp_tShirtSize__c,Emp_resAddress__c,Emp_resCity__c,Emp_resState__c,Emp_resZipCode__c,
                                 Emp_foodPref__c,Emp_lang1__c,Emp_lang1Read__c,Emp_lang1Write__c,Emp_lang1Speak__c,
                                 Emp_lang2__c,Emp_lang2Read__c,Emp_lang2Write__c,Emp_lang2Speak__c,Emp_lang3__c,Emp_lang3Read__c,
                                 Emp_lang3Write__c,Emp_lang3Speak__c,Emp_commonAddressCheck__c,Emp_commAddress__c,
                                 Emp_commCity__c,Emp_commState__c,Emp_commZipcode__c FROM JK_Employee__c WHERE Id = :employeeId];
        return emp;
        }
        catch(Exception e){
            return null;
        }
    }
    public JK_Employee__c saveCommAddress(Boolean commonAddressCheck, String commAddress, String commCity,
                                             String commState, String commZipcode, Id employeeId)
    {
        JK_Employee__c emp=[SELECT Emp_commonAddressCheck__c, Emp_commAddress__c, Emp_commCity__c,
                            Emp_commState__c,Emp_commZipcode__c FROM JK_Employee__c WHERE Id = :employeeId];
        emp.Emp_commonAddressCheck__c=commonAddressCheck;
        emp.Emp_commAddress__c=commAddress;
        emp.Emp_commCity__c=commCity;
        emp.Emp_commState__c=commState;
        emp.Emp_commZipcode__c=commZipcode;
        upsert emp;
        return emp;
    }

    public List<JK_FamilyInfo__c> fetchFamilyInfo(String empId)
    {
        List<JK_FamilyInfo__c> records = [select Id,Fi_firstName__c , Fi_middleName__c , Fi_lastName__c , Fi_relation__c , Fi_dob__c  from JK_FamilyInfo__c where EmpToFi__c=:empId];
        return records;
    }
    public void deleteFamilyInfo(String empId , String  recordId)
    {
        JK_FamilyInfo__c record = [select Id from JK_FamilyInfo__c where Id=:recordId AND EmpToFi__c=:empId];
        delete record;
    }

    public  JK_FamilyInfo__c saveUpdateFamilyInfo(String relation , String fname , String mname , String lname , String dob, String rId,String empId)
    {
        if(rId == 'new')
		{
			System.debug('insert called family');
			Jk_FamilyInfo__c newRecord = new Jk_FamilyInfo__c(EmpToFi__c =empId);
			newRecord.Fi_relation__c = relation;
			newRecord.Fi_firstName__c = fname;
			newRecord.Fi_middleName__c = mname;
			newRecord.Fi_lastName__c = lname;
			newRecord.Fi_dob__c = dob;
			insert newRecord;
			return newRecord;
		}
		else {
			List<JK_FamilyInfo__c> record = [select Id , Fi_firstName__c , Fi_middleName__c , Fi_lastName__c , Fi_relation__c , Fi_dob__c from JK_FamilyInfo__c where EmpToFi__c=:empId AND Id=:rId];
			Jk_FamilyInfo__c existingRecord = record[0];
			existingRecord.Fi_relation__c = relation;
			existingRecord.Fi_firstName__c = fname;
			existingRecord.Fi_middleName__c = mname;
			existingRecord.Fi_lastName__c = lname;
			existingRecord.Fi_dob__c = dob;
			update existingRecord;
			System.debug('update called family');
			return existingRecord;
		}
    }

    public List<JK_EducationalQualification__c> fetchEducationalQualificationData(Id employeeId){
        System.debug(employeeId);
        List<JK_EducationalQualification__c> eduDetails=[select EQ_educationalLevel__c,EQ_degree__c,EQ_boardOrUniversity__c,EQ_schoolOrCollegeName__c,EQ_yearOfPassing__c,EQ_percentageMarks__c from JK_EducationalQualification__c where EqToEmp__c=:employeeId];
        System.debug(eduDetails);
        return eduDetails;
   }

   //EDUCATION
   public JK_EducationalQualification__c saveOrUpdateEducationalDetail(Id employeeId,String educationalLevel,String degree,String boardOrUniversity,String schoolOrCollegeName,String yearOfPassing,String percentageMarks,String branch, String specialisation, String postGradDegree, String marksType, Id recordId){
    System.debug(employeeId+'Id'+educationalLevel+'Level'+degree+'Degree'+boardOrUniversity+'board/university'+schoolOrCollegeName+'school name'+yearOfPassing+'year of passing'+percentageMarks+'percentage'+recordId+'record Id');
    System.debug(recordId);
    List<JK_EducationalQualification__c> detailList=[select EQ_educationalLevel__c,EQ_degree__c,EQ_boardOrUniversity__c,EQ_schoolOrCollegeName__c,EQ_yearOfPassing__c,EQ_percentageMarks__c,EQ_branchTwelth__c,EQ_postGradDegree__c,EQ_specialisation__c,EQ_marksType__c from JK_EducationalQualification__c where EqToEmp__c=:employeeId AND Id=:recordId];
    if(detailList.size()!=0)
    {
        detailList[0].EQ_educationalLevel__c=educationalLevel;
        detailList[0].EQ_degree__c=degree;
        detailList[0].EQ_boardOrUniversity__c=boardOrUniversity;
        detailList[0].EQ_schoolOrCollegeName__c=boardOrUniversity;
        detailList[0].EQ_percentageMarks__c=percentageMarks;
        detailList[0].EQ_yearOfPassing__c=yearOfPassing;
        detailList[0].EQ_branchTwelth__c=branch;
        detailList[0].EQ_marksType__c=marksType;
        detailList[0].EQ_postGradDegree__c=postGradDegree;
        detailList[0].EQ_specialisation__c=specialisation;
        System.debug('Data:'+detailList[0]);
        update detailList[0];
        return detailList[0];    
    } else {
        System.debug('Inside exception');
        JK_EducationalQualification__c eduQualificationData= new JK_EducationalQualification__c(EqToEmp__c=employeeId);
        eduQualificationData.EQ_educationalLevel__c=educationalLevel;
        eduQualificationData.EQ_degree__c=degree;
        eduQualificationData.EQ_boardOrUniversity__c=boardOrUniversity;
        eduQualificationData.EQ_schoolOrCollegeName__c=boardOrUniversity;
        eduQualificationData.EQ_percentageMarks__c=percentageMarks;
        eduQualificationData.EQ_yearOfPassing__c=yearOfPassing;
        eduQualificationData.EQ_branchTwelth__c=branch;
        eduQualificationData.EQ_marksType__c=marksType;
        eduQualificationData.EQ_postGradDegree__c=postGradDegree;
        eduQualificationData.EQ_specialisation__c=specialisation;
        System.debug('Data:'+eduQualificationData);
        System.debug('Id: '+eduQualificationData.Name);
        upsert eduQualificationData;
        return eduQualificationData;
    }
}

public String deleteEducationalDetail(Id recordID){
    System.debug('Record Id:'+recordID);
       
     List<JK_EducationalQualification__c> educationDetailToBeDeleted=[select EQ_educationalLevel__c,EQ_degree__c,EQ_boardOrUniversity__c,EQ_schoolOrCollegeName__c,EQ_yearOfPassing__c,EQ_percentageMarks__c from JK_EducationalQualification__c where Id=:recordID];
     if(educationDetailToBeDeleted.size()==0){
        System.debug('No rows found'+recordID);
        return 'Error';
     }
     delete educationDetailToBeDeleted;
     return 'Successfully Deleted';
 
 }

    //WORKEXP DML
    public JK_WorkExperience__c saveUpdateData (String recordID, 
                                                       String employeeID, 
                                                       String organisationName, 
                                                       String designation, 
                                                       String startDate, 
                                                       String endDate, 
                                                       String reason){
        if(recordID == 'new'){
            JK_WorkExperience__c  newWorkExp = new JK_WorkExperience__c (WeToEmp__c = employeeID);
            newWorkExp .WE_organizationName__c = organisationName;
            newWorkExp .WE_designationWhenLeaving__c = designation;
            newWorkExp .WE_from__c = startDate;
            newWorkExp .WE_to__c = endDate;
            newWorkExp .WE_reasonForLeaving__c = reason;
            insert newWorkExp;
            return newWorkExp;
        }
        else{
            List<JK_WorkExperience__c> updateWorkExp = [SELECT Id, WE_organizationName__c, WE_designationWhenLeaving__c, 
                       WE_from__c, WE_to__c, WE_reasonForLeaving__c, WeToEmp__c 
                       FROM JK_WorkExperience__c 
                       WHERE WeToEmp__c =: employeeID AND Id =: recordID];
            JK_WorkExperience__c workExp = updateWorkExp[0];
                workExp.WE_organizationName__c = organisationName;
                workExp.WE_designationWhenLeaving__c = designation;
                workExp.WE_from__c = startDate;
                workExp.WE_to__c = endDate;
                workExp.WE_reasonForLeaving__c = reason;
                update workExp;   
                return workExp;
        }
    }

    public List<JK_WorkExperience__c> fecthWorkExp(String employeeID){
        List<JK_WorkExperience__c> refreshedWorkExp = [SELECT Id, WE_organizationName__c, WE_designationWhenLeaving__c, 
                                        WE_from__c, WE_to__c, WE_reasonForLeaving__c, WeToEmp__c 
                                        FROM JK_WorkExperience__c 
                                        WHERE WeToEmp__c =: employeeID];
        return refreshedWorkExp;
    }

    
    public void deleteWorkExp(String recordId, String employeeID){
        JK_WorkExperience__c deletedWorkExp = [SELECT Id
                                                FROM JK_WorkExperience__c 
                                                WHERE WeToEmp__c =: employeeID AND Id =: recordID];
        delete deletedWorkExp;
    }
}