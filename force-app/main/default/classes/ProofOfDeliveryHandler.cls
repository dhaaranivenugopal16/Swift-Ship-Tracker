public with sharing class ProofOfDeliveryHandler {
    public static Proof_of_Delivery__c createProof(
        Id shipmentId,
        String receiverName,
        String deliveryStatus,
        String remarks
    ) {
        if (shipmentId == null || String.isBlank(receiverName)) {
            throw new IllegalArgumentException('Shipment and receiver name are required.');
        }

        Proof_of_Delivery__c proof = new Proof_of_Delivery__c(
            Shipment__c = shipmentId,
            Receiver_Name__c = receiverName,
            Delivery_Date__c = Date.today(),
            Delivery_Status__c = deliveryStatus,
            Remarks__c = remarks
        );

        insert proof;
        return proof;
    }
}
