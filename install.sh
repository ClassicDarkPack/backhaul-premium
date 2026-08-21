#!/usr/bin/env bash
set -euo pipefail

INSTALL_DIR="/root/backhaul-core"
SCRIPT_PATH="/root/backhaul.sh"

# GitHub Raw repository URL
REPO_RAW_BASE="${REPO_RAW_BASE:-https://raw.githubusercontent.com/ClassicDarkPack/backhaul-premium/main}"

# Check for curl
if ! command -v curl >/dev/null 2>&1; then
    echo "[!] curl is required."
    echo "[+] Install it with:"
    echo "    apt-get update && apt-get install -y curl"
    exit 1
fi

# Create installation directory
mkdir -p "$INSTALL_DIR"

echo "[+] Using repository:"
echo "    $REPO_RAW_BASE"
echo

# Download Backhaul Premium binary
echo "[+] Downloading backhaul_premium..."

if ! curl -fL --retry 3 --retry-delay 1 \
    "$REPO_RAW_BASE/backhaul-core/backhaul_premium" \
    -o "$INSTALL_DIR/backhaul_premium"; then

    echo "[!] Failed to download backhaul_premium."
    echo "[!] Check that the file exists in:"
    echo "    backhaul-core/backhaul_premium"
    exit 1
fi

chmod +x "$INSTALL_DIR/backhaul_premium"

# Download management script
echo "[+] Downloading backhaul.sh..."

if ! curl -fL --retry 3 --retry-delay 1 \
    "$REPO_RAW_BASE/backhaul.sh" \
    -o "$SCRIPT_PATH"; then

    echo "[!] Failed to download backhaul.sh."
    echo "[!] Check that the file exists in the repository."
    exit 1
fi

chmod +x "$SCRIPT_PATH"

echo
echo "[+] Installation completed successfully!"
echo
echo "[+] Installed files:"
ls -lh "$INSTALL_DIR/backhaul_premium" "$SCRIPT_PATH"

echo
echo "[+] Run Backhaul Premium with:"
echo
echo "    bash /root/backhaul.sh"
echo
