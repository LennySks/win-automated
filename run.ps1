# Imports
. "$PSScriptRoot\scripts\ctt_tweaks.ps1"
. "$PSScriptRoot\scripts\fr33thy_tweaks.ps1"
# . "$PSScriptRoot\scripts\amd_drivers.ps1"

# Load the System.Windows.Forms assembly
Add-Type -AssemblyName System.Windows.Forms

# Relaunch as Admin if not already running as admin
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Start-Process powershell.exe -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    exit
}

CTTTweaks
Fr33thyTweaks
# Install-AMDDriver
Write-Host "All scripts have completed. Please restart to take effect."