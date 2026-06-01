function Install-Python {
    Write-Host "📦 Installing Python + uv..."
    winget install --exact --silent Python.Python.3

    if (-not (Get-Command uv -EA Ignore)) {
        irm https://astral.sh/uv/install.ps1 | iex
    }

    uv python install 3.14
}
