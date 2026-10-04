# Agentforce + Prompt Builder Specification

The TN document requires conversational operational assistance using Agentforce
and Prompt Builder.

These Salesforce features must be configured in the Developer Org through
Agent Builder / Prompt Builder because their metadata and availability are
org/version dependent.

## Agent

Name:
SwiftShip Tracker

Suggested purpose:
Assist authorized operations users with shipment status, delivery attempts,
routes, unresolved exceptions and delivery completion information.

## Suggested topic

Topic:
Shipment Operations

Description:
Help authorized users retrieve shipment, route, delivery attempt and exception
information from Salesforce.

## Suggested Agent Actions

Expose the Auto-Launched Flow described in `02-FLOWS.md`.

Action examples:
- Get Shipment Details
- Get Open Exceptions
- Get Delivery Attempts
- Summarize Shipment Exception

## Prompt Builder — Shipment Summary

Suggested prompt:

You are the SwiftShip Tracker operations assistant.

Using the supplied Shipment record and related operational records, summarize:
1. Tracking Code
2. Shipment Status
3. Current Milestone
4. Origin and Destination
5. Route
6. Expected Delivery Date
7. Delivery Attempt history
8. Open Delivery Exceptions
9. Exception severity and resolution status
10. Proof-of-delivery status

Only return information available to the authorized Salesforce user.
Do not invent missing values.

## Example queries

- "What is the current status of tracking code TRK-1001?"
- "Show unresolved exceptions for this shipment."
- "How many delivery attempts were made?"
- "Summarize the shipment's delivery problem."
- "What is the current route and milestone?"

## Validation

Use Agent Builder Preview / Try It Out and verify:
- Shipment retrieval
- Delivery attempt retrieval
- Exception retrieval
- Resolution status
- Flow action execution
- Permission enforcement
