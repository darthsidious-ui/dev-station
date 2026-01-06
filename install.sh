#!/bin/bash

# --- Imperial Terminal Styling ---
RED='\033[0;31m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
GOLD='\033[0;33m'
NC='\033[0m' # No Color

echo -e "${PURPLE}🌌 Initializing Imperial Command Pod Deployment...${NC}"
echo -e "${RED}⚠️  Don't be too proud of this technological terror you're about to construct.${NC}"

# 1. Deployment of Holocron Fonts (Nerd Fonts)
FONT_DIR="$HOME/.local/share/fonts"
if [ ! -d "$FONT_DIR" ]; then
    mkdir -p "$FONT_DIR"
fi

echo -e "${CYAN}📡 Downloading JetBrainsMono Holocron (Nerd Fonts)...${NC}"
curl -fLo "JetBrainsMono.zip" https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
unzip -o JetBrainsMono.zip -d "$FONT_DIR" > /dev/null
rm JetBrainsMono.zip
fc-cache -f
echo -e "${GOLD}✨ Holocron data synced to the local system.${NC}"

# 2. Establish Secure Comms (Aliases)
# Linking the host to the Command Pod via Podman
BASHRC="$HOME/.bashrc"
ZSHRC="$HOME/.zshrc"

# We use the hardcoded GHCR path for darthsidious-ui
DEV_ALIAS="alias dev='podman run -it --rm --name imperial-pod \
    -v \$HOME/projects:/root/projects \
    -v \$HOME/.ssh:/root/.ssh:ro \
    -v /run/user/\$(id -u)/podman/podman.sock:/run/user/0/podman/podman.sock \
    ghcr.io/darthsidious-ui/dev-station:latest'"

add_imperial_alias() {
    if ! grep -q "alias dev=" "$1"; then
        echo -e "\n# Imperial Command Pod Alias\n$DEV_ALIAS" >> "$1"
        echo -e "${GOLD}📡 Comm-link established in $1${NC}"
    fi
}

[ -f "$BASHRC" ] && add_imperial_alias "$BASHRC"
[ -f "$ZSHRC" ] && add_imperial_alias "$ZSHRC"

# 3. Summoning the Command Pod (Pulling from GHCR)
echo -e "${PURPLE}📥 Summoning the latest Command Pod from the Imperial Registry...${NC}"
podman pull ghcr.io/darthsidious-ui/dev-station:latest

echo -e "${RED}--- THE EMPIRE HAS ARRIVED ---${NC}"
echo -e "1. ${CYAN}Restart${NC} your terminal to apply system changes."
echo -e "2. Set your terminal font to: ${GOLD}JetBrainsMono Nerd Font${NC}."
echo -e "3. Execute: ${RED}dev${NC} to take command of your station."