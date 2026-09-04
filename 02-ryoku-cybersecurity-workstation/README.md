# 02 — Ryoku Cybersecurity Workstation & Lab Build

> Rebuilding the workstation and cybersecurity lab around bare-metal Ryoku Linux, with virtualisation used as a tool rather than as the foundation of the desktop.

**Month:** September 2026  
**Status:** 🚧 In progress  
**Platform:** Ryoku Linux / Hyprland  
**Virtualisation direction:** KVM/QEMU, libvirt, VFIO, GPU passthrough

---

## Project overview

This project is the successor to the completed Proxmox Personal Cyber Lab Build.

The previous architecture placed **Proxmox VE directly on the hardware** and ran the primary Linux desktop inside a virtual machine. That design worked technically and reached V2, but practical use showed that a hypervisor-first architecture added unnecessary complexity to an everyday Linux workstation.

The Ryoku build reverses that model:

```text
Previous
Hardware
   |
Proxmox VE
   |
Linux / Windows / Security VMs

Current
Hardware
   |
Ryoku Linux
   |
KVM / QEMU / libvirt
   |
Windows / Security / Disposable VMs where useful
```

The goal is to retain the security and isolation benefits of virtualisation while giving the primary Linux desktop direct access to the workstation hardware.

---

## Objectives

- Run Ryoku Linux as the native workstation operating system
- Establish a stable KVM/QEMU and libvirt virtualisation stack
- Retain VFIO and PCIe passthrough capability
- Provide Windows virtualisation where useful
- Rebuild reusable and disposable cybersecurity VMs
- Maintain isolated lab environments for security testing
- Keep GPU passthrough available for workloads that benefit from it
- Document networking and VM-management decisions
- Evaluate the differences between hypervisor-first and workstation-first architectures
- Produce a practical platform for the remaining cybersecurity portfolio projects

---

## Design principles

### Workstation first

Normal Linux desktop use, development, administration, and compatible gaming should run natively rather than inside a workstation VM.

### Virtualise with a reason

VMs will be used where they provide clear value, including:

- Windows compatibility
- Cybersecurity tooling
- Disposable testing environments
- Isolation of risky or experimental workloads
- Guest GPU acceleration
- Network and infrastructure experiments

### Preserve isolation

Security-lab workloads should remain separated from trusted daily-use workloads even though the underlying host architecture has changed.

### Document trade-offs

The project is not intended to prove that Ryoku is universally better than Proxmox. It is intended to document why a Linux-first architecture better matches this workstation's actual use case.

---

## Planned architecture

```text
                        Physical workstation
                               |
                          Ryoku Linux
                               |
          +--------------------+--------------------+
          |                    |                    |
     Native desktop       KVM/QEMU/libvirt      Native tools
     and Linux apps              |               and gaming
                                 |
                  +--------------+--------------+
                  |              |              |
              Windows VM    Security VMs    Disposable VMs
                                 |
                           Isolated lab
```

Where practical, a secondary GPU can be reserved for VFIO/passthrough while the primary Linux host retains direct access to its own graphics hardware.

---

## Current work

- [x] Install Ryoku Linux as the bare-metal workstation OS
- [x] Establish the Hyprland-based daily desktop
- [ ] Configure KVM/QEMU and libvirt
- [ ] Define the VM-management workflow
- [ ] Build the first cybersecurity VM
- [ ] Create a disposable VM workflow
- [ ] Re-establish isolated lab networking
- [ ] Test VFIO / PCIe passthrough
- [ ] Test guest GPU acceleration where useful
- [ ] Define Windows VM requirements
- [ ] Document backup and recovery approach
- [ ] Add architecture diagrams and screenshots
- [ ] Compare the new workflow against the completed Proxmox design

This checklist will evolve as the build progresses; items will only be marked complete when they have been tested.

---

## Success criteria

The project will be considered successful when:

- Ryoku is stable as the normal daily workstation
- KVM/QEMU/libvirt VMs can be created and managed reliably
- Security testing can be performed inside isolated guests
- Disposable guest workflows are practical
- At least one useful VFIO/GPU-passthrough workflow is validated, where hardware permits
- Windows virtualisation is available if required
- Networking prevents lab workloads from having unnecessary access to trusted systems
- Backup/recovery expectations are documented and tested appropriately
- The resulting platform can support later portfolio projects without major redesign

---

## Skills demonstrated

- Linux workstation administration
- Hyprland / Wayland desktop configuration
- KVM/QEMU
- libvirt
- Virtual machine lifecycle management
- VFIO and IOMMU
- PCIe/GPU passthrough
- Virtual networking
- Security-lab isolation
- Disposable VM design
- Architecture evaluation
- Migration planning
- Technical documentation

---

## Relationship to the Proxmox project

This project is not a continuation of Proxmox itself.

It is a new architecture built from the lessons of the completed [Proxmox Personal Cyber Lab Build](../01-proxmox-cyber-lab/) and its dedicated [technical repository](https://github.com/Beebop2727/proxmox-workstation-platform).

The comparison between the two architectures is itself part of the learning outcome:

- **Proxmox project:** hypervisor first, desktop virtualised
- **Ryoku project:** desktop first, virtualisation layered underneath

Useful technologies such as KVM/QEMU, VFIO, GPU passthrough, isolated VMs, and virtual networking carry forward without requiring Proxmox VE.

---

## Publication safety

Configuration examples and screenshots must be sanitised before publication.

Do not publish passwords, private keys, VPN credentials, API tokens, session cookies, recovery codes, or unnecessary personally identifying information.

---

**Project status:** 🚧 In progress  
**Started:** September 2026
