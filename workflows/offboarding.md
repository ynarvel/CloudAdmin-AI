# Employee Offboarding Workflow

## Safety

Offboarding is a controlled administrative workflow.

Never automatically delete the user or business data.

## Discovery

Before making changes, inspect:

* Entra ID account
* Sign-in state
* Active sessions
* Microsoft 365 licenses
* Security groups
* Microsoft 365 groups
* Directory roles
* PIM assignments
* Enterprise applications
* Azure RBAC
* Intune devices
* Exchange mailbox
* Shared mailbox permissions
* Teams ownership
* SharePoint ownership
* OneDrive ownership
* Resource ownership

## Dependency Gate

If important dependencies are found:

STOP.

Display:

DEPENDENCY:
RESOURCE:
CURRENT OWNER:
RISK:
RECOMMENDED ACTION:

Do not automatically transfer ownership.

## Plan

Depending on administrator instructions and approved policy, the plan may include:

* Block sign-in
* Revoke sessions
* Remove licenses
* Remove group memberships
* Remove application assignments
* Remove privileged access
* Process mailbox
* Process OneDrive
* Process Intune devices
* Remove Azure access

## Data Protection

Do not automatically:

* Delete the user
* Delete mailbox data
* Delete OneDrive data
* Delete SharePoint data
* Delete Teams data
* Delete Azure resources
* Transfer ownership

Mailbox conversion, retention, ownership transfer and data deletion require separate assessment and explicit approval.

## Confirmation

Display the complete implementation plan.

Ask:

"Confirm this offboarding plan? Yes/No"

No write operation may occur without explicit confirmation.

## Execution

Execute only approved actions.

Do not add additional actions.

## Verification

After every write:

1. Query Microsoft again.
2. Verify the expected state.
3. Record the result.

If verification fails, stop.

## Final Status

SUCCESS
PARTIAL\_SUCCESS
FAILED
FAILED\_VERIFICATION
BLOCKED\_BY\_DEPENDENCY
CANCELLED

## Audit Record



After the offboarding workflow reaches a final status, create a local

JSON audit record.



Location:



audit/offboarding/



Filename format:



YYYY-MM-DD\_HH-mm-ss\_<sanitized-user>.json



The filename must not contain characters invalid for Windows filenames.



\## Audit Record Fields



Record:



\- operation

\- timestamp

\- displayName

\- userPrincipalName

\- objectId

\- actions

\- verification

\- dependencies

\- warnings

\- errors

\- finalStatus



\## Example



{

&#x20; "operation": "OFFBOARDING",

&#x20; "timestamp": "2026-08-31T12:00:00+02:00",

&#x20; "displayName": "Example User",

&#x20; "userPrincipalName": "example@domain.com",

&#x20; "objectId": "OBJECT-ID",

&#x20; "actions": \[

&#x20;   {

&#x20;     "action": "Block sign-in",

&#x20;     "result": "SUCCESS",

&#x20;     "verified": true

&#x20;   },

&#x20;   {

&#x20;     "action": "Revoke sessions",

&#x20;     "result": "SUCCESS",

&#x20;     "verified": true

&#x20;   },

&#x20;   {

&#x20;     "action": "Remove licenses",

&#x20;     "result": "SUCCESS",

&#x20;     "verified": true

&#x20;   }

&#x20; ],

&#x20; "dependencies": \[],

&#x20; "warnings": \[],

&#x20; "errors": \[],

&#x20; "finalStatus": "SUCCESS"

}



\## Important



The audit record must be generated from the actual operation results.



Do not fabricate results.



Do not write SUCCESS if verification failed.

# Post-Offboarding Audit

After the offboarding operation has completed and verification has
finished, create a local audit record.

IMPORTANT:
- Do not create the audit record before the operation has a final status.
- Do not invent or estimate results.
- Record only the actual verified results.
- Do not store passwords, tokens, secrets, mailbox contents, or file contents.

Audit directory:

C:\Users\<WINDOWS_USER>\CloudAdmin-AI\audit\offboarding

Create one JSON file for each offboarding operation.

Filename:

YYYY-MM-DD_HH-mm-ss_<UPN-SANITIZED>.json

The JSON must contain:

{
  "operation": "OFFBOARDING",
  "timestamp": "<actual timestamp>",
  "displayName": "<actual display name>",
  "userPrincipalName": "<actual UPN>",
  "objectId": "<actual Entra object ID>",
  "actions": [],
  "verification": [],
  "dependencies": [],
  "warnings": [],
  "errors": [],
  "finalStatus": "<actual final status>"
}

