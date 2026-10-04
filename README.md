# SwiftShip Tracker — TN Document Specification Package

Salesforce Developer Edition project prepared against the requirements in the
TN.pdf document supplied for the SwiftShip Tracker project.

## Scope covered

- Shipment operations
- Route assignment and route management
- Delivery-attempt history
- Delivery exception management
- Proof of delivery
- Shipment milestone/status tracking
- Apex operational processing
- Flow design specifications
- Reports and dashboard specifications
- Lightning App/UI specifications
- Security model and permission-set specifications
- Agentforce + Prompt Builder implementation specification
- Testing checklist
- Sample data

## Core Salesforce objects

1. Shipment__c
2. Route__c
3. Delivery_Attempt__c
4. Delivery_Exception__c
5. Proof_of_Delivery__c

## Important implementation note

The TN document describes several Salesforce Setup features that are configured
inside a Salesforce Developer Org (Agentforce, Prompt Builder, Lightning App
Builder, Flow Builder, profiles, roles, sharing rules, reports and dashboards).
Those features are therefore documented in `docs/` with exact build specifications
rather than being represented by guessed metadata that could fail deployment.

The object metadata, fields, Apex classes, tests, permission sets and tabs are
provided in Salesforce DX source format.

## Deploy core metadata

```bash
sf org login web --alias swiftship
sf project deploy start --source-dir force-app
```

Or deploy with the manifest:

```bash
sf project deploy start --manifest manifest/package.xml
```

## Run tests

```bash
sf apex run test --class-names SwiftShipTrackerTest,DeliveryExceptionHandlerTest,DeliveryAttemptHandlerTest,ProofOfDeliveryHandlerTest --result-format human --wait 10
```

## Then configure in Salesforce Setup

Follow:

- `docs/01-OBJECTS-AND-RELATIONSHIPS.md`
- `docs/02-FLOWS.md`
- `docs/03-REPORTS-AND-DASHBOARD.md`
- `docs/04-LIGHTNING-APP-AND-UI.md`
- `docs/05-SECURITY.md`
- `docs/06-AGENTFORCE-PROMPT-BUILDER.md`
- `docs/07-TESTING.md`

## TN document alignment

The project follows the TN document's terminology and lifecycle:

Shipment Creation → Route Assignment → Dispatch → In-Transit Monitoring →
Delivery Attempt → Exception Identification → Exception Assignment & Resolution
→ Proof of Delivery → Shipment Completion → Operational Review & Reporting.
