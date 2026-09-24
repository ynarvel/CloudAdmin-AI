# Verification Policy

## Core Rule

Command execution is not proof of successful administration.

Every write operation must be verified against Microsoft.

## Process

EXECUTE
↓
QUERY MICROSOFT
↓
COMPARE STATE
↓
VERIFY
↓
REPORT STATUS

## SUCCESS

Use SUCCESS only when the requested state is confirmed.

## FAILED

Use FAILED when execution fails.

## FAILED\_VERIFICATION

Use FAILED\_VERIFICATION when execution completes but the requested state cannot be confirmed.

## PARTIAL\_SUCCESS

Use PARTIAL\_SUCCESS when some workflow actions succeed and others fail.

## Stop Conditions

Stop when:

* Target is ambiguous
* Permission is insufficient
* Microsoft returns an unexpected error
* Verification fails
* A dependency is discovered
* The administrator has not explicitly approved the operation

## Final Report

ACTION:
TARGET:
BEFORE:
REQUESTED:
AFTER:
VERIFICATION:
STATUS:

# Extended Offboarding Verification



\## Groups



Before:

Record all applicable group memberships.



After:

Query group memberships again.



Expected:

Requested memberships are removed.



Dynamic group memberships must not be treated as removable static

memberships.



\## Teams



Before:

Discover Teams memberships.



After:

Query Teams memberships.



Expected:

Requested Teams memberships are absent.



Do not infer Teams removal solely from group removal.



\## Licenses



Before:

Record assigned license SKU IDs.



After:

Query assigned licenses.



Expected:

Requested licenses are absent.



\## Access Packages



Before:

Record access package assignments.



After:

Query access package assignments.



Expected:

Requested assignments are absent.



\## Account



Before:

Record accountEnabled state.



After:

Query the user.



Expected:



accountEnabled = false



\## Sessions



Record the refresh-token/session revocation operation and perform

available post-operation verification.



\## Deletion



Before:

Confirm explicit deletion authorization.



After:

Query the user.



Expected:



User does not exist.



If the user still exists:



FAILED\_VERIFICATION



Never report successful deletion without verification.

