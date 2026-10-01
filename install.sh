#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$(readlink -f "$0")")"

./scripts/install-packages.sh
./scripts/setup-rust.sh
./scripts/link.sh
./scripts/setup-zsh.sh
