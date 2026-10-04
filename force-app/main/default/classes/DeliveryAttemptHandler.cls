public with sharing class DeliveryAttemptHandler {
    public static Delivery_Attempt__c recordAttempt(
        Id shipmentId,
        Id deliveryAgentId,
        String status,
        String remarks,
        String recipientAvailability,
        Date nextAttemptDate
    ) {
        if (shipmentId == null || String.isBlank(status)) {
            throw new IllegalArgumentException('Shipment and Attempt Status are required.');
        }

        Integer attemptNo = [
            SELECT COUNT()
            FROM Delivery_Attempt__c
            WHERE Shipment__c = :shipmentId
        ] + 1;

        Delivery_Attempt__c a = new Delivery_Attempt__c(
            Shipment__c = shipmentId,
            Delivery_Agent__c = deliveryAgentId,
            Attempt_Date__c = System.now(),
            Attempt_Number__c = attemptNo,
            Attempt_Status__c = status,
            Remarks__c = remarks,
            Recipient_Availability__c = recipientAvailability,
            Next_Attempt_Date__c = nextAttemptDate
        );
        insert a;
        return a;
    }
}
