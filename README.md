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
