#!/usr/bin/env bash
set -euo pipefail

if [[ ! -d .git ]]; then
  echo "Run this from the root of the cybersecurity-portfolio-year repository."
  exit 1
fi

repo_url="$(git remote get-url origin 2>/dev/null || true)"
echo "Repository: ${repo_url:-unknown}"

# Reorganise the 12-month sequence: August 2026 -> July 2027.
mv 01-cyber-lab-build 01-proxmox-cyber-lab
mv 02-owasp-top-10 03-owasp-top-10
mv 03-vulnerability-management 04-vulnerability-management
mv 04-healthcare-risk-register 05-healthcare-risk-register
mv 05-ransomware-ir-playbook 06-ransomware-ir-playbook
mv 06-siem-detections 07-siem-detections
mv 07-phishing-awareness 08-phishing-awareness
mv 08-cloud-security-baseline 09-cloud-security-baseline
mv 09-digital-forensics-case 10-digital-forensics-case
mv 10-secure-coding-review 11-secure-coding-review

mkdir -p future-projects
mv 11-cybersecurity-policy-pack future-projects/cybersecurity-policy-pack
mkdir -p 02-ryoku-cybersecurity-workstation

# Renumber the retained project briefs.
sed -i '1s/^# 02 —/# 03 —/' 03-owasp-top-10/README.md
sed -i '1s/^# 03 —/# 04 —/' 04-vulnerability-management/README.md
sed -i '1s/^# 04 —/# 05 —/' 05-healthcare-risk-register/README.md
sed -i '1s/^# 05 —/# 06 —/' 06-ransomware-ir-playbook/README.md
sed -i '1s/^# 06 —/# 07 —/' 07-siem-detections/README.md
sed -i '1s/^# 07 —/# 08 —/' 08-phishing-awareness/README.md
sed -i '1s/^# 08 —/# 09 —/' 09-cloud-security-baseline/README.md
sed -i '1s/^# 09 —/# 10 —/' 10-digital-forensics-case/README.md
sed -i '1s/^# 10 —/# 11 —/' 11-secure-coding-review/README.md

# Keep the policy-pack idea, but take it out of the fixed 12-project schedule.
sed -i '1c# Future Project — Cybersecurity Policy Pack' future-projects/cybersecurity-policy-pack/README.md

# The ransomware playbook is now project 06.
sed -i 's/project 05/project 06/g' 12-cyber-resilience-capstone/README.md

cat > README.md <<'EOF'
# Cybersecurity Portfolio Year

A 12-month cybersecurity project portfolio running from **August 2026 to July 2027**, documenting practical work across infrastructure, offensive security, security operations, governance, incident response, cloud security, digital forensics, and secure development.

Each month focuses on a defined project with documented objectives, evidence, outputs, and lessons learned. The aim is to build a public body of work that demonstrates both technical ability and the reasoning behind design and security decisions.

> **Current project:** September — Ryoku Cybersecurity Workstation & Lab Build  
> **Completed project:** August — Proxmox Personal Cyber Lab Build

---

## Portfolio at a glance

| # | Month | Project | Status | Skills |
|---|---|---|---|---|
| 01 | August | [Proxmox Personal Cyber Lab Build](01-proxmox-cyber-lab/) | ✅ Complete | Proxmox, virtualisation, networking, VFIO, OPNsense, documentation |
| 02 | September | [Ryoku Cybersecurity Workstation & Lab Build](02-ryoku-cybersecurity-workstation/) | 🚧 In progress | Linux, KVM/QEMU, libvirt, VFIO, GPU passthrough, lab design |
| 03 | October | [OWASP Top 10 mini-series](03-owasp-top-10/) | 🔜 Upcoming | Web application security, ethical hacking, remediation |
| 04 | November | [Vulnerability management dashboard](04-vulnerability-management/) | 🔜 Upcoming | Vulnerability scanning, risk rating, reporting |
| 05 | December | [Healthcare cyber risk register](05-healthcare-risk-register/) | 🔜 Upcoming | Governance, risk management, public-sector context |
| 06 | January | [Ransomware IR playbook](06-ransomware-ir-playbook/) | 🔜 Upcoming | Incident response, crisis management, process design |
| 07 | February | [SIEM detection project](07-siem-detections/) | 🔜 Upcoming | SOC workflows, log analysis, detection engineering |
| 08 | March | [Phishing awareness campaign](08-phishing-awareness/) | 🔜 Upcoming | Human factors, security awareness, communication |
| 09 | April | [Cloud security baseline](09-cloud-security-baseline/) | 🔜 Upcoming | Cloud security, IAM, secure configuration |
| 10 | May | [Digital forensics mini-case](10-digital-forensics-case/) | 🔜 Upcoming | Evidence handling, timeline analysis, investigation |
| 11 | June | [Secure coding review](11-secure-coding-review/) | 🔜 Upcoming | Application security, code review, remediation |
| 12 | July | [Cyber resilience capstone](12-cyber-resilience-capstone/) | 🔜 Upcoming | Full-spectrum cyber, technical analysis, reporting |

