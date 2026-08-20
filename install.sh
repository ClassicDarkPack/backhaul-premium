#!/usr/bin/env bash
set -euo pipefail

INSTALL_DIR="/root/backhaul-core"
SCRIPT_PATH="/root/backhaul.sh"

# GitHub repository
REPO_RAW_BASE="${REPO_RAW_BASE:-https://raw.githubusercontent.com/ClassicDarkPack/backhaul-premium/main}"

command -v curl >/dev/null 2>&1 || {
  echo "curl is required. Install it with:"
  echo "apt-get update && apt-get install -y curl"
  exit 1
}

mkdir -p "$INSTALL_DIR"

echo "[+] Downloading backhaul_premium..."
curl -fL --retry 3 --retry-delay 1 \
  "$REPO_RAW_BASE/backhaul-core/backhaul_premium" \
  -o "$INSTALL_DIR/backhaul_premium"

chmod +x "$INSTALL_DIR/backhaul_premium"

echo "[+] Downloading backhaul.sh..."
curl -fL --retry 3 --retry-delay 1 \
  "$REPO_RAW_BASE/backhaul.sh" \
  -o "$SCRIPT_PATH"

chmod +x "$SCRIPT_PATH"

echo "[+] Installed:"
ls -lh "$INSTALL_DIR/backhaul_premium" "$SCRIPT_PATH"

echo
echo "Run:"
echo "  bash /root/backhaul.sh"
