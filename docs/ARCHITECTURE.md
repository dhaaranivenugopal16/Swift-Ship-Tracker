# SwiftShip Tracker Architecture

## Lifecycle

Shipment Creation
-> Route Assignment
-> Dispatch
-> In-Transit Monitoring
-> Delivery Attempt
-> Successful Delivery / Exception
-> Exception Assignment & Resolution
-> Proof of Delivery
-> Shipment Completion
-> Reports & Operational Analysis

## Data Model

Shipment__c is the central operational object.

Delivery_Attempt__c, Delivery_Exception__c and Proof_of_Delivery__c use
Shipment__c as their parent through Master-Detail relationships.

Route__c is maintained separately for route coordination and performance.

## Automation

The project includes four Flow metadata placeholders representing:

1. Shipment Status Automation
2. Exception Assignment Flow
3. Follow-up Task Flow
4. Notification Flow

Because Flow behavior depends on the final org configuration, admins should
open each Flow in Flow Builder, add Decision/Update Records/Create Records
elements, test with sample records, and activate it.

## AI

The original project specification mentions AgentForce AI and Prompt Builder.
Those are Salesforce configuration features rather than ordinary Apex files.
Create an Agentforce topic/action and Prompt Builder template after the core
objects and automation are deployed.
