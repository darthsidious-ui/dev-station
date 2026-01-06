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
    fzf ripgrep bat eza podman-remote \
    ansible-core \
    && dnf clean all

# 2. Tactical Gear Acquisition (Binaries)
# Downloading advanced weaponry directly from the manufacturers
RUN echo "--- Installing Kubernetes, Helm, k9s, and Terraform ---" && \
    # Install kubectl
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl && \
    # Install Helm
    curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash && \
    # Install k9s
    curl -L -s https://github.com/derailed/k9s/releases/latest/download/k9s_Linux_amd64.tar.gz | tar xz -C /usr/local/bin k9s && \
    # Install Terraform (OpenTofu approach)
    curl -L -s https://github.com/opentofu/opentofu/releases/latest/download/tofu_1.8.8_linux_amd64.tar.gz | tar xz -C /usr/local/bin tofu && \
    ln -s /usr/local/bin/tofu /usr/local/bin/terraform
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