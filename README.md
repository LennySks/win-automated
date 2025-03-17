# win-automated

Automated tool for post-installation of Windows with my own settings.

## Resources

- [CTT Winutil](https://github.com/christitustech/winutil)
- [FR33THY Optimization Pack](https://github.com/FR33THYFR33THY/Ultimate-Windows-Optimization-Guide)

## Requirements

- Windows 11 (10 might work)
- Powershell
- Git
- Running scripts is enabled
  - To enable scripts `Set-ExecutionPolicy RemoteSigned`
  - To disable scripts `Set-ExecutionPolicy Restricted`

## Workflow

1. Uses CTT Winutil to install software, run default tweaks and enable security updates in CLI.

   - `iex "& { $(irm https://christitus.com/win) } -Config ./config/tweaks.json -Run"`

2. Uses FR33THY Optimization Pack's scripts to optimize system settings and remove bloatware.

   - Registry
   - Bloatware
   - Gamebar
   - Copilot
   - Widgets
   - Power plan
   - Cleanup

3. Installs AMD Chipset and GPU drivers. (TODO)

## Usage

Open Powershell as Administrator and run the following commands:

```shell
git clone https://github.com/LennySks/win-automated.git
cd win-automated
.\run.ps1
```
