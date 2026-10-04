public with sharing class ProofOfDeliveryHandler {
    public static Proof_of_Delivery__c recordProof(
        Id shipmentId,
        String receiverName,
        String confirmationType,
        String confirmationStatus,
        String remarks
    ) {
        if (shipmentId == null || String.isBlank(receiverName)) {
            throw new IllegalArgumentException('Shipment and Receiver Name are required.');
        }

        Proof_of_Delivery__c p = new Proof_of_Delivery__c(
            Shipment__c = shipmentId,
            Delivery_Date__c = Date.today(),
            Receiver_Name__c = receiverName,
            Confirmation_Type__c = confirmationType,
            Confirmation_Status__c = confirmationStatus,
            Delivery_Remarks__c = remarks,
            Recorded_By__c = UserInfo.getUserId()
        );
        insert p;

        Shipment__c s = [SELECT Id, Shipment_Status__c, Current_Milestone__c,
                                 Exception_Flag__c, Expected_Delivery_Date__c
                          FROM Shipment__c WHERE Id = :shipmentId LIMIT 1];
        s.Shipment_Status__c = confirmationStatus == 'Confirmed' ? 'Delivered' : s.Shipment_Status__c;
        if (confirmationStatus == 'Confirmed') {
            s.Current_Milestone__c = 'Proof of Delivery';
            s.Exception_Flag__c = false;
        }
        update s;

        return p;
    }
}
