# 🖥️ Active Directory Home Lab – Windows Server 2019 + Windows 10

This lab simulates a small company environment using **Active Directory Domain Services (AD DS)** on **Windows Server 2019** with a **Windows 10** client joined to the domain.  

**Goal:** Gain hands-on experience with:

- Installing and configuring a **domain controller**
- Managing **user accounts** in Active Directory
- Joining a **Windows 10** machine to a domain
- Testing domain logons for multiple users

![Windows Server](https://img.shields.io/badge/OS-Windows%20Server-blue)
![Windows 10](https://img.shields.io/badge/OS-Windows%2010-brightgreen)
![VirtualBox](https://img.shields.io/badge/Hypervisor-VirtualBox-orange)
![PowerShell](https://img.shields.io/badge/Automation-PowerShell-blueviolet)
![Active Directory](https://img.shields.io/badge/Technology-Active%20Directory-blue)

---

## 🏗️ Lab Overview

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

## 🖥️ Lab Architecture

**VirtualBox Host:**

1. **VM 1 – DC01 (Windows Server 2019)**
   - Promoted to a **domain controller**
   - Active Directory Domain Services (AD DS) + DNS installed
   - PowerShell script creates 1,000 AD users  

2. **VM 2 – CLIENT01 (Windows 10)**
   - Configured DNS to point to the domain controller
   - Joined to the domain
   - Verified logins for multiple domain users

---

## ⚙️ Steps Performed

### 1️⃣ Set Up the Domain Controller (Windows Server 2019)
1. Created a new VM in **VirtualBox** and installed **Windows Server 2019**.
2. Configured a **static IP**.
3. Renamed server to `DC01` and rebooted.
4. Installed **AD DS** + **DNS Server** roles.
5. Promoted the server to **domain controller**, creating a new forest (e.g., `example.local`).

### 2️⃣ Bulk Create Active Directory Users
- Ran a PowerShell script to create ~1,000 users.
- Users created in a dedicated **Organizational Unit (OU)**.
- Verified users in **Active Directory Users and Computers (ADUC)**.
> Script available in `(https://github.com/DFuqua23/Active-Directory-Corp-Lab/blob/main/scripts/bulk-user-creation.ps1)`

### 3️⃣ Set Up the Windows 10 Client
1. Created a Windows 10 VM.
2. Set **DNS server** to the domain controller’s IP.
3. Joined VM to the domain `example.local`.
4. Logged in using several AD accounts to confirm functionality.

---

## 🛠️ Skills Demonstrated
- Active Directory setup & configuration
- Domain controller promotion & DNS management
- PowerShell automation for user creation
- Windows 10 domain joins
- Troubleshooting login & connectivity issues

---

## 🖼️ Screenshots
1. **Active Directory Users & Computers** showing bulk-created users  
2. **PowerShell script output** after creating 1,000 users  
3. **Windows 10 system properties** showing domain join  
4. **Logon screen** using a domain user account  

*(Place screenshots in `/images` folder and reference them here)*

---

## 🚀 Quickstart
1. Install Oracle VirtualBox
2. Create Windows Server 2019 VM → Install AD DS + DNS → Promote to DC
3. Run PowerShell script to create users
4. Create Windows 10 VM → Point DNS to DC → Join domain
5. Log in with a domain user

---

## 🌱 Future Enhancements
- Add **GPOs** (password policies, desktop restrictions)  
- Configure **file shares** with security group permissions  
- Simulate common **help desk tasks** (password reset, unlock accounts)  
- Collect and analyze **Windows Event Logs**








