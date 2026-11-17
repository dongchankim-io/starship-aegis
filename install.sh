#!/usr/bin/env bash
set -euo pipefail

# ==============================================================================
# 🛰️ starship-aegis — CLI Installer & Live Palette Switcher
# Author: Dongchan Kim (@dongchankim-io)
# Repo:   https://github.com/dongchankim-io/starship-aegis
# ==============================================================================

REPO_RAW="https://raw.githubusercontent.com/dongchankim-io/starship-aegis/main"
CONFIG_DIR="${HOME}/.config"
TARGET_FILE="${CONFIG_DIR}/starship.toml"
BIN_DIR="${HOME}/.local/bin"

GREEN='\033[1;32m'
CYAN='\033[1;36m'
YELLOW='\033[1;33m'
RED='\033[1;31m'
RESET='\033[0m'

echo -e "${CYAN}🛰️  Installing Starship Aegis by @dongchankim-io...${RESET}"

mkdir -p "${CONFIG_DIR}"

if [ -f "${TARGET_FILE}" ]; then
  BACKUP="${TARGET_FILE}.backup.$(date +%Y%m%d_%H%M%S)"
  cp "${TARGET_FILE}" "${BACKUP}"
  echo -e "${YELLOW}📦 Backed up existing starship.toml to ${BACKUP}${RESET}"
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" && pwd)"
if [ -f "${SCRIPT_DIR}/starship.toml" ]; then
  cp "${SCRIPT_DIR}/starship.toml" "${TARGET_FILE}"
else
  curl -fsSL "${REPO_RAW}/starship.toml" -o "${TARGET_FILE}"
fi

mkdir -p "${BIN_DIR}"
if [ -f "${SCRIPT_DIR}/bin/aegis" ]; then
  cp "${SCRIPT_DIR}/bin/aegis" "${BIN_DIR}/aegis"
  chmod +x "${BIN_DIR}/aegis"
else
  curl -fsSL "${REPO_RAW}/bin/aegis" -o "${BIN_DIR}/aegis"
  chmod +x "${BIN_DIR}/aegis"
fi

echo -e "${GREEN}✅ Starship Aegis installed to ${TARGET_FILE}${RESET}"
echo -e "${GREEN}✅ CLI helper installed to ${BIN_DIR}/aegis${RESET}"
echo ""
echo -e "Try switching palettes anytime:"
echo -e "  ${CYAN}aegis theme catppuccin_mocha${RESET}"
echo -e "  ${CYAN}aegis theme tokyo_night${RESET}"
echo -e "  ${CYAN}aegis theme kanagawa${RESET}"
echo -e "  ${CYAN}aegis theme rose_pine${RESET}"
echo -e "  ${CYAN}aegis theme gruvbox_material${RESET}"
echo -e "  ${CYAN}aegis theme nord${RESET}"
echo -e "  ${CYAN}aegis demo${RESET}   # Render a live preview of all HUD states!"
