# HackerFab Stepper – Windows launcher (PowerShell)
# Run from any directory; script locates the project root automatically.
#
# Use -SetupOnly to install and validate dependencies without opening the GUI.

param(
    [switch]$SetupOnly
)
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
uv sync --locked --quiet
Write-Host "  Dependencies OK" -ForegroundColor Green
Write-Host ""

if ($SetupOnly) {
    Write-Host "  Setup-only check complete." -ForegroundColor Green
    exit 0
}

# ── 3. Launch ────────────────────────────────────────────────────────────
Write-Host "  Starting..." -ForegroundColor Green
Write-Host ""
uv run python src/gui.py
exit $LASTEXITCODE
