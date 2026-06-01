function Install-Base {
    Write-Host "📦 Installing base tools..."
    winget install --exact --silent --accept-package-agreements `
        Git.Git `
        Microsoft.WindowsTerminal `
        Microsoft.VisualStudioCode
}

function Restore-BaseConfig {
    $Conf = "$PSScriptRoot\..\config"

    Copy-Item "$Conf\git\.gitconfig" $env:USERPROFILE -Force
    Copy-Item "$Conf\ssh\config" "$env:USERPROFILE\.ssh\" -Force
    Copy-Item "$Conf\terminal\settings.json" `
        "$env:LOCALAPPDATA\Microsoft\Windows Terminal\" -Force
    Copy-Item "$Conf\powershell\profile.ps1" `
        "$env:USERPROFILE\Documents\PowerShell\" -Force
}
