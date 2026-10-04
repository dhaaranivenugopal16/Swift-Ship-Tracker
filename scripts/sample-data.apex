Shipment__c s = SwiftShipTracker.createShipment(
    'SHIP-1001',
    'Created',
    'Chennai'
);

SwiftShipTracker.updateShipmentStatus(s.Id, 'In Transit');

DeliveryAttemptHandler.recordAttempt(
    s.Id,
    'Failed',
    'Customer unavailable'
);

DeliveryExceptionHandler.createException(
    s.Id,
    'Failed Delivery',
    'High',
    'Customer was unavailable during delivery attempt.'
);

System.debug('Created SwiftShip sample shipment: ' + s.Id);
