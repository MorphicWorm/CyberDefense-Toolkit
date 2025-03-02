# Phishing Analysis Tool
# Parses email headers and logs extracted data for future reference

# Prompt user for the path to the email header file
$emailHeaderPath = Read-Host "Enter the path to the email header file"

# Check if the file exists
if (-Not (Test-Path $emailHeaderPath)) {
    Write-Host "File not found. Please check the path and try again." -ForegroundColor Red
    exit
}

# Read the email header content
$emailHeader = Get-Content $emailHeaderPath -Raw

# Extract key fields using regex
$from = [regex]::Match($emailHeader, "From:\s*(.*)").Groups[1].Value.Trim()
$to = [regex]::Match($emailHeader, "To:\s*(.*)").Groups[1].Value.Trim()
$subject = [regex]::Match($emailHeader, "Subject:\s*(.*)").Groups[1].Value.Trim()
$returnPath = [regex]::Match($emailHeader, "Return-Path:\s*(.*)").Groups[1].Value.Trim()
$date = [regex]::Match($emailHeader, "Date:\s*(.*)").Groups[1].Value.Trim()
$received = [regex]::Match($emailHeader, "Received:\s*(.*)").Groups[1].Value.Trim()

# Display extracted details
Write-Host "`n--- Extracted Email Header Fields ---" -ForegroundColor Cyan
Write-Host "From: $from"
Write-Host "To: $to"
Write-Host "Subject: $subject"
Write-Host "Return-Path: $returnPath"
Write-Host "Date: $date"
Write-Host "Received: $received"

# Log data to a timestamped file
$logDir = ".\PhishingAnalysisLogs"
if (-Not (Test-Path $logDir)) {
    New-Item -Path $logDir -ItemType Directory
}

$timestamp = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"
$logFile = "$logDir\PhishingLog_$timestamp.txt"

$emailData = @"
From: $from
To: $to
Subject: $subject
Return-Path: $returnPath
Date: $date
Received: $received
"@

$emailData | Out-File -FilePath $logFile

Write-Host "`nEmail header data has been logged to: $logFile" -ForegroundColor Green
