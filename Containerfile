# --- Imperial Command Pod Blueprints ---
# Base: Fedora 43 (The latest Imperial Standard)
FROM fedora:43

# Imperial Identification Metadata
LABEL maintainer="darthsidious-ui"
LABEL description="Tactical DevOps Station - Imperial Fleet Command Pod"

# 1. Deployment of System Arsenal
# Installing core Imperial utilities available in standard repositories
RUN dnf install -y \
    git zsh curl wget tmux nmap-ncat \
    kubectl k9s helm kubernetes-client \
    fzf ripgrep bat podman \
    ansible-core dnf-plugins-core \
    iputils \
    && dnf clean all

# 2. Tactical Gear Acquisition (Binaries)
# Downloading advanced weaponry directly from the manufacturers
RUN echo "--- Installing Terraform repo and manual install eza ---" && \
    printf "[hashicorp]\nname=HashiCorp Stable - \$basearch\nbaseurl=https://rpm.releases.hashicorp.com/fedora/\$releasever/\$basearch/stable\nenabled=1\ngpgcheck=1\ngpgkey=https://rpm.releases.hashicorp.com/gpg\n" > /etc/yum.repos.d/hashicorp.repo && \
    dnf install -y terraform
RUN curl -L -s https://github.com/eza-community/eza/releases/latest/download/eza_x86_64-unknown-linux-gnu.tar.gz | tar xz -C /usr/local/bin && \
    chmod +x /usr/local/bin/eza

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

# Setting the command bridge environment
WORKDIR /root
ENTRYPOINT ["/bin/zsh"]
