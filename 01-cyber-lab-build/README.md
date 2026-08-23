# Personal Cyber Lab Build — Proxmox Workstation Platform

> A dual-GPU Proxmox workstation combining Linux productivity, Windows gaming, and isolated cybersecurity testing on one physical system.

**Portfolio project:** 01  
**Current phase:** V2 operational but in development
**Last updated:** 23 August 2026  
**Detailed technical repository:** [proxmox-workstation-platform](https://github.com/Beebop2727/proxmox-workstation-platform)

## Project overview

This project began as a personal cyber-lab build and developed into a broader virtualized workstation platform.

Proxmox VE runs directly on the physical desktop and hosts separate virtual machines for different workloads:

- **Ubuntu Workstation** — the primary desktop for development, university work, Linux administration, and general use.
- **Windows 11 Gaming** — an on-demand Windows environment with dedicated NVIDIA GPU passthrough.
- **Parrot OS Security Base** — a reusable cybersecurity environment for tools, labs, and controlled testing.
- **Parrot OS Disposable Clone** — a temporary working VM that can be reset or removed after an exercise.

The design keeps normal daily work, gaming, and cybersecurity tools separated while allowing the same hardware to support all three roles.

## Project objectives

The objective of this project is to design, build, document, and evaluate a practical cybersecurity homelab using existing consumer hardware.

The project is intended to demonstrate the ability to combine virtualization, networking, system administration, security controls, monitoring, and technical documentation into a usable lab environment rather than treating each technology as an isolated exercise.

Specific objectives are to:

- Build a stable Proxmox VE virtualization platform.
- Separate normal workstation, Windows, infrastructure, and cybersecurity workloads.
- Provide reusable and disposable security-testing environments.
- Introduce firewall-controlled network isolation for lab systems.
- Establish secure management paths using WireGuard and SSH.
- Implement basic infrastructure and service monitoring.
- Test backup and recovery rather than relying on unverified backups.
- Document design decisions, failures, troubleshooting, and improvements.
- Produce a platform that can support later cybersecurity portfolio projects.

## Project scope

### In scope

- Proxmox VE host configuration and administration
- Linux and Windows virtual machines
- PCIe and GPU passthrough
- OPNsense firewalling and lab-network isolation
- Routed and NAT-based virtual networking
- WireGuard management connectivity
- Linux infrastructure services
- Monitoring and service-health tooling
- VM backup, snapshots, and restoration testing
- Disposable cybersecurity environments
- Sanitized public technical documentation

### Out of scope

This project is not intended to:

- Provide enterprise-grade high availability
- Host production services
- Expose administrative interfaces directly to the public Internet
- Test against systems without explicit authorization
- Replicate a complete enterprise SOC or datacentre
- Introduce additional complexity purely for the sake of adding technologies

Later projects in this portfolio can build on the lab without requiring the core platform to solve every cybersecurity problem itself.

## Success criteria

The project will be considered successful when:

- Core virtual machines can be started and used reliably.
- Linux and Windows GPU passthrough operate consistently.
- Security-testing systems are logically separated from trusted workloads.
- Lab systems can reach required services without unrestricted access to trusted networks.
- Administrative access is available through controlled management paths.
- Critical virtual machines can be restored from backup.
- Basic infrastructure health can be monitored centrally.
- Configuration and architecture are documented well enough for the environment to be understood and rebuilt.
- The lab can support future security exercises without requiring major redesign.
## Current status

| Component | Status |
|---|---|
| Proxmox VE host | ✅ Operational |
| Ubuntu workstation VM | ✅ Operational |
| Windows 11 gaming VM | ✅ Operational |
| Parrot OS base VM | ✅ Operational |
| Parrot OS disposable VM | ✅ Operational |
| AMD Radeon Pro WX 3100 passthrough | ✅ Operational |
| NVIDIA GeForce RTX 4070 passthrough | ✅ Operational |
| Looking Glass B7 integration | ✅ Operational |
| Routed VM networking over Wi-Fi | ✅ Operational |
| WireGuard host management | ✅ Operational |
| Synergy keyboard and mouse sharing | ✅ Operational |
| VM backup and restoration testing | ✅ Complete |
| Bare-metal Windows extension | 🚧 In progress |
| Monitoring and further lab services | 🔜 Planned |

## Hardware platform

| Component | Specification |
|---|---|
| CPU | AMD Ryzen 9 3900X — 12 cores / 24 threads |
| Motherboard | MSI MPG X570 Gaming Pro Carbon WiFi |
| Memory | 32 GB DDR4 |
| Ubuntu GPU | AMD Radeon Pro WX 3100, 4 GB |
| Windows GPU | NVIDIA GeForce RTX 4070 |
| Wireless adapter | Intel Wi-Fi 6 AX200 |
| Hypervisor storage | 500 GB NVMe SSD |
| Primary VM storage | 4 TB NVMe SSD |
| Additional storage | 2 × 2 TB HDD |
| Main display | Huawei MateView GT 34-inch ultrawide |

The graphics cards had to be installed in the reverse of the originally planned layout because of physical clearance:

```text
Top PCIe slot:     AMD Radeon Pro WX 3100
Lower PCIe slot:   NVIDIA GeForce RTX 4070
```

## Virtual-machine layout

### Ubuntu Workstation — VM 101

The Ubuntu VM is the primary daily environment.

Current configuration:

- 4 virtual CPU cores
- 12 GB RAM
- 200 GB system disk
- AMD Radeon Pro WX 3100 passthrough
- OVMF / UEFI
- QEMU Guest Agent
- SPICE audio
- WireGuard management connectivity
- Looking Glass client
- Synergy integration

It is used for development, coursework, browsing, Linux administration, and management of the wider platform.

### Windows 11 Gaming — VM 100

The Windows VM provides an on-demand environment for Windows-only applications and games that operate correctly under virtualization.

Current configuration:

- 8 virtual CPU cores
- 8 GB RAM
- 300 GB system disk
- NVIDIA GeForce RTX 4070 passthrough
- OVMF / UEFI
- TPM 2.0
- Looking Glass B7
- KVMFR and IVSHMEM shared memory

Looking Glass allows the Windows desktop to be displayed with low latency inside the Ubuntu workstation, reducing the need to switch monitor inputs.

### Parrot OS Security Base — VM 102

The Parrot OS base VM provides a reusable environment for cybersecurity tooling and practical exercises.

Current configuration:

- 4 virtual CPU cores
- 8 GB RAM
- 80 GB system disk
- Reusable base image
- No dedicated GPU required

The base is kept relatively clean so it can be updated and reused without repeatedly rebuilding the environment.

### Parrot OS Disposable — VM 103

The disposable Parrot OS VM is derived from the base environment and is intended for temporary exercises.

Current configuration:

- 4 virtual CPU cores
- 8 GB RAM
- 80 GB virtual disk
- Disposable working environment
- Can be reset, replaced, or recreated after testing

This approach reduces configuration drift and keeps experimental tools and changes away from the primary Ubuntu workstation.

## Simplified architecture

```text
                         Household Wi-Fi
                                |
                         Proxmox VE host
                                |
       +----------------+-------+----------------+
       |                |                        |
 Ubuntu Workstation   Windows 11             Parrot OS
 AMD WX 3100          RTX 4070               Base VM
 Primary desktop      Gaming VM                 |
       |                |                  Disposable clone
       +-- Looking -----+
           Glass
```

The Proxmox host uses Wi-Fi as its upstream connection. Guest systems use a private routed network with NAT rather than being bridged directly onto the wireless network.

## Networking challenge

The initial Proxmox installation was completed without direct Ethernet access to the household router.

A temporary internet connection was created using:

```text
Household Wi-Fi
      |
Ubuntu ThinkPad
      |
ThinkPad dock Ethernet
      |
Proxmox host
```

Ubuntu NetworkManager shared the ThinkPad's Wi-Fi connection through the dock Ethernet interface. This allowed the Proxmox host to download updates and configure its Intel AX200 adapter.

The permanent design uses:

- Intel AX200 Wi-Fi for the host uplink
- A private virtual bridge for guests
- Routing and NAT between the VM network and Wi-Fi
- WireGuard for a separate host-management path

## Backup and recovery

The primary virtual machines were backed up before major storage changes.

The restoration process was then tested rather than assuming the backups were usable.

Restored workloads include:

- Windows 11 Gaming
- Ubuntu Workstation
- Parrot OS base
- Parrot OS disposable environment

The project also uses guest snapshots and a Timeshift snapshot for the Ubuntu environment before significant changes.

## Problems solved

### GPU clearance

The intended card arrangement did not physically fit inside the case.

**Solution:** Move the single-slot WX 3100 to the upper PCIe slot and the RTX 4070 to the lower slot, then adjust the motherboard PCIe configuration.

### Proxmox Wi-Fi setup

The installer detected the AX200 but did not provide a normal Wi-Fi authentication workflow.

**Solution:** Bootstrap networking through a ThinkPad dock, install the required tools, and use routed networking rather than attempting to bridge the Wi-Fi client interface directly.

### Dual-GPU passthrough

Each desktop VM needed reliable ownership of its assigned graphics card.

**Solution:** Enable SVM, IOMMU, and Above 4G Decoding; use OVMF guests; and pass each GPU and its related PCI functions to the appropriate VM.

### Integrated Windows display

Using a second physical input for Windows made the workflow inconvenient.

**Solution:** Configure Looking Glass B7 with KVMFR and IVSHMEM so the Windows VM can be accessed from Ubuntu with low latency.

### Safe experimental environments

Installing cybersecurity tools directly into the main workstation would increase clutter and configuration drift.

**Solution:** Maintain a reusable Parrot OS base VM and separate disposable clones for temporary exercises.

## Skills demonstrated

This project demonstrates practical experience with:

- Bare-metal virtualization
- Proxmox VE administration
- Linux systems administration
- UEFI virtual machines
- PCIe and GPU passthrough
- IOMMU configuration
- Virtual storage management
- VM templates and disposable environments
- Routed and NAT-based virtual networking
- Wi-Fi-constrained infrastructure design
- WireGuard
- Backup and restoration
- Looking Glass shared-memory display
- Hardware and software troubleshooting
- Technical documentation
- Project scoping and iterative development

## Current V1.5 work

- Refine keyboard and mouse capture behaviour
- Improve automatic VM startup and shutdown workflows
- Complete the optional bare-metal Windows installation
- Prepare an NTFS game-library partition safely
- Integrate the two 2 TB HDDs into the backup design
- Add sanitized configuration examples
- Add screenshots and performance measurements
- Update the architecture diagrams
- Document repeatable installation and recovery procedures

## Future development

Possible later additions include:

- Raspberry Pi Wake-on-LAN and remote-management node
- Monitoring and resource dashboards
- Managed switch and VLAN segmentation
- Additional isolated security exercises
- SIEM or log-analysis workloads
- Automated backup and health-check scripts

These features are intentionally deferred until the core workstation remains stable and useful.

## Repository relationship

This folder is the portfolio summary for the project.

The detailed implementation history, roadmap, dated progress reports, architecture notes, and future configuration examples are maintained in the dedicated repository:

**[Beebop2727/proxmox-workstation-platform](https://github.com/Beebop2727/proxmox-workstation-platform)**

Keeping the detailed documentation in one canonical repository avoids maintaining two independent technical copies of the same project.

## Schedule note

This project is part of a wider cybersecurity portfolio plan. The original month-by-month schedule may be adjusted as the build develops.

The project is currently considered **in progress**, even though the central V1 architecture is operational. Future portfolio updates will focus on measurable improvements, documented exercises, and evidence of the skills developed rather than rigidly following the original calendar.

## Publication safety

Public documentation must not contain:

- Passwords
- Private keys
- WireGuard private keys
- VPN credentials
- API tokens
- Session cookies
- Personal information
- Sensitive or unnecessary network details

All configuration files should be sanitized before publication.

---

**Project status:** 🚧 In progress  
**Last reviewed:** 3 August 2026
