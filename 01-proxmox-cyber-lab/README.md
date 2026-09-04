# 01 — Proxmox Personal Cyber Lab Build

> A completed dual-GPU Proxmox workstation and cybersecurity lab combining Linux productivity, Windows workloads, isolated security environments, firewalling, remote management, and monitoring on one physical system.

**Month:** August 2026  
**Status:** ✅ Complete  
**Final phase:** V2  
**Project concluded:** 4 September 2026  
**Detailed technical repository:** [proxmox-workstation-platform](https://github.com/Beebop2727/proxmox-workstation-platform)

---

## Project overview

This project began as a personal cyber-lab build and developed into a broader virtualised workstation and homelab platform.

**Proxmox VE** ran directly on the workstation hardware and hosted separate environments for Linux productivity, Windows workloads, cybersecurity testing, firewalling, and supporting infrastructure.

The project reached V2 and successfully proved that a single consumer workstation could support these roles using virtualisation and dedicated PCIe/GPU passthrough.

The architecture was later retired as the everyday workstation design, but the project itself is considered **complete** because its core technical objectives were achieved, tested, and documented.

---

## Objectives

The project aimed to:

- Build a stable Proxmox VE virtualisation platform
- Separate normal workstation, Windows, infrastructure, and cybersecurity workloads
- Provide reusable and disposable security-testing environments
- Implement GPU passthrough for Linux and Windows guests
- Introduce firewall-controlled lab isolation using OPNsense
- Establish secure management paths using WireGuard and SSH
- Implement infrastructure and service monitoring
- Validate VM backup and recovery
- Document technical decisions, failures, troubleshooting, and improvements
- Produce a platform capable of supporting later cybersecurity portfolio work

---

## Final documented environment

| Component | Final state |
|---|---|
| Proxmox VE host | ✅ Operational before retirement |
| Ubuntu workstation VM | ✅ Operational |
| Windows 11 gaming VM | ✅ Operational and play-tested |
| Parrot OS base VM | ✅ Operational |
| Parrot OS disposable VM | ✅ Operational |
| OPNsense firewall VM | ✅ Operational |
| Isolated cybersecurity lab network | ✅ Operational |
| AMD Radeon Pro WX 3100 passthrough | ✅ Operational |
| NVIDIA GeForce RTX 4070 passthrough | ✅ Operational |
| Looking Glass B7 | ✅ Operational |
| Routed/NAT VM networking | ✅ Operational |
| WireGuard management | ✅ Operational |
| VM backup and restoration validation | ✅ Complete |
| Grafana / Prometheus monitoring | ✅ Operational |
| Dockur Windows environment | 🧪 Proof of concept |
| WinApps / RemoteApp integration | ⚪ Unfinished at closure |
| Uptime Kuma | ⚪ Unfinished at closure |
| VLAN segmentation | ⚪ Not implemented |

Unfinished enhancements are retained in the technical repository as historical planned work; they are not requirements for this portfolio project to be considered complete.

---

## Simplified architecture

```text
                     Physical workstation
                            |
                       Proxmox VE
                            |
        +-------------------+-------------------+
        |                   |                   |
   Ubuntu VM            Windows VM          Parrot VMs
   WX 3100              RTX 4070          Base + disposable
        |                   |
        +---- Looking Glass-+
                            |
                         OPNsense
                            |
                    Isolated lab network
```

Supporting services were also moved to a separate Ubuntu Server system during the project, reducing dependence on the main workstation for monitoring and infrastructure services.

---

## Problems solved

### Wi-Fi-constrained Proxmox networking

The workstation did not initially have a conventional wired uplink available.

**Outcome:** networking was bootstrapped through another Linux system and evolved into routed/NAT-based guest networking rather than attempting to bridge a Wi-Fi client interface directly.

### Dual-GPU passthrough

Linux and Windows desktop guests required reliable ownership of separate physical GPUs.

**Outcome:** IOMMU/VFIO, OVMF, PCIe device isolation, and related passthrough configuration were implemented successfully for both AMD and NVIDIA hardware.

### Integrated Windows workflow

Using separate physical monitor inputs made switching between Linux and the Windows VM inconvenient.

**Outcome:** Looking Glass B7 with shared memory provided low-latency access to the GPU-passthrough Windows environment from Linux.

### Disposable security environments

Installing experimental security tooling directly into the daily workstation would create unnecessary configuration drift.

**Outcome:** a reusable Parrot OS base VM and disposable clone model provided isolated environments that could be reset or recreated after testing.

### Backup confidence

Backups are only useful if restoration works.

**Outcome:** major virtual machines were backed up and restoration was validated rather than treated as an assumed capability.

---

## Skills demonstrated

- Proxmox VE administration
- Bare-metal virtualisation
- Linux systems administration
- KVM/QEMU concepts
- VFIO and IOMMU
- PCIe and GPU passthrough
- OVMF / UEFI virtual machines
- Looking Glass
- Virtual storage management
- Disposable VM design
- OPNsense
- Routed and NAT-based networking
- WireGuard
- Firewall troubleshooting
- VM backup and recovery
- Grafana and Prometheus
- Infrastructure design
- Technical documentation
- Architectural decision-making

---

## Project outcome

The technical experiment was successful.

Proxmox proved capable of running the workstation and cyber lab, including GPU-accelerated Linux and Windows guests, security VMs, firewalling, remote management, monitoring, and recovery workflows.

The most important lesson was architectural rather than a technical failure: a system can work correctly without being the best design for its day-to-day purpose.

Because the physical machine is primarily a workstation, running the main Linux desktop as a guest introduced additional complexity for native Linux use, gaming, graphics, and hardware integration.

The successor project therefore keeps the useful technologies — KVM/QEMU, VFIO, GPU passthrough, isolation, and disposable VMs — while moving the primary Linux desktop back to bare metal.

---

## Lessons carried forward

- Virtualisation is most useful when it solves a clear isolation or compatibility problem
- GPU passthrough is valuable without requiring the entire workstation to be hypervisor-first
- Lab isolation should be intentional and documented
- Backup restoration should be tested
- Infrastructure decisions should be evaluated against the actual user workflow
- Failed or superseded design choices are still useful engineering evidence when the reasoning is documented

---

## Repository relationship

This folder acts as the portfolio summary and completion record.

The detailed implementation history, architecture, troubleshooting, progress logs, decisions, and closure documentation are maintained in:

**[Beebop2727/proxmox-workstation-platform](https://github.com/Beebop2727/proxmox-workstation-platform)**

---

## Publication safety

Public documentation must not contain passwords, private keys, VPN credentials, API tokens, session cookies, recovery codes, or unnecessary personally identifying information.

---

**Project status:** ✅ Complete  
**Completed:** August 2026  
**Architecture retired:** 4 September 2026
