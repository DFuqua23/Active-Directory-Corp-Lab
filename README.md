# Active Directory Home Lab – Windows Server 2019 + Windows 10

This project is a small Active Directory lab I built at home to gain hands-on experience with fundamental IT infrastructure skills, including installing and configuring virtual machines, a domain controller, managing user accounts, joining a client to a domain, and testing domain logons for multiple users. It uses Windows Server 2019 as a domain controller and a Windows 10 client joined to the domain. 
Ultimately, the goal was to simulate a small to medium corporate network environment where users log into a domain, accounts are managed centrally, and I can break and fix things on purpose to practice basic troubleshooting and active directory fundamentals.

![Windows Server](https://img.shields.io/badge/OS-Windows%20Server-blue)
![Windows 10](https://img.shields.io/badge/OS-Windows%2010-brightgreen)
![VirtualBox](https://img.shields.io/badge/Hypervisor-VirtualBox-orange)
![PowerShell](https://img.shields.io/badge/Automation-PowerShell-blueviolet)
![Active Directory](https://img.shields.io/badge/Technology-Active%20Directory-blue)


## Lab Overview

| Component        | Role / Purpose |
|-----------------|---------|
| Oracle VirtualBox     | Hypervisor / virtualization platform | 
| Windows Server 2019   | Domain Controller (AD DS + DNS) | 
| Windows 10        | Client OS / domain joined user workstation |
| Active Directory Domain Services (AD DS)| Identity & domain infrastructure  |
| Organizational Units (OUs) & Groups | Simulate department based user organization |


## Lab Architecture

<img width="600" height="450" alt="image" src="https://github.com/user-attachments/assets/df163f8e-25e0-4345-8037-47fcc88876a8" />

**What I Built:**

In VirtualBox, I set up two virtual machines:

DC01 – Windows Server 2019
Promoted to a domain controller
Installed Active Directory Domain Services (AD DS) and DNS
Used a PowerShell script to create about 1,000 user accounts in a dedicated OU

CLIENT01 – Windows 10
Pointed its DNS to the domain controller
Joined it to the domain
Signed in with multiple domain user accounts to confirm everything was working

## Steps Performed

### Set Up the Domain Controller (Windows Server 2019)
1. Create a new VM in **VirtualBox** and install **Windows Server 2019**.
2. Configure a **static IP**.
3. Rename server to `DC01` and reboot.
4. Install **AD DS** + **DNS Server** roles.
5. Promote the server to **domain controller**, create a new forest.

### Bulk Create Active Directory Users
- Run a PowerShell script to create 1,000 simulated users.
- Verifiy users in **Active Directory Users and Computers (ADUC)**.

The script begins by setting the default password for all new users and the total number of accounts to create. It then generates random first and last names, combines them into usernames, converts the password into a secure string, and uses New-ADUser to create each account in the Employees OU. Accounts are enabled and configured so the password does not expire, and the loop continues until all users are created.
> Script available in `scripts/01-bulk-user-script.ps1` --> <a href="https://github.com/DFuqua23/Active-Directory-Corp-Lab/blob/main/scripts/01-bulk-user-script.ps1">Bulk User Script</a>


### Set Up the Windows 10 Client
1. Create a Windows 10 VM.
2. Set **DNS server** to the domain controller’s IP.
3. Join VM to the domain.
4. Log in using several AD accounts to confirm functionality.


## What I Learned
This Active Directory project provided hands-on experience that showed me AD’s foundational role within enterprise environments.
I gained a deeper understanding of why Active Directory exists, seeing how it acts as the centralized system for identity, authentication, and policy enforcement across an organization. 

A key focus was understanding organizational structure through Organizational Units (OUs). By creating OUs to represent different departments and distributing 1,000 simulated users across them, I learned how AD enables the logical grouping of people and systems. This structure is essential because it makes it easier to manage permissions, apply targeted policies, and efficiently organize an enterprise size user population.

The project also provided practical experience enforcing security standards across the entire domain, demonstrating that AD is not just about managing user accounts. I learned how to use Group Policy Objects (GPOs) to enforce security settings.
By editing a GPO to enforce a lower account lockout threshold to allow only three failed attempts, it showcased how organizations implement protection against brute-force attacks.
This specific task also highlighted the crucial trade-off in IT security balancing robust security measures against potential impacts on user usability.

Instead of only reading about domain administration, I was able to execute the full workflow involved in managing account lockouts, similar to a real IT department. Purposely locking out a user and then unlocking that account directly from the domain controller gave me a real understanding of how lockouts happen, where administrative controls are managed, and what the support or security workflow looks like. Overall, this project solidified the understanding that Active Directory serves as the core identity and access management system for Windows environments, demonstrating how organizational structure, security controls, and user management are all interconnected within a single platform.


## AD Exploration/Screenshots

## 1. Creating Organizational Units (OUs)
I created groups in active directory to simulate company deparments and added the 1000 users across the groups according to the amounts specified below. This would help with better organization and allow me to add role based access controls and security policies.

(Sales: 300, Support: 250, Operations: 150, IT: 100, Finance: 100, HR: 50, Management: 50)

<img width="700" height="500" alt="Groups" src="https://github.com/user-attachments/assets/416cdb35-a138-48a0-a3b5-00552d317c67" />


## 2. Edit GPOs 
I changed the default account lockout policy from unlimited to three failed attempts. This policy helps protect user accounts and the overall network from unauthorized access. With unlimited attempts, an attacker can keep guessing passwords over and over until they eventually get in. By locking an account after three failed login attempts, you greatly reduce the chances of a successful brute-force attack and make it much harder for someone to compromise an account. This also encourages users to be more careful when entering their passwords and can help IT teams quickly spot suspicious activity in event logs when multiple lockouts occur. 
<img width="1000" height="600" alt="GPO Edits edit" src="https://github.com/user-attachments/assets/83e83aab-f3b1-40db-b17f-98f4c1d32a08" />



## 3. Password Resets
For lab purposes, the change to the lockout policy makes it easier for me to simulate a failed logon attmept and locked user accounts. Funny enough, I actually did forget what I changed the password to and ended up organicaly failing multiple logon attempts by accident. I realized that having a lower amount of failed logon could be a hinderance by creating an increase in locked accounts across an organization from not having enough available atttempts.   
<p align="center">
  <img width="500" alt="Reset Password 1" src="https://github.com/user-attachments/assets/e83cd280-78cc-425a-a47e-a113bce85700">
  <img width="500" alt="Reset Password 2" src="https://github.com/user-attachments/assets/7313db53-ee2b-43c3-847d-c45e1a2351c0">
</p>


## 4. Unlocking Locked Accounts
I purposely failed multiple login attempts to lockout/disable a client account on the client machine, then went into the active directory settings on the domain controller and unlocked the user account.
<img width="1000" height="700" alt="Lockout 1" src="https://github.com/user-attachments/assets/dd279367-5576-4a3c-ad12-387e591bbb51" />
<img width="1000" height="700" alt="Lockout 2" src="https://github.com/user-attachments/assets/53c435bc-9b78-43f1-83c6-913b0c579b8e" />






























































