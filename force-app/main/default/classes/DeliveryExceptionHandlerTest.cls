@IsTest
private class DeliveryExceptionHandlerTest {
    @IsTest
    static void createAndResolveCriticalException() {
        Shipment__c s = new Shipment__c(
            Tracking_Code__c = 'TRK-EXC-1',
            Shipment_Status__c = 'In Transit',
            Priority__c = 'High',
            Origin__c = 'Chennai',
            Destination__c = 'Madurai',
            Current_Milestone__c = 'In-Transit Monitoring'
        );
        insert s;

        Test.startTest();
        Delivery_Exception__c e = DeliveryExceptionHandler.createException(
            s.Id, 'Delay', 'Critical', 'Vehicle breakdown'
        );
        Test.stopTest();

        System.assertEquals(true, e.Escalation_Required__c);

        Shipment__c changed = [SELECT Exception_Flag__c, Shipment_Status__c
                                FROM Shipment__c WHERE Id = :s.Id];
        System.assertEquals(true, changed.Exception_Flag__c);
        System.assertEquals('Exception', changed.Shipment_Status__c);

        DeliveryExceptionHandler.resolveException(e.Id, 'Vehicle replaced');

        Delivery_Exception__c resolved = [
            SELECT Resolution_Status__c, Resolution_Notes__c, Resolution_Date__c
            FROM Delivery_Exception__c WHERE Id = :e.Id
        ];
        System.assertEquals('Resolved', resolved.Resolution_Status__c);
        System.assertEquals('Vehicle replaced', resolved.Resolution_Notes__c);
        System.assertNotEquals(null, resolved.Resolution_Date__c);
    }
}
