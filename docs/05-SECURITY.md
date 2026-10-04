# Security Specification

The TN document describes this hierarchy:

Administrator
  ↓
Operations Manager
  ↓
Dispatch Coordinator
  ↓
Delivery Agent

Support Staff receives access appropriate to support responsibilities.

## Profiles / roles

Configure the corresponding users/roles in Salesforce Setup.

### Administrator
Full administrative access.

### Operations Manager
Access to shipment, route, delivery attempt, exception, proof of delivery,
reports and dashboards.

### Dispatch Coordinator
Access required for route assignment, shipment monitoring and delivery
coordination.

### Delivery Agent
Read/Edit access to assigned shipment and delivery records.

### Support Staff
Access to shipment and exception information needed for support.

## Permission Sets

The repository includes:
- SwiftShip Operations Manager
- SwiftShip Dispatch Coordinator
- SwiftShip Delivery Agent
- SwiftShip Support Staff

Additional permission-set examples required by the TN document:
- Update Shipment Milestone
- Manage Delivery Exceptions
- Access Operations Dashboard
- Manage Route Assignments
- Use SwiftShip AI Assistant

## Field-Level Security

Restrict sensitive fields where appropriate:
- Recipient Contact
- Recipient Phone
- Resolution Notes
- Escalation Required
- Delivery Remarks

## Record-level security

Use role hierarchy and sharing rules so users only see records appropriate to
their operational responsibility.
