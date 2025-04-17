# Interactive Phishing Analysis Tool: Parse headers, extract attachments, and calculate hashes

# Prompt for the email file path
$emailPath = Read-Host "Enter the path to the email file (.eml or .msg)"
$quarantineDir = "./Quarantine"
$logPath = "./PhishingTool_Log.txt"

# Ensure quarantine directory exists
if (!(Test-Path -Path $quarantineDir)) {
    New-Item -ItemType Directory -Path $quarantineDir | Out-Null
}

# Function to calculate file hashes
function Get-FileHashes {
    param ([string]$filePath)
    
    $hashes = @{}
    $hashes.MD5 = (Get-FileHash -Path $filePath -Algorithm MD5).Hash
    $hashes.SHA1 = (Get-FileHash -Path $filePath -Algorithm SHA1).Hash
    $hashes.SHA256 = (Get-FileHash -Path $filePath -Algorithm SHA256).Hash
    
    return $hashes
}

# Function to parse email headers
function Parse-EmailHeaders {
    param ([string]$emailContent)
    
    $headers = @{}
    $headerPattern = @{
        'From' = '(?im)^From:\s*(.+)';
        'To' = '(?im)^To:\s*(.+)';
        'Subject' = '(?im)^Subject:\s*(.+)';
        'Date' = '(?im)^Date:\s*(.+)';
        'Received' = '(?im)^Received:\s*(.+)';
    }
    
    foreach ($key in $headerPattern.Keys) {
        if ($emailContent -match $headerPattern[$key]) {
            $headers[$key] = $matches[1].Trim()
        } else {
            $headers[$key] = 'Not Found'
        }
    }
    
    return $headers
}

# Function to sanitize filenames
function Sanitize-Filename {
    param ([string]$fileName)
    
    return $fileName -replace '[^a-zA-Z0-9_.-]', '_'
}

# Function to check for suspicious file types
function Is-SuspiciousFile {
    param ([string]$fileName)
    
    $suspiciousExtensions = @(".exe", ".bat", ".cmd", ".js", ".vbs", ".ps1", ".dll")
    $extension = [System.IO.Path]::GetExtension($fileName)
    return $suspiciousExtensions -contains $extension
}

# Process the email file
try {
    $emailContent = Get-Content -Path $emailPath -Raw -ErrorAction Stop
    
    # Parse headers
    Write-Host "\n--- Parsing Email Headers ---" -ForegroundColor Cyan
    $headers = Parse-EmailHeaders -emailContent $emailContent
    $headers.GetEnumerator() | ForEach-Object { Write-Host "$($_.Key): $($_.Value)" }
    
    # Ask if user wants to log headers
    $logHeaders = Read-Host "Would you like to log these headers? (yes/no)"
    if ($logHeaders -eq "yes") {
        Add-Content -Path $logPath -Value "`n[$(Get-Date)] Processed email: $emailPath"
        $headers.GetEnumerator() | ForEach-Object { Add-Content -Path $logPath -Value "$($_.Key): $($_.Value)" }
        Write-Host "Headers logged to: $logPath" -ForegroundColor Green
    }
    
    # Extract attachments
    Write-Host "\n--- Checking for Attachments ---" -ForegroundColor Cyan
    if ($emailContent -match "(?im)Content-Disposition: attachment;.*?filename=\"(.+?)\"") {
        $fileName = $matches[1]
        
        # Sanitize and confirm file extraction
        $safeFileName = Sanitize-Filename -fileName $fileName
        $filePath = Join-Path -Path $quarantineDir -ChildPath $safeFileName

        $confirmSave = Read-Host "Found attachment: $fileName. Save to quarantine folder? (yes/no)"
        if ($confirmSave -eq "yes") {
            [System.IO.File]::WriteAllBytes($filePath, [byte[]](0)) # Placeholder for empty content
            Write-Host "Attachment quarantined: $safeFileName" -ForegroundColor Yellow
            
            # Set file to read-only
            (Get-Item $filePath).IsReadOnly = $true

            # Check for suspicious file types
            if (Is-SuspiciousFile -fileName $safeFileName) {
                Write-Host "Warning: Suspicious file type detected ($safeFileName)" -ForegroundColor Red
            }

            # Ask if user wants to calculate hashes
            $calculateHashes = Read-Host "Would you like to calculate hashes for the attachment? (yes/no)"
            if ($calculateHashes -eq "yes") {
                $hashes = Get-FileHashes -filePath $filePath
                Write-Host "MD5: $($hashes.MD5)"
                Write-Host "SHA1: $($hashes.SHA1)"
                Write-Host "SHA256: $($hashes.SHA256)"
                
                # Log hashes if user wants to
                $logHashes = Read-Host "Would you like to log these hashes? (yes/no)"
                if ($logHashes -eq "yes") {
                    Add-Content -Path $logPath -Value "MD5: $($hashes.MD5)"
                    Add-Content -Path $logPath -Value "SHA1: $($hashes.SHA1)"
                    Add-Content -Path $logPath -Value "SHA256: $($hashes.SHA256)"
                    Write-Host "Hashes logged to: $logPath" -ForegroundColor Green
                }
            }
        }
    } else {
        Write-Host "No attachments found in the email." -ForegroundColor Red
    }
} catch {
    Write-Host "Error processing the email: $_" -ForegroundColor Red
}

Write-Host "\n--- Analysis Complete ---" -ForegroundColor Cyan
