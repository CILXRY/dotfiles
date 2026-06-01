function Install-Java {
    Write-Host "📦 Installing Azul Zulu JDKs..."
    winget install --exact --silent Azul.ZuluJDK.8
    winget install --exact --silent Azul.ZuluJDK.17
    winget install --exact --silent Azul.ZuluJDK.21
    winget install --exact --silent Azul.ZuluJDK.25
}
