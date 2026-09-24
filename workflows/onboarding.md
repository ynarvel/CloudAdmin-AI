# Employee Onboarding Workflow

## Safety

This workflow must never execute automatically.

Before any write operation:

1. Resolve the exact user.
2. Check whether the account already exists.
3. Discover available licenses and required resources.
4. Build a complete implementation plan.
5. Display all proposed changes.
6. Obtain explicit administrator confirmation.
7. Execute only approved actions.
8. Verify every completed action.

## Required Information

Collect:

- First name
- Last name
- User Principal Name
- Department
- Job title
- Location
- Manager
- Start date
- Employee type
- Requested profile

Never guess missing information.

## Discovery

Check:

- Existing Entra user
- Available licenses
- Security groups
- Microsoft 365 groups
- Exchange requirements
- Shared mailbox requirements
- Intune requirements
- Azure access requirements

## Plan

Display:

USER:
UPN:
DEPARTMENT:
JOB TITLE:
LOCATION:
MANAGER:
PROFILE:

LICENSE:
GROUPS:
SHARED MAILBOXES:
INTUNE:
AZURE:

RISK:

## Confirmation

Ask:

"Confirm this onboarding plan? Yes/No"

No write operation may occur without explicit confirmation.

## Execution

Use the existing Minerva MCP tools.

Execute only actions explicitly included in the approved plan.

## Verification

After each write operation:

1. Query Microsoft again.
2. Compare actual state with expected state.
3. Continue only when verification succeeds.

If verification fails, stop the workflow.

## Final Status

SUCCESS
PARTIAL_SUCCESS
FAILED
FAILED_VERIFICATION
CANCELLED
