public with sharing class DeliveryExceptionHandler {
    public static Delivery_Exception__c createException(
        Id shipmentId,
        String exceptionType,
        String severity,
        String description
    ) {
        if (shipmentId == null || String.isBlank(exceptionType) || String.isBlank(severity)) {
            throw new IllegalArgumentException('Shipment, Exception Type and Severity are required.');
        }

        Boolean escalate = severity == 'High' || severity == 'Critical';

        Delivery_Exception__c e = new Delivery_Exception__c(
            Shipment__c = shipmentId,
            Exception_Type__c = exceptionType,
            Severity__c = severity,
            Description__c = description,
            Reported_Date__c = System.now(),
            Resolution_Status__c = 'Open',
            Escalation_Required__c = escalate
        );
        insert e;

        Shipment__c s = [SELECT Id, Exception_Flag__c, Shipment_Status__c
                          FROM Shipment__c WHERE Id = :shipmentId LIMIT 1];
        s.Exception_Flag__c = true;
        s.Shipment_Status__c = 'Exception';
        update s;

        return e;
    }

    public static void resolveException(Id exceptionId, String notes) {
        Delivery_Exception__c e = [
            SELECT Id, Resolution_Status__c, Resolution_Notes__c, Resolution_Date__c
            FROM Delivery_Exception__c WHERE Id = :exceptionId LIMIT 1
        ];
        e.Resolution_Status__c = 'Resolved';
        e.Resolution_Notes__c = notes;
        e.Resolution_Date__c = System.now();
        update e;
    }
}
