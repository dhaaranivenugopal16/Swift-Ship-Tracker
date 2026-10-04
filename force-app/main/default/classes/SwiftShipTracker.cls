public with sharing class SwiftShipTracker {
    public static Shipment__c createShipment(
        String shipmentName,
        String status,
        String destination
    ) {
        Shipment__c shipment = new Shipment__c(
            Name = shipmentName,
            Status__c = status,
            Destination__c = destination,
            Shipment_Date__c = Date.today()
        );
        insert shipment;
        return shipment;
    }

    public static void updateShipmentStatus(Id shipmentId, String newStatus) {
        if (shipmentId == null || String.isBlank(newStatus)) {
            throw new IllegalArgumentException('Shipment Id and status are required.');
        }

        Shipment__c shipment = [
            SELECT Id, Status__c
            FROM Shipment__c
            WHERE Id = :shipmentId
            LIMIT 1
        ];

        shipment.Status__c = newStatus;

        if (newStatus == 'Delivered' || newStatus == 'Completed') {
            shipment.Actual_Delivery_Date__c = Date.today();
        }

        update shipment;
    }

    public static Shipment__c getShipment(Id shipmentId) {
        if (shipmentId == null) {
            throw new IllegalArgumentException('Shipment Id is required.');
        }

        return [
            SELECT Id, Name, Status__c, Destination__c, Origin__c,
                   Shipment_Date__c, Expected_Delivery_Date__c,
                   Actual_Delivery_Date__c, Tracking_Number__c, Priority__c
            FROM Shipment__c
            WHERE Id = :shipmentId
            LIMIT 1
        ];
    }
}
