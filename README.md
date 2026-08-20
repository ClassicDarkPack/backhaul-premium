# Backhaul Premium

Installer package for deploying `backhaul_premium` and `backhaul.sh` to a Linux server.

## Installation

After the repository is public on GitHub:

```bash
REPO_RAW_BASE=https://raw.githubusercontent.com/USERNAME/backhaul-premium/main \
bash <(curl -fsSL https://raw.githubusercontent.com/USERNAME/backhaul-premium/main/install.sh)
```

The installer places:

- `/root/backhaul-core/backhaul_premium`
- `/root/backhaul.sh`

and sets the required executable permissions.

## Run

```bash
bash /root/backhaul.sh
```

## Files

```text
backhaul-core/backhaul_premium
backhaul.sh
install.sh
```
