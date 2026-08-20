#!/usr/bin/env bash
set -euo pipefail

INSTALL_DIR="/root/backhaul-core"
SCRIPT_PATH="/root/backhaul.sh"
REPO_RAW_BASE="${REPO_RAW_BASE:-}"

if [[ -z "$REPO_RAW_BASE" ]]; then
  echo "Set REPO_RAW_BASE to the raw GitHub base URL, e.g."
  echo "REPO_RAW_BASE=https://raw.githubusercontent.com/USERNAME/backhaul-premium/main bash install.sh"
  exit 1
fi

command -v curl >/dev/null 2>&1 || {
  echo "curl is required. Install it with: apt-get update && apt-get install -y curl"
  exit 1
}

mkdir -p "$INSTALL_DIR"

echo "[+] Downloading backhaul_premium..."
curl -fL --retry 3 --retry-delay 1 "$REPO_RAW_BASE/backhaul-core/backhaul_premium" -o "$INSTALL_DIR/backhaul_premium"
chmod +x "$INSTALL_DIR/backhaul_premium"

echo "[+] Downloading backhaul.sh..."
curl -fL --retry 3 --retry-delay 1 "$REPO_RAW_BASE/backhaul.sh" -o "$SCRIPT_PATH"
chmod +x "$SCRIPT_PATH"

echo "[+] Installed:"
ls -lh "$INSTALL_DIR/backhaul_premium" "$SCRIPT_PATH"

echo
echo "Run:"
echo "  bash /root/backhaul.sh"
