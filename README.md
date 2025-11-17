# Active Directory – Corporate Lab (corp.local)

A compact, well-documented Active Directory lab that simulates a small corporate identity environment.

This repo is organized as a **human-friendly landing page** with deeper, focused docs in `/docs`. Use this as a portfolio piece to demonstrate Windows AD fundamentals, automation with PowerShell, and practical troubleshooting.

---

## Quick links

- 📘 [VM & Network Setup (detailed)](docs/01-vm-setup.md)  
- 🛠 [Active Directory Setup & Promotion](docs/02-active-directory-setup.md)  
- ⚙️ [Bulk User Creation Script (PowerShell)](docs/03-powershell-users.md)  
- 💻 [Client Join Guide (Windows 10)](docs/04-client-join.md)  
- 🐞 [Troubleshooting Notes](docs/05-troubleshooting.md)

---

## Project snapshot

**What I built**
- A functional Domain Controller (`corp.local`) on Windows Server.
- A Windows 10 client joined to the domain.
- A PowerShell script that bulk-created 1,000+ users under an `Employees` OU.

**Why this matters**
- Demonstrates the core identity infrastructure used in enterprise Windows environments.
- Provides a foundation for both red-team and blue-team exercises (Kerberos, GPO, logging).
- Shows automation and repeatable deployment using PowerShell.

---

## How to use this repo

1. Read the overview here.
2. Follow each doc in `/docs` for step-by-step instructions.
3. Inspect `scripts/bulk-user-creation.ps1` for the user provisioning script.
4. Replace placeholder values (domain name, admin user, IP addresses) with your lab specifics.

---

## What I learned (high level)

- Domain controllers and AD DS are the backbone of Windows identity.
- DNS is fundamental to AD — domain join depends on correct DNS.
- PowerShell automation is how enterprises scale user creation and configuration.
- How to join clients to a domain and validate Kerberos authentication.

---

## Files and structure

