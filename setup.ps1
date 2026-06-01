$Base = Split-Path $MyInvocation.MyCommand.Path

# Import modules
Get-ChildItem "$Base\modules\*.ps1" | ForEach-Object { . $_.FullName }

# Core
Install-Base
Install-Node
Install-Python
Install-Docker
Install-Java
Restore-BaseConfig

Write-Host "`n✅ All done. Reboot if Docker asked."
