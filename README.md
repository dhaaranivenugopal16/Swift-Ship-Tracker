# SwiftShip Tracker 🚚

A Salesforce-based shipment operations management system for tracking shipments, routes, delivery attempts, delivery exceptions, proof of delivery, automation, reports, and dashboards.

## Technology
- Salesforce Platform
- Apex
- Salesforce DX source format
- Salesforce Flow
- Reports & Dashboards
- Agentforce / Prompt Builder (configuration in Salesforce)

## Project Structure

```text
Swift-Ship-Tracker/
├── force-app/main/default/
│   ├── classes/
│   └── objects/
├── flows/                 # Flow Builder specifications
├── reports/               # Report specifications
├── dashboards/            # Dashboard specification
├── docs/
├── manifest/package.xml
├── scripts/sample-data.apex
├── .forceignore
├── .gitignore
├── sfdx-project.json
└── README.md
```

## Salesforce Objects

- `Shipment__c`
- `Route__c`
- `Delivery_Attempt__c`
- `Delivery_Exception__c`
- `Proof_of_Delivery__c`

## Apex Classes

- `SwiftShipTracker` — create, retrieve and update shipments
- `SwiftShipController` — Lightning/Aura-enabled read methods
- `DeliveryAttemptHandler` — records delivery attempts
- `DeliveryExceptionHandler` — creates and closes exceptions
- `ProofOfDeliveryHandler` — records proof of delivery

Each service class has an Apex test class.

## Deploy Core Metadata

Install Salesforce CLI and authenticate to your Salesforce org:

```bash
sf org login web --alias swiftship
```

Deploy the project:

```bash
sf project deploy start --source-dir force-app
```

Run tests:

```bash
sf apex run test --class-names SwiftShipTrackerTest,DeliveryExceptionHandlerTest,DeliveryAttemptHandlerTest,ProofOfDeliveryHandlerTest --result-format human --wait 10
```

## Create the Flows, Reports and Dashboard

Follow:
- `flows/README.md`
- `reports/README.md`
- `dashboards/README.md`
- `docs/REPORTS.md`
- `docs/DASHBOARD.md`

These items are deliberately provided as build specifications rather than unverified XML because Salesforce Flow/report/dashboard metadata can depend on the target org configuration.

## Sample Data

After deploying the objects and Apex classes, run `scripts/sample-data.apex` using Execute Anonymous in Salesforce.

## GitHub

```bash
git init
git add .
git commit -m "Initial SwiftShip Tracker Salesforce project"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/Swift-Ship-Tracker.git
git push -u origin main
```
