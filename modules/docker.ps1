function Install-Docker {
    Write-Host "📦 Installing Docker Desktop..."
    winget install --exact --silent Docker.DockerDesktop
}
