# CloudAdmin-AI

AI-assisted Microsoft 365 and Azure administration automation framework.

CloudAdmin-AI is a policy-driven administration framework designed to help IT administrators perform controlled Microsoft 365 and Azure identity and access operations with:

- Exact target resolution
- Dependency discovery
- Explicit administrator confirmation
- Controlled write operations
- Post-action verification
- Local JSON and CSV audit records
- Dashboard generation
- Safety controls for destructive operations

> **Important:** CloudAdmin-AI is an administration framework, not a standalone Microsoft 365 management application. It relies on an AI/MCP environment with an existing Microsoft 365/Azure administration MCP connection.

# Table of Contents

- [Overview](#overview)
- [How CloudAdmin-AI Works](#how-cloudadmin-ai-works)
- [Architecture](#architecture)
- [Requirements](#requirements)
- [Microsoft 365 and Azure Requirements](#microsoft-365-and-azure-requirements)
- [MCP Requirement](#mcp-requirement)
- [Installation](#installation)
- [Clone the Repository](#clone-the-repository)
- [Configure the MCP Connection](#configure-the-mcp-connection)
- [Configuration Safety](#configuration-safety)
- [Verify the Environment](#verify-the-environment)
- [Using CloudAdmin-AI](#using-cloudadmin-ai)
- [Read-Only Operations](#read-only-operations)
- [Employee Onboarding](#employee-onboarding)
- [Employee Offboarding](#employee-offboarding)
- [Group Membership Safety](#group-membership-safety)
- [Critical Group Protection](#critical-group-protection)
- [Microsoft Teams](#microsoft-teams)
- [License Removal](#license-removal)
- [Access Package Removal](#access-package-removal)
- [Session Revocation](#session-revocation)
- [Disable User Account](#disable-user-account)
- [Destructive Operations](#destructive-operations)
- [User Deletion](#user-deletion)
- [Dependency Analysis](#dependency-analysis)
- [Confirmation Model](#confirmation-model)
- [Verification Model](#verification-model)
- [Final Status Values](#final-status-values)
- [Audit Records](#audit-records)
- [Audit Security](#audit-security)
- [CSV Audit](#csv-audit)
- [Generate the Dashboard](#generate-the-dashboard)
- [PowerShell Audit Scripts](#powershell-audit-scripts)
- [Recommended Offboarding Order](#recommended-offboarding-order)
- [Important Execution Rule](#important-execution-rule)
- [Example Workflow](#example-workflow)
- [Security Model](#security-model)
- [Sensitive Data](#sensitive-data)
- [Production Safety](#production-safety)
- [Project Structure](#project-structure)
- [Policy Files](#policy-files)
- [Troubleshooting](#troubleshooting)
- [Development](#development)
- [Before Committing](#before-committing)
- [Contributing](#contributing)
- [Disclaimer](#disclaimer)
- [License](#license)
- [Repository](#repository)
- [Summary](#summary)

# Overview

CloudAdmin-AI provides a controlled framework for Microsoft 365 and Azure administration.

The framework is designed around a simple principle:

> Discover first, understand dependencies, show the proposed change, obtain confirmation, execute only approved actions, verify the result, and record the outcome.

The framework can be used for:

- Microsoft Entra ID administration
- Employee onboarding
- Employee offboarding
- Account disablement
- Session/sign-in revocation
- Microsoft 365 license management
- Group membership management
- Microsoft Teams membership handling
- Access package management
- Exchange mailbox-related processing
- OneDrive and SharePoint ownership awareness
- Intune device awareness
- Azure RBAC awareness
- Audit generation
- Dashboard generation

# How CloudAdmin-AI Works

CloudAdmin-AI follows a controlled execution model.

```text
Discovery
   |
   v
Dependency Analysis
   |
   v
Implementation Plan
   |
   v
Explicit Confirmation
   |
   v
Execute Approved Actions
   |
   v
Query Microsoft Again
   |
   v
Verify Expected State
   |
   v
Write Audit Record
   |
   v
Final Status

# Architecture

CloudAdmin-AI consists of several layers.

```text
+--------------------------------------------------+
|                  AI / Admin Interface            |
+--------------------------+-----------------------+
                           |
                           v
+--------------------------------------------------+
|              CloudAdmin-AI Policies              |
|                                                  |
|  admin-policy.md                                 |
|  confirmation.md                                 |
|  verification.md                                 |
+--------------------------+-----------------------+
                           |
                           v
+--------------------------------------------------+
|                   Workflows                      |
|                                                  |
|  onboarding.md                                   |
|  offboarding.md                                  |
+--------------------------+-----------------------+
                           |
                           v
+--------------------------------------------------+
|             Microsoft 365 / Azure MCP            |
|                                                  |
|  Entra ID                                        |
|  Microsoft 365                                   |
|  Exchange                                        |
|  Teams                                           |
|  Intune                                          |
|  Azure                                           |
+--------------------------+-----------------------+
                           |
                           v
+--------------------------------------------------+
|                  Audit Layer                     |
|                                                  |
|  JSON audit records                              |
|  CSV audit records                               |
|  Dashboard data                                  |
+--------------------------------------------------+

# Requirements

CloudAdmin-AI is designed for an administrative environment where the Microsoft 365 and Azure tenant can be accessed through an appropriate MCP connection.

Before using the framework, ensure that:

- Git is installed.
- PowerShell is available.
- An AI/MCP client capable of loading the required MCP configuration is available.
- The administrator has the required Microsoft 365 and Azure permissions.
- The Microsoft 365/Azure MCP connection is configured separately.
- The administrator understands which tenant and environment are being modified.

CloudAdmin-AI itself does not provide Microsoft 365 credentials or replace the underlying MCP authentication system.

# Microsoft 365 and Azure Requirements

The framework is intended for environments containing Microsoft cloud services such as:

- Microsoft Entra ID
- Microsoft 365
- Exchange Online
- Microsoft Teams
- SharePoint
- OneDrive
- Intune
- Azure subscriptions
- Azure RBAC
- Privileged Identity Management
- Access packages

The exact permissions required depend on the operation being performed.

Read-only discovery generally requires fewer privileges than operations that modify accounts, groups, licenses, sessions, or other resources.

Administrators should therefore use an identity with only the permissions necessary for the intended administrative tasks.

# MCP Requirement

CloudAdmin-AI relies on an existing Microsoft 365/Azure administration MCP connection.

The repository contains the policies, workflows, audit scripts, and dashboard components. It does not contain private MCP credentials or tenant authentication secrets.

The MCP provider and AI client are responsible for:

1. Connecting to Microsoft services.
2. Authenticating the administrator.
3. Providing the available administrative tools.
4. Executing the requested Microsoft 365/Azure operations.

The exact MCP installation and authentication process depends on the MCP provider and client being used.

Do not commit MCP credentials, OAuth tokens, client secrets, certificates, private keys, or tenant-specific secrets to this repository.

# Installation

The following installation process assumes Git is already installed and that you have access to a Microsoft 365/Azure MCP environment.

## Clone the Repository

Clone the public repository:

```powershell
git clone https://github.com/ynarvel/CloudAdmin-AI.git
Enter the project directory:

```powershell
cd CloudAdmin-AI
# Using CloudAdmin-AI

CloudAdmin-AI should be used as a controlled administrative workflow rather than as an unrestricted automation system.

A typical operation follows:

```text
Identify Target
      |
      v
Discover Current State
      |
      v
Analyze Dependencies
      |
      v
Create Implementation Plan
      |
      v
Request Explicit Confirmation
      |
      v
Execute Approved Actions
      |
      v
Verify Microsoft State
      |
      v
Record Audit Result
# Read-Only Operations

Read-only discovery should be performed before making changes whenever the operation could affect access, ownership, licensing, security, or business services.

Examples of information that may need to be discovered include:

- User identity
- Account state
- Sign-in/session state
- Licenses
- Group memberships
- Directory roles
- PIM assignments
- Enterprise applications
- Azure RBAC
- Intune information
- Exchange mailbox information
- Shared mailbox permissions
- Teams ownership
- SharePoint/OneDrive ownership
- Resource ownership

The purpose of discovery is to understand the current state before proposing a change.

# Employee Onboarding

The onboarding workflow is intended to provide a controlled process for preparing access for a new employee.

The onboarding process should follow the same principles used throughout CloudAdmin-AI:

1. Identify the intended user and target environment.
2. Discover the required configuration.
3. Prepare the proposed implementation plan.
4. Obtain administrator confirmation before write operations.
5. Execute only the approved actions.
6. Verify the resulting Microsoft 365/Azure state.
7. Record the outcome where applicable.

The exact onboarding actions depend on the organization's requirements and the available Microsoft 365/Azure administration capabilities.

# Employee Offboarding

Employee offboarding is a controlled workflow designed to identify the user's access, dependencies, and resources before making changes.

The discovery process may include:

- Entra ID account state
- Sign-in sessions
- Licenses
- Group memberships
- Directory roles
- PIM assignments
- Enterprise applications
- Azure RBAC
- Intune
- Exchange mailbox
- Shared mailbox permissions
- Teams ownership
- SharePoint/OneDrive ownership
- Resource ownership

If important dependencies are identified, the workflow should stop and present the dependency, current owner, risk, and recommended action rather than automatically transferring ownership or deleting resources.

The implementation plan may include actions such as:

- Blocking sign-in
- Revoking sessions
- Removing licenses
- Removing group memberships
- Removing application assignments
- Processing access packages
- Processing mailbox-related actions
- Processing OneDrive/SharePoint-related actions
- Removing Azure access

Write operations must only be performed after explicit confirmation.

The complete offboarding workflow is documented in:

`workflows/offboarding.md`
# Group Membership Safety

Before removing group memberships, discover:

- Group name
- Group ID
- Group type
- Membership type
- Whether membership is dynamic
- Whether the user is an owner
- Whether the group is security-sensitive
- Whether the group is required by another service
- Whether the group is used for licensing
- Whether the group is used for Conditional Access
- Whether the group is used for application access

Dynamic group membership must not be treated like static membership.

Do not directly remove dynamic membership.

If the user owns a group, treat the ownership as a dependency.

Do not automatically transfer ownership.

# Critical Group Protection

Groups associated with privileged or service-critical administration require additional confirmation.

Examples include:

- Privileged groups
- PIM-related groups
- Break-glass or emergency groups
- Administrative groups
- Service-critical groups

If the requested operation would affect a critical group, require explicit confirmation before proceeding.

Do not automatically remove a user from a critical group simply because the request says:

```text
Remove the user from all groups.
# Microsoft Teams

Microsoft Teams membership should be handled separately from general group membership.

Removing a user from an Entra ID or Microsoft 365 group does not by itself prove that the user has been removed from every relevant Teams context.

Before making Teams-related changes, discover the user's actual Teams membership and ownership relationships.

The workflow should:

1. Discover relevant Teams membership.
2. Identify Teams ownership where applicable.
3. Determine whether the requested operation affects a Team or its underlying group.
4. Execute only the explicitly approved Teams actions.
5. Query Microsoft again after the change.
6. Verify the expected Teams state.
7. Record the verified result.

Do not report that a user has been removed from Teams solely because a group membership was removed.

Teams membership and ownership must be verified separately.
# License Removal

License removal should be performed only after the user's current license assignments have been discovered and recorded.

The workflow should:

1. Discover the user's assigned licenses.
2. Record the licenses that are expected to be changed.
3. Remove only the approved licenses.
4. Query Microsoft again.
5. Verify that the expected licenses have been removed.
6. Record the verified result.

Successful execution of a license-removal command alone is not sufficient proof that the license was removed.

# Access Package Removal

Access package assignments should be discovered before modification.

The workflow should:

1. Discover relevant access package assignments.
2. Record the access package names and identifiers.
3. Remove only explicitly approved assignments.
4. Query Microsoft again.
5. Verify the expected state.
6. Record the verified result.

Access package removal should not be assumed simply because another form of group or license access was removed.

# Session Revocation

Session or sign-in revocation is intended to invalidate the user's active authentication sessions where supported.

The workflow should:

1. Identify the target user.
2. Execute the approved session-revocation operation.
3. Query Microsoft again.
4. Verify the expected state.
5. Record the result.

Successful command execution is not by itself proof that sessions were successfully revoked.

# Disable User Account

Account disablement is a controlled write operation.

The expected process is:

1. Identify the exact user.
2. Confirm the target account.
3. Set the account to disabled.
4. Query Microsoft again.
5. Verify that `accountEnabled=false`.
6. Record the verified result.

The expected audit result should only state that the account was disabled after the Microsoft state has been queried and verified.

# Destructive Operations

Destructive operations require a higher level of protection than normal administrative changes.

CloudAdmin-AI should not automatically delete:

- Users
- Mailboxes
- OneDrive data
- SharePoint resources
- Teams
- Azure resources
- Business data

Ownership should not be automatically transferred as a substitute for dependency analysis.

Destructive actions require separate consideration and explicit administrator approval.

# User Deletion

User deletion is a high-risk operation.

It should not be performed automatically as part of a normal offboarding workflow.

Before deletion, complete dependency discovery for:

- Group ownership
- Group membership
- Application access
- Directory roles
- PIM
- Azure RBAC
- Teams
- SharePoint
- OneDrive
- Intune
- Exchange
- Other identified business dependencies

Deletion must have explicit confirmation specifically covering the deletion operation.

If deletion is approved, it should be treated as a final identity operation.

After deletion, query Microsoft again and verify the expected nonexistence of the user.

# Dependency Analysis

Dependency analysis is a central safety mechanism in CloudAdmin-AI.

Before high-impact operations, the framework should identify relationships that could be affected by the requested change.

Examples include:

- Group ownership
- Group membership
- Licensing
- Conditional Access
- Application access
- Azure RBAC
- PIM
- Teams
- SharePoint
- OneDrive
- Intune
- Mailbox permissions
- Service dependencies
- Resource ownership

If an important dependency is discovered, the workflow should stop and present:

- The dependency
- The current owner or relationship
- The potential risk
- The recommended action

CloudAdmin-AI should not automatically transfer ownership or remove a dependency simply to complete an offboarding operation.

# Confirmation Model

Write operations require explicit administrator confirmation.

Before execution, the administrator should be shown the proposed implementation plan.

The plan should identify:

- Target user or resource
- Requested operation
- Actions that will be performed
- Relevant dependencies
- Potential risks
- Actions that will not be performed
- Any destructive operation requiring separate approval

The framework should execute only the actions that were explicitly approved.

It should not silently add additional actions to the approved plan.

# Verification Model

Verification is required after write operations.

The expected execution pattern is:

```text
EXECUTE
   |
   v
QUERY MICROSOFT
   |
   v
COMPARE EXPECTED STATE
   |
   v
VERIFY
   |
   v
RECORD RESULT
```

# Final Status Values

CloudAdmin-AI can use the following final status values:

- `SUCCESS`
- `PARTIAL_SUCCESS`
- `FAILED`
- `FAILED_VERIFICATION`
- `BLOCKED_BY_DEPENDENCY`
- `CANCELLED`

The final status should reflect the verified result of the operation.

Statuses should never be fabricated.

# Audit Records

CloudAdmin-AI supports local audit records for administrative workflows.

Audit records should be created after the workflow reaches a final status.

The audit record should contain verified information such as:

- Timestamp
- Target user or object
- Requested operation
- Actions performed
- Verification results
- Final status
- Relevant object identifiers
- Relevant license or group information where applicable

Audit records should represent the actual verified Microsoft state.

The framework must never fabricate:

- Actions
- Statuses
- Verification results
- Timestamps
- Object identifiers
- License information
- Group information

JSON audit records can be stored under the local audit directory.

Production audit data should normally remain outside the public repository.

# Audit Security

Audit records must not contain authentication secrets or sensitive credentials.

Never store:

- Passwords
- Access tokens
- Refresh tokens
- Client secrets
- Private keys
- OAuth credentials
- Mailbox contents
- OneDrive file contents
- Other authentication secrets

Audit information should contain enough information to demonstrate what administrative operation was performed and what verified result was obtained without exposing credentials or private content.

# CSV Audit

CloudAdmin-AI also supports CSV audit records.

The CSV audit should represent the verified administrative result.

CSV records should be generated only from actual workflow results.

Do not fabricate audit values simply to complete a CSV record.

Production audit files should remain outside the public repository unless they have been deliberately sanitized and are explicitly intended for publication.

# Generate the Dashboard

The project includes a dashboard component for displaying audit information.

The dashboard files are located under:

```text
dashboard/
```

The dashboard build script is:

```text
dashboard/build-dashboard.ps1
```

A typical local workflow is:

```powershell
.\dashboard\build-dashboard.ps1
```

The dashboard should be generated from appropriate local audit data.

Do not publish production audit information containing private or tenant-specific data.

# PowerShell Audit Scripts

The project contains PowerShell scripts for writing audit records.

Available scripts include:

```text
audit/write-offboarding-record.ps1
audit/write-offboarding-csv.ps1
```

These scripts are intended to support the local audit workflow.

Before using them in production, review the scripts and ensure that the supplied data represents actual verified results.

Do not use fabricated values to create production audit records.

# Recommended Offboarding Order

A recommended controlled offboarding sequence is:

```text
1. Discovery
       |
       v
2. Dependency Analysis
       |
       v
3. Implementation Plan
       |
       v
4. Explicit Confirmation
       |
       v
5. Revoke Sessions
       |
       v
6. Disable Account
       |
       v
7. Process Groups
       |
       v
8. Process Teams
       |
       v
9. Process Access Packages
       |
       v
10. Remove Licenses
       |
       v
11. Verify Changes
       |
       v
12. Write CSV Audit
       |
       v
13. Delete User Only If Separately Requested
       |
       v
14. Verify Deletion
       |
       v
15. Final Status
```

Deletion is deliberately separated from normal offboarding.

# Important Execution Rule

The core execution rule is:

> Execute only approved actions, query Microsoft again, verify the expected state, and record the verified result.

A successful command is not automatically a successful administrative operation.

If the expected state cannot be verified, the workflow must not report the operation as successfully verified.

# Example Workflow

A simplified offboarding workflow looks like this:

```text
Administrator Request
        |
        v
Resolve Exact User
        |
        v
Discover Current State
        |
        v
Discover Dependencies
        |
        v
Present Implementation Plan
        |
        v
Administrator Confirmation
        |
        v
Execute Approved Actions
        |
        v
Query Microsoft Again
        |
        v
Verify Expected State
        |
        +---- Verification Failed
        |             |
        |             v
        |       FAILED_VERIFICATION
        |
        v
Create Audit Record
        |
        v
Final Status
```

# Security Model

CloudAdmin-AI is designed around several security principles.

## 1. Exact Target Resolution

Never guess:

- Tenant
- User
- Group
- License
- Mailbox
- Azure subscription
- Azure resource
- Role

If multiple objects match, stop and request clarification.

## 2. Dependency Discovery

Before high-impact operations, discover relevant dependencies.

Examples include:

- Ownership
- Licensing
- Conditional Access
- Application access
- Azure RBAC
- PIM
- Teams
- SharePoint
- OneDrive
- Intune
- Mailbox permissions
- Service dependencies

## 3. Explicit Confirmation

Write operations require explicit administrator confirmation.

The framework should not silently perform additional actions outside the approved plan.

## 4. Verification

Every write operation should follow:

```text
EXECUTE
   |
   v
QUERY MICROSOFT
   |
   v
COMPARE EXPECTED STATE
   |
   v
VERIFY
   |
   v
RECORD RESULT
```

# Sensitive Data

Never commit sensitive information to the public repository.

Examples include:

- Passwords
- OAuth tokens
- Refresh tokens
- Client secrets
- Private keys
- Certificates containing private material
- Tenant-specific credentials
- Production audit records
- Mailbox contents
- OneDrive file contents

Use placeholders such as:

```text
YOUR-TENANT-ID
YOUR-CLIENT-ID
YOUR-CLIENT-SECRET
```

when documenting configuration examples.

# Production Safety

Before using CloudAdmin-AI against a production environment:

1. Review the applicable policies.
2. Review the requested workflow.
3. Confirm the target tenant.
4. Confirm the target user or resource.
5. Review dependencies.
6. Review the proposed implementation plan.
7. Confirm the write operations explicitly.
8. Verify every resulting state.
9. Review the audit result.

Do not treat the framework as an unrestricted automation engine.

Administrators remain responsible for reviewing and approving changes.

# Project Structure

The repository is organized as follows:

```text
CloudAdmin-AI/
|
+-- audit/
|   +-- write-offboarding-csv.ps1
|   +-- write-offboarding-record.ps1
|   +-- offboarding/
|
+-- dashboard/
|   +-- build-dashboard.ps1
|   +-- index.html
|
+-- policies/
|   +-- audit.md
|   +-- confirmation.md
|   +-- verification.md
|
+-- prompts/
|   +-- admin-policy.md
|
+-- workflows/
|   +-- onboarding.md
|   +-- offboarding.md
|
+-- .gitignore
+-- LICENSE
+-- README.md
```

Local runtime and audit data may exist in the working directory but should not be committed when excluded by `.gitignore`.

# Policy Files

The policy layer contains the main behavioral controls for the framework.

Important policy files include:

```text
policies/audit.md
policies/confirmation.md
policies/verification.md
```

The project also contains:

```text
prompts/admin-policy.md
```

These files define the intended administrative behavior, confirmation requirements, verification requirements, and audit rules.

# Troubleshooting

## MCP Connection Problems

If the MCP connection is unavailable:

1. Check that the MCP client is running.
2. Check the MCP server configuration.
3. Check that required environment variables are configured.
4. Check authentication.
5. Confirm that the administrator has the required permissions.
6. Confirm that the correct tenant is being used.

Do not place credentials directly into the public repository while troubleshooting.

## Git Problems

Check the repository state:

```powershell
git status
```

Check the configured remote:

```powershell
git remote -v
```

Check tracked files:

```powershell
git ls-files
```

If a sensitive file appears in the tracked-file list, stop before pushing.

## Audit Problems

If an audit record cannot be verified, do not fabricate the missing information.

Investigate the underlying Microsoft 365/Azure operation and verify the state before recording the final result.

## Verification Problems

If a write operation completes but the expected Microsoft state cannot be confirmed:

- Do not report success.
- Record the verification failure where appropriate.
- Stop the workflow.
- Investigate the current Microsoft state.

# Development

When modifying CloudAdmin-AI:

1. Understand the existing policy and workflow.
2. Make the smallest required change.
3. Avoid weakening confirmation or verification controls.
4. Avoid introducing secrets.
5. Test the affected scripts or documentation.
6. Review the Git diff.
7. Check the tracked files.
8. Commit only the intended changes.

# Before Committing

Always review the repository before committing:

```powershell
git status
```

Review the changes:

```powershell
git diff
```

Review staged files:

```powershell
git diff --cached
```

Review tracked files:

```powershell
git ls-files
```

Look for accidental secrets, credentials, tenant-specific data, production audit records, or other private information.

Only commit files that are intentionally part of the public project.

# Contributing

Contributions should preserve the project's safety model.

When proposing changes:

- Keep target resolution explicit.
- Preserve dependency discovery.
- Preserve administrator confirmation.
- Preserve post-action verification.
- Avoid automatic destructive operations.
- Avoid storing secrets.
- Keep audit records based on verified results.
- Document meaningful behavioral changes.

For changes involving Microsoft 365 or Azure administration, explain the affected workflow and safety considerations.

# Disclaimer

CloudAdmin-AI is provided as an administrative framework and reference implementation.

It does not replace:

- Microsoft documentation
- Organizational security policies
- Change-management procedures
- Identity governance processes
- Administrator review
- Legal or regulatory requirements

Administrators are responsible for validating the configuration, permissions, policies, and actions used in their environment.

Test changes in an appropriate non-production environment before applying them to production.

# License

CloudAdmin-AI is released under the MIT License.

See the `LICENSE` file for the complete license text.

# Repository

Source code:

https://github.com/ynarvel/CloudAdmin-AI

The repository contains the public, sanitized version of the project.

Private authentication configuration, tenant-specific secrets, and production runtime data should remain outside the public repository.

# Summary

CloudAdmin-AI provides a controlled approach to Microsoft 365 and Azure administration based on:

```text
Discover
   |
   v
Analyze Dependencies
   |
   v
Plan
   |
   v
Confirm
   |
   v
Execute
   |
   v
Verify
   |
   v
Audit
```

The most important principle is:

> **Do not guess, do not silently expand the scope of an approved operation, do not automatically destroy data, and do not report success without verification.**