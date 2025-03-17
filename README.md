# win-automated

Automated tool for post-installation of windows with own settings.

## Resources

- CTT Winutil
- FR33THY Optimization Pack

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

Run `./run.ps1` inside powershell.
