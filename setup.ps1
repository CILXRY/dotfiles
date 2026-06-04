$Repo = "https://github.com/cilxry/dotfiles.git"
$Branch = "elegant"
$Target = "$env:USERPROFILE\dotfiles"
$ErrorActionPreference = "Stop"

function Update-Environment {
  $env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") +
  ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")
}

# 1. 确保 WinGet 存在
if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
  Clear-Host
  Write-Host "🔧 未找到 Winget，尝试安装..."
  Add-AppxPackage -RegisterByFamilyName -MainPackage Microsoft.DesktopAppInstaller_8wekyb3d8bbwe

  # 刷新 PATH
  Update-Environment

  # 二次检测：确认安装是否成功
  if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Host "❌ WinGet 安装过程出现问题了。在这里手动安装，或者检查网络之后再试:"
    Write-Host "   https://apps.microsoft.com/detail/9NBLGGH4NNS1"
    Write-Host "   (Microsoft App Installer)"
    Write-Host "   (按住 Ctrl 点击链接可以打开它)"
    Write-Host "   然后重新运行脚本。"
    pause
    exit 1
  }
  else {
    Write-Host "✅ WinGet 成功安装。"
  }
}

# 2. 确保 Git 存在

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
  Write-Host "🔧 未找到 Winget，尝试安装..."
  winget install --exact --silent --accept-package-agreements Git.Git

  # 刷新 PATH
  Update-Environment
}

# 3. 克隆仓库
if (-not (Test-Path $Target)) {
  Write-Host "📦 克隆 dotfiles (分支: $Branch)..."
  git clone --depth 1 --branch $Branch $Repo $Target
}
else {
  Write-Host "📦 dotfiles 存在, 拉取最新更改..."
  git -C $Target pull
}

$Base = $Target

# Import modules
Get-ChildItem "$Base\modules\*.ps1" | ForEach-Object { . $_.FullName }

# Core
Install-Base
Install-Node
Install-Python
Install-Docker
Install-Java
Install-Bandizip
Restore-BaseConfig

Write-Host "`n✅ All done. Reboot if Docker asked."
