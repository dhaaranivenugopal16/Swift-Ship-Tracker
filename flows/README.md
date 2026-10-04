# Salesforce Flows

These are the four Flows required by the SwiftShip Tracker design. They are intentionally documented as Flow Builder specifications instead of guessed XML metadata, because Salesforce Flow XML is org/configuration sensitive.

## 1. Shipment Status Flow
- Type: Record-Triggered Flow
- Object: Delivery Attempt
- Trigger: Created or Updated, after save
- Decision: Attempt Status = Successful
- Get Records: Shipment where Id = Delivery Attempt.Shipment__c
- Update Records: Shipment Status = Delivered and Actual Delivery Date = Today

## 2. Exception Assignment Flow
- Type: Record-Triggered Flow
- Object: Delivery Exception
- Trigger: Created or Updated, before save
- Decision: Severity = High or Critical
- Assignment: Assigned To = Current User
- Assignment: Status = Assigned

## 3. Follow-up Task Flow
- Type: Record-Triggered Flow
- Object: Delivery Exception
- Trigger: Created, after save
- Create Task related to Shipment
- Subject: Follow up on SwiftShip delivery exception
- Status: Not Started

## 4. Notification Flow
- Type: Record-Triggered Flow
- Object: Shipment
- Trigger: Created or Updated, after save
- Create an operational follow-up Task or replace this action with Salesforce Custom Notification / Email Alert in Flow Builder.
