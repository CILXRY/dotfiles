function Install-Node {
    Write-Host "📦 Installing Node LTS..."
    winget install --exact --silent OpenJS.NodeJS.LTS

    Write-Host "📦 Installing pnpm + standard-version..."
    npm install -g pnpm standard-version
    pnpm setup
}
