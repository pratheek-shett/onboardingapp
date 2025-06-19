public class bulkenter {
	public static void mains()
    {
        Integer i=1;
        for(Integer j=0;j<150;j++)
        {
        	String s ='prinson'+i;
        	JK_Employee__c ss = new JK_Employee__c(Emp_firstName__c =s , Emp_midName__c ='h');  
            i++;
            insert ss;
        }
    }
    public static void deletex()
    {
        List<JK_Employee__c> ss = [select Id from JK_Employee__c where Emp_midName__c ='h'];
        delete ss;
    }
}