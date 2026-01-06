# --- Imperial Command Pod Blueprints ---
# Base: Fedora 43 (The latest Imperial Standard)
FROM fedora:43

# Imperial Identification Metadata
LABEL maintainer="darthsidious-ui"
LABEL description="Tactical DevOps Station - Imperial Fleet Command Pod"

# 1. Deployment of System Arsenal and Tactical Tools
# Equipping the station with essential communication and orchestration gear
RUN dnf install -y \
    git zsh curl wget tmux nmap-ncat \
    kubernetes-client helm k9s \
    terraform ansible-core \
    fzf ripgrep bat eza \
    && dnf clean all

# 2. Interface Enhancements (Modern Substitutes)
# Calibrating eza for visual scans (ls) and bat for data decryption (cat)
RUN echo 'alias ls="eza --icons"' >> /etc/zshrc && \
    echo 'alias cat="bat"' >> /etc/zshrc

# 3. Establishing the Oh My Zsh Framework
# Initializing the core shell environment for Imperial Officers
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# 4. Calibration of the Command Interface & Starship Engine
# Integrating the Starship prompt for real-time tactical awareness
RUN curl -sS https://starship.rs/install.sh | sh -s -- -y && \
    echo 'eval "$(starship init zsh)"' >> /root/.zshrc && \
    echo 'alias ls="eza --icons"' >> /root/.zshrc && \
    echo 'alias cat="bat"' >> /root/.zshrc && \
    mkdir -p /root/.config

# 5. Importing Imperial Aesthetics (Dotfiles)
# Syncing the Starship Holocron from the local repository
COPY configs/starship.toml /root/.config/starship.toml

# 6. Specialized Fleet Management Tools (Podman-remote)
# Enabling remote dominance over the UM890Pro sector
RUN dnf install -y podman-remote

# Setting the command bridge environment
WORKDIR /root
ENTRYPOINT ["/bin/zsh"]