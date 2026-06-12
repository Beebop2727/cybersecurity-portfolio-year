# 01 — Personal cyber lab build

## Overview

The foundation of the entire portfolio. Before any practical security work can be done safely and legally, a controlled lab environment is needed. This project documents the design, build, and iteration of a personal cybersecurity lab using a Proxmox-based virtualised workstation platform.

Rather than a one-off setup, this project evolves across multiple versions — from an initial proof of concept to a refined, well-documented lab environment by the time the rest of the portfolio begins.

> Full technical documentation lives in the dedicated repo: [proxmox-workstation-platform](https://github.com/Beebop2727/proxmox-workstation-platform)

---

## Objectives

- Design and build an isolated lab environment for safe security testing
- Document architecture decisions, hardware choices, and lessons learned
- Establish a stable foundation for all future portfolio projects
- Demonstrate infrastructure thinking, Linux administration, and virtualisation skills

---

## Lab architecture

The lab is built on a Proxmox VE hypervisor running on a physical desktop. Key components:

- **Ubuntu workstation VM** — primary daily-driver environment
- **Windows gaming VM** — isolated Windows environment with GPU passthrough
- **Future VMs** — intentionally vulnerable targets (Metasploitable, DVWA, Juice Shop) added as needed

All VMs are isolated by default. Internet access is controlled per VM depending on the task.

---

## Versions

| Version | Description | Status |
|---------|-------------|--------|
| v1 | Proxmox installed, Ubuntu VM, Windows gaming VM, GPU passthrough | 🔜 In progress |
| v2 | Raspberry Pi control plane, Tailscale, Wake-on-LAN | 🔜 Planned |
| v3 | Dashboard, monitoring, automation scripts | 🔜 Planned |
| v4 | Polished documentation, final architecture diagrams, GitHub write-up | 🔜 Planned |

---

## Skills demonstrated

- Virtualisation (Proxmox VE, VM orchestration)
- Linux administration
- GPU passthrough and hardware configuration
- Network architecture and isolation
- Technical documentation
- Infrastructure design

---

## Outputs

- [ ] Architecture diagram
- [ ] Hardware inventory and decisions
- [ ] Version history and changelog
- [ ] Lessons learned write-up
- [ ] LinkedIn post

---

## Lessons learned

*To be completed during the build.*