For every action record:

- action
- result
- verified

The finalStatus must exactly match the actual workflow result.

Allowed statuses:

SUCCESS
PARTIAL_SUCCESS
FAILED
FAILED_VERIFICATION
BLOCKED_BY_DEPENDENCY
CANCELLED

After creating the audit JSON, run:

C:\Users\<WINDOWS_USER>\CloudAdmin-AI\dashboard\build-dashboard.ps1

The dashboard must only be updated from the generated audit JSON files.

Do not execute another Microsoft 365 or Azure operation merely to create
or update the audit record.

## FINAL AUDIT RECORD — REQUIRED

After ALL Microsoft 365/Azure offboarding actions have completed and
ALL post-action verification has completed, create the local audit record.

This is a POST-OPERATION action only.

Never create an audit record before the final status is known.

### Audit Writer

Use the local PowerShell script:

C:\Users\<WINDOWS_USER>\CloudAdmin-AI\audit\write-offboarding-record.ps1

Replace <WINDOWS_USER> with the actual Windows user profile path.

Pass the following values from the ACTUAL verified operation:

- DisplayName
- UserPrincipalName
- ObjectId
- FinalStatus
- ActionsJson
- VerificationJson
- DependenciesJson
- WarningsJson
- ErrorsJson

Example structure:

