public with sharing class EO_JoiningAppHelper {
    @AuraEnabled(cacheable=true)
    public static List<Map<String, String>> getFieldSetFields(String objectName, String fieldSetName) {
        List<Map<String, String>> fieldsList = new List<Map<String, String>>();
        
        // Dynamically get the SObjectType based on the object name
        Schema.SObjectType sObjectType = Schema.getGlobalDescribe().get(objectName);
        
        // Check if the SObjectType exists
        if (sObjectType != null) {
            // Get the describe result for the object
            Schema.DescribeSObjectResult describeResult = sObjectType.getDescribe();
            
            // Check if the field set exists for the provided fieldSetName
            if (describeResult.fieldSets.getMap().containsKey(fieldSetName)) {
                // Get the field set
                Schema.FieldSet fieldSet = describeResult.fieldSets.getMap().get(fieldSetName);

                // Iterate over the fields in the field set and retrieve the required details
                for (Schema.FieldSetMember field : fieldSet.getFields()) {
                    Map<String, String> fieldInfo = new Map<String, String>();
                    fieldInfo.put('apiName', field.getFieldPath());
                    fieldInfo.put('label', field.getLabel());
                    fieldInfo.put('type', field.getSObjectField().getDescribe().getType().name());
                    fieldsList.add(fieldInfo);
                }
            }
        }

        return fieldsList;
    }

    @AuraEnabled
    public static String saveRecord(String objectName, Map<String, Object> fieldValues) {
        // Get the SObject type based on the object name
        Schema.SObjectType sObjectType = Schema.getGlobalDescribe().get(objectName);
        
        if (sObjectType != null) {
            SObject record = sObjectType.newSObject();
            
            // Set the fields dynamically
            for (String fieldName : fieldValues.keySet()) {
                record.put(fieldName, fieldValues.get(fieldName));
            }
            
            try {
                // Insert the record into the database
                insert record;
                return 'Record saved successfully';
            } catch (DmlException e) {
                return 'Error: ' + e.getMessage();
            }
        }
        
        return 'Invalid Object Name';
    }
}