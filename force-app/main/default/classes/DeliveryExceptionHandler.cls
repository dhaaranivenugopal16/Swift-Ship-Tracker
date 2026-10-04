public with sharing class DeliveryExceptionHandler {
    public static Delivery_Exception__c createException(
        Id shipmentId,
        String exceptionType,
        String severity,
        String description
    ) {
        if (shipmentId == null || String.isBlank(exceptionType) || String.isBlank(severity)) {
            throw new IllegalArgumentException('Shipment, exception type and severity are required.');
        }

        Delivery_Exception__c exceptionRecord = new Delivery_Exception__c(
            Shipment__c = shipmentId,
            Exception_Type__c = exceptionType,
            Severity__c = severity,
            Description__c = description,
            Status__c = 'Open'
        );

        insert exceptionRecord;
        return exceptionRecord;
    }

    public static void closeException(Id exceptionId, String resolution) {
        Delivery_Exception__c exceptionRecord = [
            SELECT Id, Status__c, Resolution__c
            FROM Delivery_Exception__c
            WHERE Id = :exceptionId
            LIMIT 1
        ];

        exceptionRecord.Status__c = 'Closed';
        exceptionRecord.Resolution__c = resolution;
        update exceptionRecord;
    }
}
