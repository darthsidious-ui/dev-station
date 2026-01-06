# 🚀 dev-station: The Imperial Command Pod

This repository contains the blueprints for my portable, containerized DevOps environment. It is designed to be deployed in seconds on any system across the galaxy (or at least those running Linux).

### 🌌 Overview
In the Empire, we don't believe in manual configuration. This project uses a **Fedora 43** base, hardened and equipped with all the tactical tools needed to manage the Imperial Fleet (my Homelab).

### 🛠️ Tactical Gear (Toolstack)
- **Navigation:** `kubectl`, `helm`, `k9s` (Kubernetes Mastery)
- **Construction:** `terraform`, `ansible` (IaC)
- **Engines:** `podman`, `buildah` (Container Runtime)
- **Comm Link:** `zsh` with `Starship` prompt (Imperial Aesthetics)

### 🛰️ Deployment (Installation)
To prepare your terminal for the Imperial Command, run the following sequence:

curl -sSL [https://raw.githubusercontent.com/darthsidious-ui/dev-station/main/install.sh](https://raw.githubusercontent.com/darthsidious-ui/dev-station/main/install.sh) | bash

🚢 CI/CD Automation
The Death Star's engineers (GitHub Actions) automatically rebuild this pod whenever the blueprints are updated.

Registry: ghcr.io/darthsidious-ui/dev-station:latest

"Don't be too proud of this technological terror you've constructed..." - Well, actually, be proud. It's fully automated.
