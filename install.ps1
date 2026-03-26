# ============================================
# dotfiles Install Script for Windows
# Usage: Run this script as Administrator
# ============================================

$GITHUB_USER = "pugi94"
$DOTFILES_DIR = "$HOME\.dotfiles"
$REPO_URL = "https://github.com/$GITHUB_USER/dotfiles"

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "   dotfiles Auto Setup Script" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# ── Step 1: 관리자 권한 확인 ──────────────────────
Write-Host "[1/5] Checking administrator privileges..." -ForegroundColor Yellow
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if (-not $isAdmin) {
    Write-Host "ERROR: Please run PowerShell as Administrator." -ForegroundColor Red
    Write-Host "       Right-click PowerShell → Run as Administrator" -ForegroundColor Red
    exit 1
}
Write-Host "OK" -ForegroundColor Green

# ── Step 2: Git 설치 확인 ─────────────────────────
Write-Host ""
Write-Host "[2/5] Checking Git installation..." -ForegroundColor Yellow
if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Host "ERROR: Git is not installed." -ForegroundColor Red
    Write-Host "       Please install Git from https://git-scm.com and re-run this script." -ForegroundColor Red
    exit 1
}
Write-Host "OK - $(git --version)" -ForegroundColor Green

# ── Step 3: dotfiles 클론 또는 업데이트 ───────────
Write-Host ""
Write-Host "[3/5] Setting up dotfiles repository..." -ForegroundColor Yellow
if (Test-Path $DOTFILES_DIR) {
    Write-Host "dotfiles already exists. Pulling latest changes..." -ForegroundColor Gray
    Set-Location $DOTFILES_DIR
    git pull
} else {
    Write-Host "Cloning from $REPO_URL ..." -ForegroundColor Gray
    git clone $REPO_URL $DOTFILES_DIR
    if ($LASTEXITCODE -ne 0) {
        Write-Host "ERROR: Failed to clone repository. Check your internet connection." -ForegroundColor Red
        exit 1
    }
}
Write-Host "OK" -ForegroundColor Green

# ── Step 4: 심볼릭 링크 연결 ──────────────────────
Write-Host ""
Write-Host "[4/5] Creating symbolic links..." -ForegroundColor Yellow

$links = @{
    "$HOME\.claude" = "$DOTFILES_DIR\.claude"
}

foreach ($link in $links.GetEnumerator()) {
    $linkPath = $link.Key
    $targetPath = $link.Value

    if (-not (Test-Path $targetPath)) {
        Write-Host "WARNING: Target not found, skipping: $targetPath" -ForegroundColor DarkYellow
        continue
    }

    if (Test-Path $linkPath) {
        $existing = Get-Item $linkPath -Force
        if ($existing.LinkType -eq "SymbolicLink") {
            Write-Host "Already linked: $linkPath" -ForegroundColor Gray
            continue
        } else {
            $backupPath = "$linkPath.bak"
            Write-Host "Backing up existing: $linkPath → $backupPath" -ForegroundColor Gray
            Rename-Item $linkPath $backupPath -Force
        }
    }

    New-Item -ItemType SymbolicLink -Path $linkPath -Target $targetPath | Out-Null
    Write-Host "Linked: $linkPath → $targetPath" -ForegroundColor Green
}
Write-Host "OK" -ForegroundColor Green

# ── Step 5: Git 사용자 정보 설정 ──────────────────
Write-Host ""
Write-Host "[5/5] Configuring Git identity..." -ForegroundColor Yellow
$currentEmail = git config --global user.email
$currentName = git config --global user.name

if ($currentEmail -and $currentName) {
    Write-Host "Already configured: $currentName <$currentEmail>" -ForegroundColor Gray
} else {
    Write-Host ""
    $email = Read-Host "Enter your GitHub email"
    $name = Read-Host "Enter your GitHub username"
    git config --global user.email $email
    git config --global user.name $name
    Write-Host "OK - Git configured as: $name <$email>" -ForegroundColor Green
}

# ── 완료 ──────────────────────────────────────────
Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "   Setup Complete!" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "CLAUDE.md is now active for:" -ForegroundColor White
Write-Host "  - Claude Desktop App (Cowork)" -ForegroundColor Gray
Write-Host "  - Claude Code (VS Code / Terminal)" -ForegroundColor Gray
Write-Host "  - Antigravity (with Claude Code extension)" -ForegroundColor Gray
Write-Host ""
Write-Host "To update CLAUDE.md later:" -ForegroundColor White
Write-Host "  notepad $DOTFILES_DIR\.claude\CLAUDE.md" -ForegroundColor Gray
Write-Host "  cd $DOTFILES_DIR && git add . && git commit -m 'Update' && git push" -ForegroundColor Gray
Write-Host ""
