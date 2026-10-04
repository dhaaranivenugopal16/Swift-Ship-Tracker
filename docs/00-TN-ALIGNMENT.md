# TN Document Alignment

This repository is a source-code/configuration package for the SwiftShip Tracker
specified in TN.pdf.

## Functional requirements represented

FR-1  Shipment record creation and management
FR-2  Route assignment and route information management
FR-3  Shipment milestone and status tracking
FR-4  Delivery attempt recording and history management
FR-5  Delivery exception creation and classification
FR-6  Exception severity and resolution status management
FR-7  Automatic assignment and escalation of critical exceptions
FR-8  Proof-of-delivery information management
FR-9  Automated operational notifications and follow-up tasks
FR-10 AI-assisted shipment and exception information retrieval
FR-11 Reports and dashboards for shipment and operational performance
FR-12 Secure role-based access for operations users and delivery agents

## TN data model

Route__c
   |
   v
Shipment__c
 /    |    v     v     v
Delivery_Attempt__c
Delivery_Exception__c
Proof_of_Delivery__c

Shipment__c is the central operational record.

## TN technology stack

- Salesforce Developer Edition
- Lightning App Page / Lightning Record Pages
- Salesforce Custom Objects
- Salesforce Flow
- Apex
- Agentforce AI
- Prompt Builder
- Email Alerts / Email Templates
- Salesforce Tasks
- Profiles / Permission Sets / Role Hierarchy / Field-Level Security / Sharing
- Reports and Dashboards
