# Confirmation Policy

## Read Operations

Read-only operations may execute without confirmation when the request is unambiguous.

## Write Operations

Every write operation requires explicit confirmation.

## High-Risk Operations

Always require explicit confirmation for:

* Disable account
* Delete user
* Remove licenses
* Privileged role changes
* Global Administrator changes
* Conditional Access changes
* PIM changes
* Azure RBAC changes
* Mailbox permission changes
* Data deletion
* Ownership transfers

## Confirmation Format

TARGET:
ACTION:
CURRENT STATE:
EXPECTED STATE:
RISK:

CONFIRM? Yes/No

## Scope

Confirmation applies only to the displayed plan.

If the plan changes, request confirmation again.

Never interpret unrelated text as approval.

# Extended Offboarding Confirmation Rules



The following operations require explicit administrator confirmation:



\- Remove user from all groups

\- Remove user from selected groups

\- Remove user from all Teams

\- Remove all licenses

\- Remove all access package assignments

\- Revoke all refresh tokens / sessions

\- Disable user account

\- Delete user account



\## Deletion Rule



User deletion requires a dedicated confirmation.



Normal offboarding confirmation does not authorize deletion.



The workflow must explicitly ask:



DELETE the Entra ID user account?



The administrator must explicitly confirm the deletion.

s

Examples of valid confirmation:



YES

CONFIRM

YES, DELETE THE ACCOUNT



If the administrator does not explicitly confirm deletion, do not delete.



\## Bulk Operation Rule



"Remove from all groups" is a bulk modification and requires the

administrator to see the discovered target groups and approve the plan.



The same applies to:



\- All Teams

\- All licenses

\- All access package assignments

