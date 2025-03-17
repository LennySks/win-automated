# Relaunch as Admin if not already running as admin
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Start-Process powershell.exe -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    exit
}

# Load the System.Windows.Forms assembly
Add-Type -AssemblyName System.Windows.Forms

# run ctt with config
Invoke-Expression "& { $(Invoke-RestMethod https://christitus.com/win) } -Config ./config/tweaks.json -Run"

# run fr33thy tweaks
$scripts = Get-Content -Raw .\config\fr33thytweaks.json | ConvertFrom-Json

foreach ($script in $scripts.scripts) {
    $url = $script.url
    $inputValue = if ($script.input) { $script.input } else { "1" }  # Default to "1" if not provided
    try { 
    # Download the script
    $scriptContent = Invoke-RestMethod -Uri $url

    # Save the script to a temporary file
    $tempScriptPath = [System.IO.Path]::Combine($env:TEMP, "temp_script.ps1")
    $scriptContent | Set-Content -Path $tempScriptPath

        # Start the process and wait for it to start
        $process = Start-Process "powershell.exe" -ArgumentList "-File `"$tempScriptPath`" -WindowStyle Hidden" -PassThru
        
        # Wait for a short time to allow the process to fully start and become ready for input
        Start-Sleep -Seconds 2  # Adjust this as needed
        
        # Send the input value
        [System.Windows.Forms.SendKeys]::SendWait($inputValue)
        
        # Send the Enter key
        [System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
        
        # Output info for tracking
        Write-Host "Running script: $url with input: $inputValue and Enter pressed"
    
        # Check if $process is valid before waiting for exit
        if ($process.ExitCode -eq 0) {
            Write-Host "Script ran successfully: $url"
        } else {
            Write-Host "Script failed with exit code: $($process.ExitCode) for: $url"
        }
    } catch {
        Write-Host "Error occurred while running the script: $url. Error: $_"
    }
    # Ensure each script completes before moving on to the next
    Write-Host "Waiting for script to finish..."
}
Write-Host "All scripts have completed. Please restart to take effect."