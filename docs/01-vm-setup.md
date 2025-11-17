\# 01 — VM \& Network Setup



This document explains the basic VM and network setup used in this lab.



\## Recommended environment

\- Host OS: Windows/macOS/Linux

\- Hypervisor: VirtualBox, VMware Workstation, or Hyper-V

\- VMs:

&nbsp; - \*\*DC\*\*: Windows Server 2019/2022, 2 CPU, 4+ GB RAM, 60 GB disk

&nbsp; - \*\*Client\*\*: Windows 10/11, 2 CPU, 4 GB RAM, 40 GB disk



\## Network \& IP suggestions

\- Use a host-only or internal network so the lab is isolated.

\- Example static IPs:

&nbsp; - DC (Domain Controller): `192.168.56.10`

&nbsp; - Client (Windows 10): `192.168.56.20`

\- Set the client's DNS to the DC IP so the client can discover the domain.



\## Steps (high-level)

1\. Create two VMs in your hypervisor, install OS images, and install VMware/Guest Additions if desired.

2\. Configure networking to host-only/internal.

3\. On DC VM, set a static IP and preferred DNS to itself (127.0.0.1 or the static IP).

4\. On client VM, set DNS to the DC IP.

5\. Make sure both VMs can ping each other.



\## Tips

\- Snapshots are your friend: snapshot the DC before promoting to AD in case you need to revert.

\- Keep VM resources tuned so host performance remains good.



