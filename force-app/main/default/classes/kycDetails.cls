public class kycDetails {

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
    public static JK_Employee__c fetchEmployee(Id employeeId)
    {
        return DML.getInstance().fetchEmployee(employeeId);
    }

    @RemoteAction
    public static JK_KycDetail__c saveKyc(Id empId,String document,String nameondoc, String docnumber, String remarks,Id id)
    {   
        JK_KycDetail__c emp = DML.getInstance().saveKyc(empId,document,nameondoc,docnumber,remarks,id,null,null);
        System.debug(Id);
        return emp;
    }
    @RemoteAction
    public static List<JK_KycDetail__c> fetchKyc(Id empId){

        List<JK_KycDetail__c> records = DML.getInstance().fetchKyc(empId);
        System.debug(records);
        return records;
    }
    @RemoteAction
    public static String deleteKyc(Id Id){
        String res=DML.getInstance().deleteKyc(Id);
        return res;
    }  
}