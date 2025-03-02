# ⚡ SOC PowerShell Tools by MorphicWorm

## 🛡️ About This Project
Welcome to the **SOC PowerShell Tools** repository! This project is a collection of PowerShell scripts tailored for Security Operations Center (SOC) tasks, designed to enhance threat detection, incident response, and log analysis.

## 🚀 Tools Included

### 1. 📨 **Phishing Analysis Tool**
   - Parses email headers to extract key Indicators of Compromise (IOCs).
   - Identifies suspicious IPs, domains, and SPF/DKIM/DMARC results.

### 2. 📊 **Event Log Monitor**
   - Monitors Windows Event Logs for security events.
   - Filters critical log entries for faster incident triage.

### 3. 📑 **Log Analysis Tool**
   - Analyzes system and application logs for anomalies.
   - Highlights potential signs of compromise.

### 4. 🚨 **Incident Response (IR) Collector**
   - Gathers key forensic data during an active incident.
   - Collects running processes, network connections, and more.

### 5. 📈 **Automated Report Generator**
   - Generates incident reports from log data.
   - Customizable templates for fast documentation.

## 🏁 Getting Started

### Prerequisites
Ensure you have:
- **Windows PowerShell 5.1** or **PowerShell 7+**
- Administrative privileges for certain scripts (IR Collector, Event Log Monitor)

### Installation
1. Clone this repository:
   ```powershell
   git clone https://github.com/MorphicWorm/SOC-PowerShell-Tools.git
   ```
2. Navigate to the project folder:
   ```powershell
   cd SOC-PowerShell-Tools
   ```

## 📚 Usage
Each tool has its own directory with a detailed `README.md`. To run a script:
```powershell
.\Phishing-Analysis-Tool\PhishingAnalysisTool.ps1 -FilePath "sample-email-headers.txt"
```

## 🎯 Roadmap
Planned enhancements:
- [ ] Integrate VirusTotal API for IOC lookups
- [ ] Add log file parsing for Linux systems
- [ ] Build a GUI for the IR Collector

## 🐛 Contributing
Contributions are welcome! Feel free to fork the repo and submit pull requests with improvements or new SOC scripts.

## 🏆 Acknowledgments
Special thanks to the cybersecurity community for continuous learning and inspiration.

## 📧 Contact
- **GitHub:** [MorphicWorm](https://github.com/MorphicWorm)

---

_Powered by curiosity, fueled by cybersecurity._ 🪲

