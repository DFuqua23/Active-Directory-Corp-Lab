\# 02 — Active Directory Setup \& Promotion



This doc walks through promoting a Windows Server to an Active Directory Domain Controller.



\## Prerequisites

\- Windows Server installed and patched

\- Static IP configured on the server

\- Administrator account with local admin rights



\## Steps



1\. \*\*Install AD DS role\*\*

&nbsp;  - Open Server Manager → Add roles and features → Role-based or feature-based installation → Select server → Server Roles → check \*Active Directory Domain Services\* → Add Features → Next → Install.



2\. \*\*Promote to Domain Controller\*\*

&nbsp;  - After role install completes, in Server Manager you'll see a flag notification to promote the server to a domain controller.

&nbsp;  - Choose \*\*Add a new forest\*\* and enter your root domain: `corp.local`

&nbsp;  - Set Directory Services Restore Mode (DSRM) password — store this somewhere safe (lab-only).

&nbsp;  - Continue through the wizard and reboot as required.



3\. \*\*Verify\*\*

&nbsp;  - After reboot, open \*\*Active Directory Users and Computers\*\*.

&nbsp;  - You should see your domain (`corp.local`), default containers (Users, Computers), and the server listed.

&nbsp;  - Confirm DNS is installed and shows the forward lookup zone for your domain.



\## Create OUs

From Active Directory Users and Computers:

\- Right-click your domain → New → Organizational Unit

\- Create OUs: `Admins`, `Employees`, `Computers`.



\## Security note (lab)

\- Keep this lab on an isolated network.

\- Do not connect this DC to your corp/production network.



