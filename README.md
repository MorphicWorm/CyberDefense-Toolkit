# ⚔️ CyberDefense-Toolkit by MorhicWorm

> 🚧 **This repository is currently in development.**  
> Only the **Phishing Analysis Tool** is in progress at this stage. All other tools are planned for future development.

---

## 🛡️ About This Project
Welcome to the **CyberDefense-Toolkit**, a hands-on PowerShell project focused on building practical, modular tools for defensive cybersecurity tasks.  
Each script in this toolkit serves a real-world function — from parsing phishing emails to collecting forensic artifacts during live incidents.

Whether you're working in a Security Operations Center (SOC), studying blue team concepts, or building your lab environment, this toolkit was built with you in mind.

---

## 🚀 Tools Included

| Tool | Status | Description |
|------|--------|-------------|
| 📨 **Phishing Analysis Tool** | ⚙️ In Progress | Parses email headers and extracts IOCs such as IP addresses, domains, SPF/DKIM/DMARC results. Includes optional logging, attachment quarantine, and hash generation. |
| 📊 **Event Log Monitor** | 🔜 Planned | Monitors and filters Windows security logs for high-value event IDs. |
| 📑 **Log Analysis Tool** | 🔜 Planned | Analyzes system/application logs for anomalies and suspicious patterns. |
| 🚨 **Incident Response Collector** | 🔜 Planned | Collects volatile data like running processes, active network connections, autoruns, and more. |
| 📈 **Automated Report Generator** | 🔜 Planned | Generates incident reports based on log or forensic data, with template support for fast documentation. |

---

## 📦 Getting Started

### ✅ Requirements
- PowerShell 5.1 (Windows) or PowerShell 7+
- Administrator privileges for select tools (e.g., IR Collector, Event Log Monitor)

### 🛠️ Installation
```bash
git clone https://github.com/MorphicWorm/CyberDefense-Toolkit.git
cd CyberDefense-Toolkit
```

---

## 🚀 Quick Start

Each tool is in its own folder with:
- A `README.md` containing usage instructions and examples
- PowerShell scripts ready to run in your lab or SOC

Example:
```powershell
.\Phishing-Analysis-Tool\PhishingAnalysisTool.ps1 -FilePath "sample-headers.txt"
```

---

## 📅 Roadmap

- [x] Phishing Analysis Tool (email header parser)
- [ ] Event Log Monitor for key Event IDs
- [ ] IR Collector (forensic triage script)
- [ ] Log Analyzer for anomaly detection
- [ ] Report Generator (docx/csv support)
- [ ] VirusTotal API integration
- [ ] Linux log parsing support
- [ ] GUI wrapper for key tools (PowerShell-based)

---
