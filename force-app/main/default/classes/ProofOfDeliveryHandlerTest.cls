@IsTest
private class ProofOfDeliveryHandlerTest {
    @IsTest
    static void recordConfirmedProof() {
        Shipment__c s = new Shipment__c(
            Tracking_Code__c = 'TRK-POD-1',
            Shipment_Status__c = 'Out for Delivery',
            Priority__c = 'Medium',
            Origin__c = 'Salem',
            Destination__c = 'Trichy',
            Current_Milestone__c = 'Delivery Attempt',
            Exception_Flag__c = false
        );
        insert s;

        Test.startTest();
        Proof_of_Delivery__c p = ProofOfDeliveryHandler.recordProof(
            s.Id, 'Test Receiver', 'Signature', 'Confirmed', 'Package received'
        );
        Test.stopTest();

        System.assertNotEquals(null, p.Id);

        Shipment__c updated = [
            SELECT Shipment_Status__c, Current_Milestone__c, Exception_Flag__c
            FROM Shipment__c WHERE Id = :s.Id
        ];
        System.assertEquals('Delivered', updated.Shipment_Status__c);
        System.assertEquals('Proof of Delivery', updated.Current_Milestone__c);
        System.assertEquals(false, updated.Exception_Flag__c);
    }
}
