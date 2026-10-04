@IsTest
private class ProofOfDeliveryHandlerTest {
    @IsTest
    static void testCreateProof() {
        Shipment__c shipment = new Shipment__c(
            Name = 'POD-TEST',
            Status__c = 'Delivered',
            Destination__c = 'Trichy'
        );
        insert shipment;

        Test.startTest();
        Proof_of_Delivery__c proof =
            ProofOfDeliveryHandler.createProof(
                shipment.Id,
                'Test Receiver',
                'Delivered',
                'Package received'
            );
        Test.stopTest();

        System.assertNotEquals(null, proof.Id);
        System.assertEquals('Test Receiver', proof.Receiver_Name__c);
        System.assertEquals('Delivered', proof.Delivery_Status__c);
    }
}
