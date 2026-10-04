@IsTest
private class DeliveryAttemptHandlerTest {
    @IsTest
    static void recordMultipleAttempts() {
        Shipment__c s = new Shipment__c(
            Tracking_Code__c = 'TRK-ATT-1',
            Shipment_Status__c = 'Out for Delivery',
            Priority__c = 'Medium',
            Origin__c = 'Chennai',
            Destination__c = 'Pondicherry',
            Current_Milestone__c = 'Delivery Attempt'
        );
        insert s;

        Test.startTest();
        Delivery_Attempt__c a1 = DeliveryAttemptHandler.recordAttempt(
            s.Id, UserInfo.getUserId(), 'Failed', 'Customer unavailable',
            'Unavailable', Date.today().addDays(1)
        );
        Delivery_Attempt__c a2 = DeliveryAttemptHandler.recordAttempt(
            s.Id, UserInfo.getUserId(), 'Successful', 'Delivered on second attempt',
            'Available', null
        );
        Test.stopTest();

        System.assertEquals(1, a1.Attempt_Number__c);
        System.assertEquals(2, a2.Attempt_Number__c);
    }
}
