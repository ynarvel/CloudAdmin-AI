\# Offboarding Audit Policy



\## Purpose



Create a local audit record after every offboarding operation.



\## Record



Each completed offboarding must create one JSON record under:



audit/offboarding/



\## Required Information



Record:



\- Operation type

\- Timestamp

\- User display name

\- User principal name

\- Entra object ID

\- Actions attempted

\- Result of each action

\- Verification result of each action

\- Overall status

\- Warnings

\- Errors

\- Dependencies discovered



\## Status



Use one of:



SUCCESS

PARTIAL\_SUCCESS

FAILED

FAILED\_VERIFICATION

BLOCKED\_BY\_DEPENDENCY

CANCELLED



\## Security



Never record:



\- Passwords

\- Access tokens

\- Refresh tokens

\- Client secrets

\- Private keys

\- Authentication cookies

\- Mailbox contents

\- OneDrive contents

\- Complete Microsoft API responses



Only record information required for administrative auditing.



\## Audit Rule



Create the audit record only after the offboarding workflow has reached

a final status.



The audit record must reflect the actual verified result.



Do not claim SUCCESS unless the offboarding workflow itself reported

verified success.

