public with sharing class SwiftShipController {
    @AuraEnabled(cacheable=true)
    public static List<Shipment__c> getRecentShipments() {
        return [
            SELECT Id, Name, Status__c, Destination__c, Tracking_Number__c,
                   Priority__c, Expected_Delivery_Date__c
            FROM Shipment__c
            ORDER BY CreatedDate DESC
            LIMIT 50
        ];
    }

    @AuraEnabled(cacheable=true)
    public static List<Delivery_Exception__c> getOpenExceptions() {
        return [
            SELECT Id, Name, Shipment__c, Shipment__r.Name,
                   Exception_Type__c, Severity__c, Status__c,
                   Description__c
            FROM Delivery_Exception__c
            WHERE Status__c != 'Closed'
            ORDER BY CreatedDate DESC
            LIMIT 50
        ];
    }
}
