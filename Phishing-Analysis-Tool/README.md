# 🧪 Interactive Phishing Analysis Tool (PowerShell)

> 🚧 **Status: In Progress**  
> This tool is currently in active development. Features like real attachment extraction, VirusTotal integration, and IOC lookups will be added in future updates.


A lightweight, interactive PowerShell script designed to assist SOC analysts and cybersecurity professionals in safely analyzing suspicious email files (`.eml` or `.msg`). It supports parsing headers, detecting and quarantining attachments, calculating hashes, and logging analysis actions.

---

## 🚀 Features

- 🔹 **Interactive Input** – Prompts for the email file path and guides the user through each analysis step.
- 🔹 **Email Header Parsing** – Extracts key metadata including:
  - From
  - To
  - Subject
  - Date
  - Received
- 🔹 **Attachment Detection** – Locates and identifies file attachments using regex.
- 🔹 **Quarantine System** – Saves attachments in a read-only quarantine folder with sanitized filenames.
- 🔹 **Suspicious File Detection** – Flags potentially dangerous extensions (`.exe`, `.js`, `.ps1`, etc.).
- 🔹 **Hash Calculation** – Computes MD5, SHA1, and SHA256 hashes of attachments.
- 🔹 **Logging** – Logs headers and hashes to `PhishingTool_Log.txt` on user request.

---

## 📂 Directory Structure

```plaintext
.
├── PhishingTool.ps1           # Main PowerShell script
├── PhishingTool_Log.txt       # Optional log output
└── Quarantine/                # Safe location for suspicious attachments
```

---

## 🛠️ How to Use

1. **Run the script** in PowerShell:
   ```powershell
   .\PhishingTool.ps1
   ```

2. **Enter the path** to the `.eml` or `.msg` file when prompted.

3. **Follow interactive prompts** to:
   - View parsed headers
   - Log header details
   - Quarantine any detected attachments
   - Check for suspicious file types
   - Compute and log cryptographic hashes

---

## 🔐 Security Measures

- Attachments are saved **read-only** to prevent accidental execution.
- Filenames are **sanitized** to avoid injection or path traversal.
- Known **malicious extensions** are flagged with warnings.
- Logging is **optional and user-controlled**.

---

## 📌 Notes

- Attachment extraction is simulated with placeholder content. Full MIME parsing can be added for complete functionality.
- Best used in a **sandbox environment** or SOC lab setting.

---

## ✅ Future Improvements

- 📎 Real attachment extraction using MIME parsing
- 🔍 Integration with VirusTotal for IOC checking
- 📡 Email body and link scanning
- 🧠 Automatic threat scoring

---

## 🧑‍💻 Author

MorphicWorm