---

## Infrastructure progression

The first two projects deliberately document two different approaches to building a personal cybersecurity workstation and lab.

### August — Proxmox-first architecture

The first build used **Proxmox VE as the bare-metal hypervisor** and placed the main Linux workstation, Windows environment, security VMs, firewalling, and supporting services around that virtualisation layer.

The project reached **V2** and successfully demonstrated:

- Linux and Windows workstation VMs
- Dual-GPU PCIe passthrough
- VFIO and IOMMU configuration
- Looking Glass
- OPNsense firewalling and isolated lab networking
- WireGuard management
- Disposable Parrot OS security environments
- VM backup and restore validation
- Grafana and Prometheus monitoring

The project is complete and preserved in the dedicated [proxmox-workstation-platform](https://github.com/Beebop2727/proxmox-workstation-platform) repository.

### September — Linux-first architecture

The second build takes the lessons from the Proxmox experiment and reverses the workstation model:

```text
Previous
Hardware → Proxmox VE → Linux / Windows / Security VMs

Current
Hardware → Ryoku Linux → KVM/QEMU/libvirt → VMs where useful
```

Ryoku Linux becomes the native workstation operating system while virtualisation remains available for Windows, cybersecurity, disposable, and GPU-passthrough workloads.

This allows the portfolio to show not only how an architecture was built, but how it was evaluated and redesigned after practical use.

---

## Lab and ethics

All practical security work is conducted in personal lab environments, intentionally vulnerable training applications, or other systems where testing is explicitly authorised.

No real organisation, system, account, or person is targeted without permission.

Infrastructure may change during the portfolio year. Project documentation records the environment actually used at the time rather than assuming one permanent lab platform for all twelve projects.

---

## Project structure

Each project folder is intended to contain the material relevant to that project rather than forcing every project into an identical format.

Typical contents may include:

```text
XX-project-name/
├── README.md          — project overview, objectives, status, and outcomes
├── report/            — professional written output
├── diagrams/          — architecture diagrams, network maps, or flowcharts
├── screenshots/       — lab evidence and tool output
└── scripts/           — automation or tooling created for the project
```

Not every project will require every directory.

---

## Target positioning

This portfolio is primarily aimed at demonstrating skills relevant to:

- Cybersecurity operations and SOC roles
- Incident response and detection engineering
- Infrastructure and systems security
- Linux and virtualisation
- Networking and security architecture
- Digital forensics
- Governance, risk, and compliance
- Public-sector and government-adjacent cybersecurity roles

---

## Project completion standard

A project is considered complete when its intended objectives have been met and the repository contains enough evidence to explain what was done, what was learned, and what the outcome was.

Projects will aim to include:

- [ ] A clear README explaining the project and why it matters
- [ ] Practical evidence, diagrams, screenshots, code, or configuration where appropriate
- [ ] A professional output such as a report, playbook, checklist, case study, or technical record
- [ ] A reflection on lessons learned and limitations
- [ ] Sanitised public documentation with sensitive information removed
- [ ] A LinkedIn post or portfolio summary where useful

Completion does **not** require every possible enhancement or future idea to be implemented. A project can be successfully concluded once its defined objectives have been achieved and evaluated.

---

## Future project ideas

Ideas that no longer fit the fixed August–July sequence are retained separately rather than deleted.

- [Cybersecurity policy pack](future-projects/cybersecurity-policy-pack/) — governance and policy-writing project retained for possible future work

---

## Publication safety

Public material in this repository must not expose:

- Passwords
- Private keys
- WireGuard private keys
- VPN credentials
- API tokens
- Session cookies
- Recovery codes
- Personally identifying information
- Sensitive public addressing or unnecessary network details

Private RFC1918 lab addressing may be shown where it is useful for explaining architecture and has no security impact outside the lab.

---

*All work in this repository is conducted ethically and legally within personal lab environments, intentionally vulnerable training platforms, or other explicitly authorised systems.*
EOF

cat > 01-proxmox-cyber-lab/README.md <<'EOF'
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
EOF

cat > 02-ryoku-cybersecurity-workstation/README.md <<'EOF'
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
EOF

git add -A

echo
echo "Changes prepared:"
git status --short

echo
echo "Diff summary:"
git diff --cached --stat

git commit -m "restructure portfolio for August-July project year"

echo
echo "Commit created successfully."
echo "Review with: git show --stat"
echo "Then push with: git push"
