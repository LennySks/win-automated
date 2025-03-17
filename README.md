# win-automated

Automated tool for post-installation of Windows with my own settings.

## Resources

- [CTT Winutil](https://github.com/christitustech/winutil)
- [FR33THY Optimization Pack](https://github.com/FR33THYFR33THY/Ultimate-Windows-Optimization-Guide)

## Workflow

1. Uses CTT Winutil to install software, run tweaks and enable security updates in CLI.
   - `iex "& { $(irm https://christitus.com/win) } -Config ./config/tweaks.json -Run"`
2. Uses FR33THY Optimization Pack's scripts to optimize system settings and remove bloatware.
   - Registry
   - Bloatware
   - Gamebar
   - Copilot
   - Widgets
   - Power plan
   - Cleanup

## Usage

1. Navigate to the root of the repository.
2. Run a powershell terminal as administrator
3. Run `run.ps1` within that terminal.
