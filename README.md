# Active Directory Home Lab – Windows Server 2019 + Windows 10

This project is a small Active Directory lab I built at home to practice the kind of tasks you’d see in a typical help desk role. It uses Windows Server 2019 as a domain controller and a Windows 10 client joined to the domain.
The idea was to recreate a basic corporate setup where users log into a domain, accounts are managed centrally, and I can break and fix things on purpose to practice basic troubleshooting, active directory fundamentals and use the environment for future labs.

**How to Navigate This Repo**

This repo is meant to serve as a landing page with a quick overview for this project.

1) README (This Page): Summary of the lab

2) scripts folder:
-<a href="https://github.com/DFuqua23/Active-Directory-Corp-Lab/blob/main/02-Active%20Directory%20Exploration.md">scripts/01-bulk-user-script.ps1</a>
-<a href="https://github.com/DFuqua23/Active-Directory-Corp-Lab/blob/main/scripts/02-script-breakdown.md">02-script-breakdown.md</a
   -
3) Active Directory deep dive file:--> <a href="https://github.com/DFuqua23/Active-Directory-Corp-Lab/blob/main/scripts/01-bulk-user-script.ps1">02-Active Directory Exploration.md</a>
-This is where I documented some more active directory activities that were not part of the original lab set up.

Skimming this page will give you the big picture. If you want to see more technical depth, the scripts and exploration file show how I actually worked through things.

![Windows Server](https://img.shields.io/badge/OS-Windows%20Server-blue)
![Windows 10](https://img.shields.io/badge/OS-Windows%2010-brightgreen)
![VirtualBox](https://img.shields.io/badge/Hypervisor-VirtualBox-orange)
![PowerShell](https://img.shields.io/badge/Automation-PowerShell-blueviolet)
![Active Directory](https://img.shields.io/badge/Technology-Active%20Directory-blue)


## Lab Overview

| Component        | Details |
|-----------------|---------|
| Hypervisor       | Oracle VirtualBox | 
| Server OS        | Windows Server 2019 (Domain Controller) | 
| Client OS        | Windows 10 |
| Directory Service| Active Directory Domain Services (AD DS) |
| Automation       | PowerShell script to bulk-create 1,000 users |

**Objective:**  
Simulate a corporate environment where a server manages AD user accounts and a Windows 10 client allows logins from any of the 1,000 users.

---

## Lab Architecture

**What I Built:**

In VirtualBox, I set up two virtual machines:

DC01 – Windows Server 2019

Promoted to a domain controller

Installed Active Directory Domain Services (AD DS) and DNS

Used a PowerShell script to create about 1,000 user accounts in a dedicated OU

CLIENT01 – Windows 10

Pointed its DNS to the domain controller

Joined it to the domain (e.g., example.local)

Signed in with multiple domain user accounts to confirm everything was working

This gives me a small “company” environment to practice user management, logons, and troubleshooting.

---

## Steps Performed

### Set Up the Domain Controller (Windows Server 2019)
1. Created a new VM in **VirtualBox** and installed **Windows Server 2019**.
2. Configured a **static IP**.
3. Renamed server to `DC01` and rebooted.
4. Installed **AD DS** + **DNS Server** roles.
5. Promoted the server to **domain controller**, creating a new forest (e.g., `example.local`).

### Bulk Create Active Directory Users
- Ran a PowerShell script to create ~1,000 users.
- Users created in a dedicated **Organizational Unit (OU)**.
- Verified users in **Active Directory Users and Computers (ADUC)**.
> Script available in `scripts/01-bulk-user-script.ps1` --> <a href="https://github.com/DFuqua23/Active-Directory-Corp-Lab/blob/main/02-Active%20Directory%20Exploration.md">Bulk User Script</a>


### Set Up the Windows 10 Client
1. Created a Windows 10 VM.
2. Set **DNS server** to the domain controller’s IP.
3. Joined VM to the domain `example.local`.
4. Logged in using several AD accounts to confirm functionality.

---

## Skills Demonstrated
- Active Directory setup & configuration
- Domain controller promotion & DNS management
- PowerShell automation for user creation
- Windows 10 domain joins
- Troubleshooting login & connectivity issues

---

## AD Exploration 

<a href="https://github.com/DFuqua23/Active-Directory-Corp-Lab/blob/main/scripts/01-bulk-user-script.ps1">AD Exploration Page</a>
- Create Organizational Units (OUs)  
- Edit Group Policy (GPOs) 
- Simulate common **help desk tasks**
  - Password reset, unlocking disabled accounts







































