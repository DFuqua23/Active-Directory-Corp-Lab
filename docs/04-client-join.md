\# 04 — Joining the Windows 10 Client to the Domain



This doc shows how to join a Windows 10 VM to the domain and log in as a domain user.



\## Pre-checks

\- Ensure client DNS points to the Domain Controller IP.

\- Ensure the client can ping the DC by hostname and IP.



\## Steps to join the domain

1\. On the Windows 10 client, open Settings → System → About → Rename this PC (or Control Panel → System).

2\. Click \*\*Join a domain\*\* (or in older UI: Change settings → Change → Member of Domain).

3\. Enter domain: `corp.local`

4\. When prompted, provide domain credentials with rights to join (Domain Admin or delegated account).

5\. Reboot when prompted.



\## Log in as a domain user

\- At the login screen, choose \*\*Other user\*\*.

\- Use username: `CORP\\<username>` or `<username>@corp.local`

\- Password: the password from the provisioning script (or the password you set)



\## Troubleshooting tips

\- If you get DNS errors, verify the client DNS setting and that the DC's DNS service is running.

\- If join fails due to permissions, use a Domain Admin account to perform the join.



