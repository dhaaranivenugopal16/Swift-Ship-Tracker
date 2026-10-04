@IsTest
private class DeliveryAttemptHandlerTest {
    @IsTest
    static void testRecordAttempt() {
        Shipment__c shipment = new Shipment__c(
            Name = 'ATTEMPT-TEST',
            Status__c = 'Out for Delivery',
            Destination__c = 'Salem'
        );
        insert shipment;

        Test.startTest();
        Delivery_Attempt__c attempt =
            DeliveryAttemptHandler.recordAttempt(
                shipment.Id,
                'Failed',
                'Customer unavailable'
            );
        Test.stopTest();

        System.assertNotEquals(null, attempt.Id);
        System.assertEquals('Failed', attempt.Attempt_Status__c);
        System.assertEquals(shipment.Id, attempt.Shipment__c);
    }
}
