\# 05 — Troubleshooting \& Common Issues



This doc captures real troubleshooting steps and notes from the lab.



\## Common issues



\### 1) Client cannot find domain

\- Symptom: "DNS name does not exist" or "Domain not found"

\- Fixes:

&nbsp; - Ensure client DNS points to the DC IP (not external DNS).

&nbsp; - On DC, confirm Forward Lookup Zone exists for your domain.

&nbsp; - Test: `nslookup corp.local` from client.



\### 2) Cannot create users with script

\- Symptom: `New-ADUser` errors like "Access denied" or "The term 'New-ADUser' is not recognized"

\- Fixes:

&nbsp; - Run PowerShell as an account with permission to create users in target OU.

&nbsp; - Install RSAT / ActiveDirectory module: `Install-WindowsFeature RSAT-AD-PowerShell` (on Server use Server Manager).

&nbsp; - Confirm `$TargetOU` DN is correct.



\### 3) Duplicate username collisions

\- Symptom: Script reports user already exists

\- Fix:

&nbsp; - Check the username generation logic (adjust `$StartId` or username format).

&nbsp; - Optionally add a uniqueness fallback (append random digits).



\### 4) Login fails for created user

\- Symptom: "The trust relationship between this workstation and the primary domain failed" or credential errors

\- Fixes:

&nbsp; - Ensure the client was joined to the domain \*\*after\*\* users were created (order doesn't strictly matter but client must be joined).

&nbsp; - Check account is enabled and password is correct in ADUC.

&nbsp; - Ensure replication (if multi-DC) has occurred.



\## Helpful commands \& logs

\- On DC:

&nbsp; - `Get-EventLog -LogName Security -Newest 50` — view recent security events (logons, etc)

&nbsp; - `Get-ADUser -Filter \* -SearchBase "OU=Employees,DC=corp,DC=local" | Select SamAccountName`

\- On client:

&nbsp; - `whoami` — shows current effective user

&nbsp; - `nltest /dsgetdc:corp.local` — verify DC discovery

&nbsp; - `ipconfig /all` — check DNS settings



---



\## Notes

Keep snapshots before major steps. If you accidentally create thousands of accounts you want to delete, filter on display name prefix or OU and pipe to `Remove-ADUser` carefully.



