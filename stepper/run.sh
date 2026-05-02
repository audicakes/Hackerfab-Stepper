#!/usr/bin/env bash
# HackerFab Stepper – Linux / macOS launcher
# Usage: ./run.sh
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo ""
echo "  HackerFab Stepper"
echo "  ─────────────────"
echo ""

# ── 1. Ensure uv is available ───────────────────────────────────────────
if ! command -v uv &>/dev/null; then
    echo "  Installing uv package manager..."
    curl -LsSf https://astral.sh/uv/install.sh | sh
    # Add uv to PATH for this session
    export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$PATH"
    echo ""
fi

# ── 2. Install / sync dependencies ─────────────────────────────────────
# On first run this downloads PyTorch + friends (~1-2 GB). Grab a coffee.
echo "  Checking dependencies..."
uv sync --quiet
echo "  Dependencies OK"
echo ""

# ── 3. Launch ────────────────────────────────────────────────────────────
echo "  Starting..."
echo ""
exec uv run python src/gui.py
