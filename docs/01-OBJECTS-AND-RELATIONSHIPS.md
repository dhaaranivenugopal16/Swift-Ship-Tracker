# Objects, Fields and Relationships

Create/deploy these custom objects.

## Shipment__c

Central operational record.

Fields:
- Tracking Code
- Shipment Status: Created, Scheduled, Dispatched, In Transit, Out for Delivery, Delivered, Completed, Exception
- Priority: Low, Medium, High, Critical
- Origin
- Destination
- Dispatch Date
- Expected Delivery Date
- Current Milestone
- Route
- Recipient Name
- Recipient Contact
- Recipient Phone
- Exception Flag
- Assigned Delivery Agent

## Route__c

Route coordination record.

Fields:
- Route Code
- Origin
- Destination
- Distance
- Route Status
- Assigned Delivery Agent
- Planned Start
- Planned End

## Delivery_Attempt__c

Child of Shipment__c.

Fields:
- Shipment
- Delivery Agent
- Attempt Date
- Attempt Number
- Attempt Status
- Remarks
- Recipient Availability
- Next Attempt Date

## Delivery_Exception__c

Child of Shipment__c.

Fields:
- Shipment
- Exception Type
- Severity
- Description
- Reported Date
- Assigned To
- Resolution Status
- Resolution Notes
- Resolution Date
- Escalation Required

## Proof_of_Delivery__c

Child of Shipment__c.

Fields:
- Shipment
- Delivery Date
- Receiver Name
- Confirmation Type
- Confirmation Status
- Delivery Remarks
- Recorded By

## Relationships

Route__c → Shipment__c is implemented using Shipment__c.Route__c lookup.

Shipment__c → Delivery_Attempt__c, Delivery_Exception__c and Proof_of_Delivery__c
are implemented as master-detail child relationships.

The model is designed so one route can be associated with multiple shipments and
one shipment can have multiple attempts/exceptions while having a structured
proof-of-delivery record.
