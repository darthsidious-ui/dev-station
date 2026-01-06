#!/bin/bash

# --- Imperial Terminal Styling ---
RED='\033[0;31m'
GOLD='\033[0;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

echo -e "${RED}⚠️  Executing Imperial Purge Protocol...${NC}"
echo -e "${RED}Wiping all traces of the Command Pod from this sector.${NC}"

# 1. Decommissioning the Fleet (Images)
# Removing the container image to free up orbital space
echo -e "${CYAN}🚮 Decommissioning the Command Pod image...${NC}"
podman rmi ghcr.io/darthsidious-ui/dev-station:latest --force 2>/dev/null

# 2. Erasing Records (Aliases)
# Cleaning .bashrc and .zshrc from Imperial entries
echo -e "${CYAN}📜 Erasing Imperial Records from .bashrc and .zshrc...${NC}"
# Delete the comment line and the alias line specifically
sed -i '/# Imperial Command Pod Alias/d' "$HOME/.bashrc"
sed -i "/alias dev='podman run/d" "$HOME/.bashrc"
sed -i '/# Imperial Command Pod Alias/d' "$HOME/.zshrc"
sed -i "/alias dev='podman run/d" "$HOME/.zshrc"

# 3. Purging Holocrons (Nerd Fonts)
# Removing specialized fonts from the local system
echo -e "${CYAN}🧹 Removing Nerd Fonts...${NC}"
FONT_DIR="$HOME/.local/share/fonts"
rm -f "$FONT_DIR"/JetBrainsMono*
fc-cache -f

# 4. Cutting Comm-links (Podman Socket)
# Disabling the user-level socket activated during installation
echo -e "${CYAN}🔌 Disconnecting comm-links (podman.socket)...${NC}"
systemctl --user disable --now podman.socket

# 5. Data Retention Policy
# We do not destroy the mission data (projects folder)
echo -e "${GOLD}❓ The 'projects' sector remains at $HOME/projects.${NC}"
echo -e "${GOLD}Imperial protocol preserves tactical data. Remove it manually if required.${NC}"

echo -e "${RED}--- THE SECTOR IS CLEAN ---${NC}"
echo -e "Restart your terminal or run 'source ~/.bashrc' to finalize the purge."