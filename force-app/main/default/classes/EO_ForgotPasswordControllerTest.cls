/**
 * An apex page controller that exposes the site forgot password functionality
 */
@IsTest public with sharing class EO_ForgotPasswordControllerTest {
  	 @IsTest(SeeAllData=true) public static void testForgotPasswordController() {
    	// Instantiate a new controller with all parameters in the page
    	EO_ForgotPasswordController controller = new EO_ForgotPasswordController();
    	controller.username = 'test@salesforce.com';     	
    
    	System.assertEquals(controller.forgotPassword(),null); 
    }
}