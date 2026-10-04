# SwiftShip Tracker Reports

## Delayed Shipments
Columns: Shipment Name, Tracking Number, Origin, Destination, Status, Expected Delivery Date, Priority.
Filter: Status = In Transit OR Out for Delivery.

## Open Exceptions
Columns: Exception Name, Shipment, Exception Type, Severity, Status, Assigned To, Description.
Filter: Status is not Closed.

## Delivery Attempts
Columns: Attempt Name, Shipment, Attempt Date, Attempt Status, Remarks.
Group by Attempt Status.

## Route Performance
Columns: Route Name, Source, Destination, Route Status, Route Date, Distance KM.
Group by Route Status.
