#!/usr/bin/env bash
set -euo pipefail

REPO="https://raw.githubusercontent.com/ClassicDarkPack/backhaul-premium/main"

INSTALL_DIR="/root/backhaul-core"
BACKHAUL_BIN="$INSTALL_DIR/backhaul_premium"
BACKHAUL_SCRIPT="/root/backhaul.sh"

echo "[+] Installing Backhaul Premium..."
echo

mkdir -p "$INSTALL_DIR"

echo "[+] Downloading backhaul_premium..."

curl -fL --retry 3 --retry-delay 1 \
    "$REPO/backhaul-core/backhaul_premium" \
    -o "$BACKHAUL_BIN"

echo "[+] Downloading backhaul.sh..."

curl -fL --retry 3 --retry-delay 1 \
    "$REPO/backhaul.sh" \
    -o "$BACKHAUL_SCRIPT"

echo "[+] Setting executable permissions..."

chmod +x /root/backhaul.sh /root/backhaul-core/backhaul_premium

echo
echo "[+] Installation completed successfully!"
echo
echo "[+] Installed files:"
ls -lh /root/backhaul.sh /root/backhaul-core/backhaul_premium

echo
echo "[+] Run Backhaul Premium with:"
echo
echo "    bash /root/backhaul.sh"
echo
