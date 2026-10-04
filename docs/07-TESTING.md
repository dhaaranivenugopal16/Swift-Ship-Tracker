# Testing Checklist

The TN document lists functional/performance testing areas.

## Shipment Creation
- Create a valid Shipment__c.
- Verify Tracking Code, status, priority, origin and destination.

## Route Assignment
- Create Route__c.
- Assign the route to Shipment__c.
- Verify Assigned Delivery Agent.

## Shipment Status
Test:
Created → Scheduled → Dispatched → In Transit → Out for Delivery → Delivered.

## Delivery Attempt
- Record first attempt.
- Record second attempt.
- Verify Attempt Number increments.
- Verify history remains related to the Shipment.

## Delivery Exception
- Create Low, Medium, High and Critical exceptions.
- Verify Exception Flag.
- Verify High/Critical escalation flag.

## Exception Automation
- Verify assignment.
- Verify follow-up Task.
- Verify notification.
- Verify resolution and closure.

## Proof of Delivery
- Record receiver.
- Record confirmation type/status.
- Verify shipment moves to Delivered when confirmed.

## Agentforce
Test conversational queries for:
- shipment status
- delivery attempts
- unresolved exceptions
- route information

## Prompt Builder
Verify prompt output uses only relevant Salesforce data.

## Reports/Dashboard
Verify shipment, route, delivery-attempt, exception and POD data is represented.

## Security
Verify users can access only the objects/records/fields permitted by their
roles, profiles, permission sets and sharing configuration.

## Screenshots

The TN document states screenshots were captured during functional testing.
For your final project documentation, capture screenshots from your own
Salesforce Developer Org after the configuration is actually built and tested.
Do not use fabricated screenshots.
