// Run from Developer Console / Salesforce CLI after the metadata is deployed.

Route__c route = new Route__c(
    Name = 'Route-001',
    Route_Code__c = 'R-001',
    Origin__c = 'Chennai',
    Destination__c = 'Bengaluru',
    Distance__c = 350,
    Route_Status__c = 'Active',
    Assigned_Delivery_Agent__c = UserInfo.getUserId(),
    Planned_Start__c = System.now(),
    Planned_End__c = System.now().addHours(8)
);
insert route;

Shipment__c shipment = new Shipment__c(
    Tracking_Code__c = 'TRK-1001',
    Shipment_Status__c = 'In Transit',
    Priority__c = 'High',
    Origin__c = 'Chennai',
    Destination__c = 'Bengaluru',
    Expected_Delivery_Date__c = Date.today().addDays(2),
    Current_Milestone__c = 'In-Transit Monitoring',
    Route__c = route.Id,
    Recipient_Name__c = 'Sample Receiver',
    Recipient_Contact__c = 'Sample Contact',
    Recipient_Phone__c = '9000000000',
    Exception_Flag__c = false,
    Assigned_Delivery_Agent__c = UserInfo.getUserId()
);
insert shipment;

DeliveryAttemptHandler.recordAttempt(
    shipment.Id,
    UserInfo.getUserId(),
    'Failed',
    'Customer unavailable',
    'Unavailable',
    Date.today().addDays(1)
);

DeliveryExceptionHandler.createException(
    shipment.Id,
    'Customer Unavailable',
    'High',
    'Customer was not available during first attempt.'
);

System.debug('SwiftShip sample data created: ' + shipment.Id);
