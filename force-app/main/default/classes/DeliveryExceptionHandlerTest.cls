@IsTest
private class DeliveryExceptionHandlerTest {
    @IsTest
    static void testExceptionLifecycle() {
        Shipment__c shipment = new Shipment__c(
            Name = 'EXC-TEST',
            Status__c = 'In Transit',
            Destination__c = 'Madurai'
        );
        insert shipment;

        Test.startTest();
        Delivery_Exception__c exceptionRecord =
            DeliveryExceptionHandler.createException(
                shipment.Id,
                'Delay',
                'High',
                'Vehicle delayed'
            );
        Test.stopTest();

        System.assertEquals('Open', exceptionRecord.Status__c);

        Test.startTest();
        DeliveryExceptionHandler.closeException(
            exceptionRecord.Id,
            'Vehicle replaced'
        );
        Test.stopTest();

        Delivery_Exception__c closedRecord = [
            SELECT Status__c, Resolution__c
            FROM Delivery_Exception__c
            WHERE Id = :exceptionRecord.Id
        ];

        System.assertEquals('Closed', closedRecord.Status__c);
        System.assertEquals('Vehicle replaced', closedRecord.Resolution__c);
    }
}
