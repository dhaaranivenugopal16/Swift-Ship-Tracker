public with sharing class SwiftShipTracker {
    public static Shipment__c createShipment(
        String trackingCode,
        String status,
        String origin,
        String destination,
        String priority
    ) {
        if (String.isBlank(trackingCode) || String.isBlank(origin) || String.isBlank(destination)) {
            throw new IllegalArgumentException('Tracking Code, Origin and Destination are required.');
        }

        Shipment__c s = new Shipment__c(
            Tracking_Code__c = trackingCode,
            Shipment_Status__c = String.isBlank(status) ? 'Created' : status,
            Origin__c = origin,
            Destination__c = destination,
            Priority__c = String.isBlank(priority) ? 'Medium' : priority,
            Current_Milestone__c = 'Shipment Creation',
            Exception_Flag__c = false
        );
        insert s;
        return s;
    }

    public static void updateMilestone(Id shipmentId, String milestone, String status) {
        if (shipmentId == null) throw new IllegalArgumentException('Shipment Id is required.');

        Shipment__c s = [
            SELECT Id, Shipment_Status__c, Current_Milestone__c, Dispatch_Date__c
            FROM Shipment__c WHERE Id = :shipmentId LIMIT 1
        ];

        if (!String.isBlank(milestone)) s.Current_Milestone__c = milestone;
        if (!String.isBlank(status)) s.Shipment_Status__c = status;

        if (status == 'Dispatched' && s.Dispatch_Date__c == null) {
            s.Dispatch_Date__c = Date.today();
        }

        update s;
    }

    public static Shipment__c getShipmentByTrackingCode(String trackingCode) {
        if (String.isBlank(trackingCode)) {
            throw new IllegalArgumentException('Tracking Code is required.');
        }

        return [
            SELECT Id, Name, Tracking_Code__c, Shipment_Status__c, Priority__c,
                   Origin__c, Destination__c, Dispatch_Date__c,
                   Expected_Delivery_Date__c, Current_Milestone__c,
                   Route__c, Route__r.Name, Recipient_Name__c,
                   Recipient_Contact__c, Recipient_Phone__c, Exception_Flag__c,
                   Assigned_Delivery_Agent__c
            FROM Shipment__c
            WHERE Tracking_Code__c = :trackingCode
            LIMIT 1
        ];
    }

    public static Integer calculateAttemptCount(Id shipmentId) {
        return [
            SELECT COUNT()
            FROM Delivery_Attempt__c
            WHERE Shipment__c = :shipmentId
        ];
    }
}
