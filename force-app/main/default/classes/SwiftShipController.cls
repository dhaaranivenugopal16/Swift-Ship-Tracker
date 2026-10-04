public with sharing class SwiftShipController {
    @AuraEnabled(cacheable=true)
    public static List<Shipment__c> recentShipments() {
        return [
            SELECT Id, Name, Tracking_Code__c, Shipment_Status__c, Priority__c,
                   Origin__c, Destination__c, Expected_Delivery_Date__c,
                   Current_Milestone__c, Exception_Flag__c
            FROM Shipment__c
            ORDER BY CreatedDate DESC
            LIMIT 50
        ];
    }

    @AuraEnabled(cacheable=true)
    public static List<Delivery_Exception__c> openExceptions() {
        return [
            SELECT Id, Name, Shipment__c, Shipment__r.Tracking_Code__c,
                   Exception_Type__c, Severity__c, Resolution_Status__c,
                   Assigned_To__c, Escalation_Required__c, Description__c
            FROM Delivery_Exception__c
            WHERE Resolution_Status__c != 'Closed'
            ORDER BY CreatedDate DESC
            LIMIT 50
        ];
    }
}