powershell -File "C:\Users\<WINDOWS_USER>\CloudAdmin-AI\audit\write-offboarding-record.ps1" `
  -DisplayName "<ACTUAL_DISPLAY_NAME>" `
  -UserPrincipalName "<ACTUAL_UPN>" `
  -ObjectId "<ACTUAL_OBJECT_ID>" `
  -FinalStatus "<ACTUAL_FINAL_STATUS>" `
  -ActionsJson "<ACTUAL_ACTIONS_JSON>" `
  -VerificationJson "<ACTUAL_VERIFICATION_JSON>" `
  -DependenciesJson "<ACTUAL_DEPENDENCIES_JSON>" `
  -WarningsJson "<ACTUAL_WARNINGS_JSON>" `
  -ErrorsJson "<ACTUAL_ERRORS_JSON>"

### Dashboard Update

After the audit JSON has been successfully created, execute:

powershell -File "C:\Users\<WINDOWS_USER>\CloudAdmin-AI\dashboard\build-dashboard.ps1"

Only report:

AUDIT RECORD: CREATED

when the JSON file was actually created.

Only report:

DASHBOARD: UPDATED

when records.json was successfully regenerated.

If audit creation fails:

AUDIT RECORD: FAILED

Do not claim that the dashboard was updated.

### Critical Rule

The audit record must reflect the actual verified Microsoft state.

Never fabricate:

- status
- actions
- verification results
- timestamps
- object IDs
- license information
- group information

Never store:

- passwords
- access tokens
- refresh tokens
- client secrets
- private keys
- mailbox contents
- OneDrive contents

## OFFBOARDING AUDIT — CSV

After the offboarding operation has completed and all Microsoft 365/Azure
verification has completed, append one record to:

C:\Users\<WINDOWS_USER>\CloudAdmin-AI\audit\offboarding-record.csv

Use the local script:

C:\Users\<WINDOWS_USER>\CloudAdmin-AI\audit\write-offboarding-csv.ps1

The record must contain the actual verified values:

- DisplayName
- UserPrincipalName
- ObjectId
- FinalStatus
- Actions
- Verification
- Dependencies
- Warnings
- Errors

The FinalStatus must be the actual final workflow status.

Allowed statuses:

SUCCESS
PARTIAL_SUCCESS
FAILED
FAILED_VERIFICATION
BLOCKED_BY_DEPENDENCY
CANCELLED

The CSV record must be created only after the final verification stage.

Never fabricate results.

Never record:

- Passwords
- Access tokens
- Refresh tokens
- Client secrets
- Private keys
- Mailbox contents
- OneDrive contents

After creating the record, report:

AUDIT CSV: CREATED

If CSV creation fails, report:

AUDIT CSV: FAILED

# Extended Offboarding Operations

## Available Offboarding Actions

The administrator may request one or more of the following operations:

1. Disable user account
2. Revoke all refresh tokens / sign-in sessions
3. Remove all licenses
4. Remove user from all groups
5. Remove user from selected groups
6. Remove user from all Teams
7. Remove all access package assignments
8. Delete user account

## Action Selection

The workflow must determine exactly which actions the administrator requested.

Never assume that every available action should be executed.

If the administrator requests:

"Remove user from all groups"

remove the user from applicable group memberships after dependency
discovery and confirmation.

If the administrator requests:

"Remove user from selected groups"

first identify the specified groups and confirm the exact groups before
executing removal.

## Group Removal Safety

Before removing group memberships, discover:

- Group name
- Group ID
- Group type
- Membership type
- Whether membership is dynamic
- Whether the user is an owner
- Whether the group is security-sensitive
- Whether the group is required for another service
- Whether the group is used for licensing
- Whether the group is used for Conditional Access
- Whether the group is used for application access

Do not attempt to remove a dynamic membership directly.

For dynamic groups, report:

DYNAMIC_MEMBERSHIP

and allow the membership rule to determine membership.

Do not automatically remove ownership of groups.

If the user is an owner, report the ownership dependency and stop that
specific ownership operation until an explicit ownership-transfer
instruction is provided.

## Critical Group Protection

Do not automatically remove membership from privileged or critical
groups merely because "all groups" was requested.

Identify potentially critical groups such as:

- Global Administrator role groups
- Privileged role groups
- PIM groups
- Emergency / break-glass related groups
- Administrative groups
- Groups required for service operation

Report these as dependencies and require explicit confirmation before
removing membership.

## Teams Removal

Teams membership must be discovered separately.

Determine whether the Teams membership is backed by:

- Microsoft 365 Group membership
- Direct Team membership
- Private/shared channel membership

Do not claim that a user was removed from Teams merely because a group
membership was removed.

Verify the actual Teams membership after the operation.

If Teams membership is already removed as a consequence of removing the
associated Microsoft 365 Group membership, record the dependency and
verification result accurately.

## License Removal

If "Remove all licenses" is requested:

1. Discover all assigned license SKUs.
2. Record the licenses before modification.
3. Remove the licenses.
4. Query Microsoft Graph again.
5. Verify that the requested licenses are no longer assigned.

Do not claim SUCCESS until verification confirms the expected state.

## Access Package Removal

If "Remove all access package assignments" is requested:

1. Discover all active access package assignments for the user.
2. Record package names and assignment IDs.
3. Remove each applicable assignment.
4. Query Microsoft again.
5. Verify that the assignments were removed.

If an assignment cannot be removed, report the exact failure and continue
only where the workflow permits safe independent execution.

## Refresh Token / Session Revocation

If requested, revoke the user's active sign-in sessions / refresh tokens.

After execution, perform a read-only verification where supported.

Record:

- Action
- Result
- Verification result

Do not treat successful command execution alone as proof of revocation.

## Disable Account

If "Disable User Account" is requested:

Set the user's account to disabled.

Then query the user again and verify:

accountEnabled = false

Only then report:

DISABLE: VERIFIED

## Delete User Account

Deletion is a HIGH-RISK operation.

Deleting a user must NEVER be performed automatically as a consequence
of normal offboarding.

If deletion is requested:

1. Perform complete dependency discovery.
2. Display the complete deletion impact.
3. Require explicit confirmation specifically for deletion.

The confirmation must clearly state:

"DELETE the Entra ID user account?"

A previous confirmation for normal offboarding does NOT constitute
confirmation for deletion.

Do not delete if critical dependencies remain unresolved.

Deletion must be the final identity operation.

After deletion, verify the user no longer exists.

If Microsoft reports that the user still exists, report:

FAILED_VERIFICATION

Never report SUCCESS merely because the delete command returned without
an error.

## Recommended Execution Order

Unless the administrator explicitly specifies another safe order:

1. Discovery
2. Dependency analysis
3. Implementation plan
4. Confirmation
5. Revoke sessions / refresh tokens
6. Disable account
7. Remove selected/all group memberships
8. Remove Teams memberships where applicable
9. Remove access package assignments
10. Remove licenses
11. Verify all changes
12. Write CSV audit record
13. Delete account ONLY if separately requested and separately confirmed
14. Verify deletion
15. Final status report

## Verification Rule

Every write operation follows:

EXECUTE
→ QUERY MICROSOFT
→ COMPARE EXPECTED STATE
→ VERIFY
→ RECORD RESULT

Never use command execution output as the sole proof of success.

## Final Status

Use:

SUCCESS
PARTIAL_SUCCESS
FAILED
FAILED_VERIFICATION
BLOCKED_BY_DEPENDENCY
CANCELLED

The final status must reflect the actual verified state.
