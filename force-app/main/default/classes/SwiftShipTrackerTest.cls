@IsTest
private class SwiftShipTrackerTest {
    @IsTest
    static void createAndTrackShipment() {
        Test.startTest();
        Shipment__c s = SwiftShipTracker.createShipment(
            'TRK-1001', 'Created', 'Chennai', 'Bengaluru', 'High'
        );
        Test.stopTest();

        System.assertNotEquals(null, s.Id);
        System.assertEquals('TRK-1001', s.Tracking_Code__c);

        SwiftShipTracker.updateMilestone(s.Id, 'Dispatch', 'Dispatched');

        Shipment__c updated = [
            SELECT Shipment_Status__c, Current_Milestone__c, Dispatch_Date__c
            FROM Shipment__c WHERE Id = :s.Id
        ];
        System.assertEquals('Dispatched', updated.Shipment_Status__c);
        System.assertEquals('Dispatch', updated.Current_Milestone__c);
        System.assertEquals(Date.today(), updated.Dispatch_Date__c);

        Shipment__c tracked = SwiftShipTracker.getShipmentByTrackingCode('TRK-1001');
        System.assertEquals(s.Id, tracked.Id);
        System.assertEquals(0, SwiftShipTracker.calculateAttemptCount(s.Id));
    }
}
