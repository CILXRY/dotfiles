function Install-Bandizip {
  Write-Host "📦 Installing Bandizip..."

  winget.exe install `
    --id "Bandisoft.Bandizip" `
    --exact `
    --source winget `
    --accept-source-agreements `
    --disable-interactivity `
    --version "6.29" `
    --silent

  reg.exe import "$PSScriptRoot\registry\Bandizip_20260604.reg"
}
