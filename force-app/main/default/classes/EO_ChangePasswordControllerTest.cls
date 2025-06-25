/**
 * An apex page controller that exposes the change password functionality
 */
@IsTest public with sharing class EO_ChangePasswordControllerTest {
   	@IsTest(SeeAllData=true) public static void testChangePasswordController() {
        // Instantiate a new controller with all parameters in the page
        EO_ChangePasswordController controller = new EO_ChangePasswordController();
        controller.oldPassword = '123456';
        controller.newPassword = 'qwerty1'; 
        controller.verifyNewPassword = 'qwerty1';                
        
        System.assertEquals(controller.changePassword(),null);                           
    }    
}