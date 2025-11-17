\# 03 — PowerShell: Bulk User Creation



This doc explains how the provisioning script works and how to run it safely.



\## Overview

`bulk-user-creation.ps1` lives in `/scripts`. It uses the ActiveDirectory PowerShell module to create many user objects and place them in `OU=Employees`.



\### Key points

\- The script uses `New-ADUser` to create each account.

\- Change these variables at the top of the script before running:

&nbsp; - `$DomainDN` — your domain DN (e.g., `DC=corp,DC=local`)

&nbsp; - `$TargetOU` — OU path (e.g., `OU=Employees,DC=corp,DC=local`)

&nbsp; - `$UserPassword` — lab password (do not use in production)

&nbsp; - `$NumberOfUsers` — number to create



\## Running the script

1\. On the Domain Controller (or a machine with RSAT/AD module and network access), open PowerShell as Administrator.

2\. Unblock script (if needed): `Unblock-File .\\bulk-user-creation.ps1`

3\. Run: `.\\bulk-user-creation.ps1`

4\. Confirm typing `YES` when prompted.



\## Verification

\- Open \*\*Active Directory Users and Computers\*\* and navigate to the `Employees` OU.

\- You should see the created accounts (check a few display names and usernames).

\- Attempt to log in with one of the accounts on the domain-joined client (see docs/04-client-join.md).



\## Script notes \& improvements

\- For realism: replace the simple `$UserPassword` with per-user generated passwords and store them in a secure vault (or CSV for lab use).

\- Consider logging output to a CSV for easier verification and record-keeping.

\- To remove created users later, create a cleanup script that filters by `DisplayName` prefix or OU and removes them.



