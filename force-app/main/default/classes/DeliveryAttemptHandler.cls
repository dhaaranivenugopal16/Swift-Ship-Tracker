public with sharing class DeliveryAttemptHandler {
    public static Delivery_Attempt__c recordAttempt(
        Id shipmentId,
        String attemptStatus,
        String remarks
    ) {
        if (shipmentId == null || String.isBlank(attemptStatus)) {
            throw new IllegalArgumentException('Shipment and attempt status are required.');
        }

        Delivery_Attempt__c attempt = new Delivery_Attempt__c(
            Shipment__c = shipmentId,
            Attempt_Date__c = System.now(),
            Attempt_Status__c = attemptStatus,
            Remarks__c = remarks
        );

        insert attempt;
        return attempt;
    }
}
