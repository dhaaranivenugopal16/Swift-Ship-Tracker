# Reports and Dashboard

## Reports required by the TN document

### 1. Shipment Status Report
Object: Shipment__c

Columns:
- Tracking Code
- Shipment Status
- Priority
- Origin
- Destination
- Current Milestone
- Expected Delivery Date
- Exception Flag

Group by Shipment Status.

### 2. Delivery Attempt Report
Object: Delivery_Attempt__c

Columns:
- Shipment
- Delivery Agent
- Attempt Number
- Attempt Date
- Attempt Status
- Recipient Availability
- Next Attempt Date

Group by Attempt Status.

### 3. Route Activity Report
Object: Route__c with related Shipment data where available.

Columns:
- Route Code
- Origin
- Destination
- Distance
- Route Status
- Assigned Delivery Agent
- Planned Start
- Planned End

### 4. Unresolved Exception Report
Object: Delivery_Exception__c

Filter:
Resolution Status != Closed

Columns:
- Exception Number
- Shipment
- Exception Type
- Severity
- Assigned To
- Resolution Status
- Escalation Required
- Reported Date

### 5. Proof of Delivery Report
Object: Proof_of_Delivery__c

Columns:
- Shipment
- Delivery Date
- Receiver Name
- Confirmation Type
- Confirmation Status
- Recorded By

## Dashboard: SwiftShip Operations Dashboard

Recommended components:
- Total Shipments
- Shipments by Status
- High/Critical Exceptions
- Unresolved Exceptions
- Delivery Attempts by Status
- Route Status
- Deliveries Completed
- Shipments with Exception Flag

Use a Lightning Dashboard and set the running user according to the
operations-manager requirement.
