# Salesforce Flow Specifications

Build these flows in Setup → Flows. The TN document specifically calls for
Record-Triggered, Auto-Launched and Scheduled Flow capabilities.

## Flow 1 — Shipment Milestone Automation

Type: Record-Triggered Flow on Shipment__c, after save.

Decision examples:
- Status = Dispatched → Current Milestone = Dispatch
- Status = In Transit → Current Milestone = In-Transit Monitoring
- Status = Out for Delivery → Current Milestone = Delivery Attempt
- Status = Delivered → Current Milestone = Shipment Completion

Update the shipment record and preserve the operational lifecycle.

## Flow 2 — Critical Exception Assignment

Type: Record-Triggered Flow on Delivery_Exception__c, after save.

Start condition:
- Severity = High OR Critical
- Resolution Status != Closed

Actions:
1. Set Escalation Required = True.
2. Assign to the responsible Operations Manager/User.
3. Update Resolution Status = Assigned.
4. Create follow-up Task.
5. Send custom notification/email alert.

## Flow 3 — Follow-up Task

Create Task when an exception is High/Critical or remains unresolved.

Task fields:
- Subject: Follow up on SwiftShip exception
- WhatId: Delivery Exception
- OwnerId: Assigned To
- Status: Not Started
- Priority: High
- Due Date: next operational working day

## Flow 4 — Notification

Send notifications for:
- Critical exception
- Exception assignment
- Shipment milestone update
- Delivery completion

Use Email Alerts / Email Templates or Salesforce Custom Notifications as
appropriate to the Developer Org configuration.

## Flow 5 — Scheduled Exception Monitoring

Type: Scheduled Flow.

Purpose:
- Find unresolved High/Critical exceptions.
- Check overdue follow-up.
- Notify responsible operations users.
- Create/escalate follow-up work where required.

## Flow 6 — Agentforce Action Flow

Type: Auto-Launched Flow.

Recommended input:
- `TrackingCode` (Text, Available for Input)

Elements:
1. Get Shipment__c where Tracking_Code__c = TrackingCode.
2. Get related open Delivery_Exception__c records.
3. Get recent Delivery_Attempt__c records.
4. Build output text/record collection.
5. Return the operational result.

This Flow is intended to be exposed as an Agentforce action.
