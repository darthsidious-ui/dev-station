FROM fedora:43

LABEL maintainer="Arkadiusz Celmer"
LABEL description="Full DevOps Workstation - Portable Environment"

RUN dnf install -y \
    git zsh curl wget tmux nmap-ncat \
    kubernetes-client helm k9s \
    terraform ansible-core \
    fzf ripgrep bat eza \
    && dnf clean all

RUN echo 'alias ls="eza --icons"' >> /etc/zshrc && \
    echo 'alias cat="bat"' >> /etc/zshrc

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended && \
    curl -sS https://starship.rs/install.sh | sh -s -- -y && \
    echo 'eval "$(starship init zsh)"' >> ~/.zshrc

COPY ./configs/zshrc /root/.zshrc
COPY ./configs/starship.toml /root/.config/starship.toml

RUN dnf install -y podman-remote

WORKDIR /root
ENTRYPOINT ["/bin/zsh"]

