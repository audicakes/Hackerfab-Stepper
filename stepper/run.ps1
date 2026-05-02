# HackerFab Stepper – Windows launcher (PowerShell)
# Run from any directory; script locates the project root automatically.
#
# If Windows blocks the script: right-click → "Run with PowerShell"
# or run:  Set-ExecutionPolicy RemoteSigned -Scope CurrentUser

param()
$ErrorActionPreference = "Stop"

$ProjectRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $ProjectRoot

Write-Host ""
Write-Host "  HackerFab Stepper" -ForegroundColor Cyan
Write-Host "  -----------------" -ForegroundColor Cyan
Write-Host ""

# ── 1. Ensure uv is available ────────────────────────────────────────────
if (-not (Get-Command uv -ErrorAction SilentlyContinue)) {
    Write-Host "  Installing uv package manager..." -ForegroundColor Yellow
    Invoke-RestMethod https://astral.sh/uv/install.ps1 | Invoke-Expression
    # Refresh PATH so uv is found in this session
    $env:PATH = "$env:USERPROFILE\.local\bin;$env:USERPROFILE\.cargo\bin;$env:PATH"
    Write-Host ""
}

# ── 2. Install / sync dependencies ───────────────────────────────────────
# First run downloads PyTorch + friends (~1-2 GB). This is normal.
Write-Host "  Checking dependencies..." -ForegroundColor Yellow
uv sync --quiet
Write-Host "  Dependencies OK" -ForegroundColor Green
Write-Host ""

# ── 3. Launch ────────────────────────────────────────────────────────────
Write-Host "  Starting..." -ForegroundColor Green
Write-Host ""
uv run python src/gui.py
