@IsTest
private class SwiftShipTrackerTest {
    @TestSetup
    static void setupData() {
        insert new Shipment__c(
            Name = 'TEST-SHIP-001',
            Status__c = 'Created',
            Destination__c = 'Chennai',
            Origin__c = 'Bengaluru',
            Priority__c = 'High',
            Shipment_Date__c = Date.today()
        );
    }

    @IsTest
    static void testCreateAndGetShipment() {
        Test.startTest();
        Shipment__c created = SwiftShipTracker.createShipment(
            'TEST-SHIP-002',
            'Created',
            'Coimbatore'
        );
        Test.stopTest();

        System.assertNotEquals(null, created.Id);
        System.assertEquals('Created', created.Status__c);

        Shipment__c fetched = SwiftShipTracker.getShipment(created.Id);
        System.assertEquals('Coimbatore', fetched.Destination__c);
    }

    @IsTest
    static void testUpdateStatus() {
        Shipment__c shipment = [SELECT Id FROM Shipment__c LIMIT 1];

        Test.startTest();
        SwiftShipTracker.updateShipmentStatus(shipment.Id, 'Delivered');
        Test.stopTest();

        Shipment__c updated = [
            SELECT Status__c, Actual_Delivery_Date__c
            FROM Shipment__c
            WHERE Id = :shipment.Id
        ];

        System.assertEquals('Delivered', updated.Status__c);
        System.assertEquals(Date.today(), updated.Actual_Delivery_Date__c);
    }
}
