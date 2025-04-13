# ⚔️ CyberDefense-Toolkit by MorhicWorm

A modular PowerShell toolkit for defenders, analysts, and incident responders.  
Empowering blue teams with real-world, script-based tools for threat detection, log analysis, and rapid incident response.

---

## 🧭 Overview

The **CyberDefense-Toolkit** is a hands-on PowerShell project focused on building practical, modular tools for defensive cybersecurity tasks.  
Each script in this toolkit serves a real-world function — from parsing phishing emails to collecting forensic artifacts during live incidents.

Whether you're working in a Security Operations Center (SOC), studying blue team concepts, or building your lab environment, this toolkit was built with you in mind.

---

## 🔧 Tools Included

| Tool | Description |
|------|-------------|
| 📨 **Phishing Analysis Tool** | Parses email headers and extracts IOCs such as IP addresses, domains, SPF/DKIM/DMARC failures. |
| 📊 **Event Log Monitor** | Monitors and filters Windows security logs for high-value event IDs. |
| 📑 **Log Analysis Tool** | Analyzes system/application logs for anomalies and suspicious patterns. |
| 🚨 **Incident Response (IR) Collector** | Collects volatile data like running processes, active network connections, autoruns, and more. |
| 📈 **Automated Report Generator** | Generates incident reports based on log or forensic data, with template support for fast documentation. |

Each tool is interactive, readable, and designed for lab or production use.

---

## 📦 Getting Started

### ✅ Requirements
- PowerShell 5.1 (Windows) or PowerShell 7+
- Administrator privileges for select tools (e.g., IR Collector, Event Log Monitor)

### 🛠️ Installation
```bash
git clone https://github.com/MorphicWorm/CyberDefense-Toolkit.git
cd CyberDefense-Toolkit
