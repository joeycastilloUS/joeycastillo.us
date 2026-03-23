#!/usr/bin/env bash
# metal.Fe — Iron. The foundation.
# v1.6.1 — 2026-03-23
# curl -fsSL https://joeycastillo.us/metal/Go.Fe.sh | bash
# Installs git, gh, clones metal, runs full toolchain + identity + auth.
# Idempotent — safe to run again.

set -e

echo ""
echo "  metal.Fe — Iron. The foundation."
echo "  v1.6.1 — 2026-03-23"
echo "  Full dev toolchain. One command."
echo ""

# === Step 1: Install Git ===
if command -v git &>/dev/null; then
    echo "[1/5] Git already installed. Skipping."
else
    echo "[1/5] Installing Git..."
    if [[ "$OSTYPE" == "darwin"* ]]; then
        xcode-select --install 2>/dev/null || true
        echo "      Xcode CLI Tools dialog should appear. Click Install and wait."
        echo "      After install completes, run this script again."
        exit 0
    elif command -v apt-get &>/dev/null; then
        sudo apt-get update -qq && sudo apt-get install -y git
    elif command -v dnf &>/dev/null; then
        sudo dnf install -y git
    elif command -v pacman &>/dev/null; then
        sudo pacman -S --noconfirm git
    else
        echo "ERROR: No package manager found. Install git manually."
        exit 1
    fi
fi

# === Step 2: Install GitHub CLI ===
if command -v gh &>/dev/null; then
    echo "[2/5] GitHub CLI already installed. Skipping."
else
    echo "[2/5] Installing GitHub CLI..."
    if [[ "$OSTYPE" == "darwin"* ]]; then
        if ! command -v brew &>/dev/null; then
            echo "      Installing Homebrew first..."
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
            eval "$(/opt/homebrew/bin/brew shellenv 2>/dev/null || /usr/local/bin/brew shellenv 2>/dev/null)"
        fi
        brew install gh
    elif command -v apt-get &>/dev/null; then
        (type -p wget >/dev/null || sudo apt-get install -y wget) \
            && sudo mkdir -p -m 755 /etc/apt/keyrings \
            && out=$(mktemp) && wget -nv -O"$out" https://cli.github.com/packages/githubcli-archive-keyring.gpg \
            && cat "$out" | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
            && sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
            && echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
            && sudo apt-get update -qq && sudo apt-get install -y gh
    elif command -v dnf &>/dev/null; then
        sudo dnf install -y 'dnf-command(config-manager)' && sudo dnf config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo && sudo dnf install -y gh
    elif command -v pacman &>/dev/null; then
        sudo pacman -S --noconfirm github-cli
    else
        echo "ERROR: No package manager found. Install gh manually: https://cli.github.com"
        exit 1
    fi
fi

# === Step 3: Authenticate ===
if gh auth status &>/dev/null; then
    echo "[3/5] Already authenticated. Skipping."
else
    echo ""
    echo "  GitHub will show a code. Paste it in the browser."
    echo ""
    echo "[3/5] Opening browser for GitHub login..."
    gh auth login --hostname github.com --git-protocol https --web
fi

# === Step 4: Clone or update metal ===
METAL_DIR="$HOME/metal"
if [[ -d "$METAL_DIR/.git" ]]; then
    echo "[4/5] Pulling latest metal..."
    git -C "$METAL_DIR" pull --ff-only
else
    echo "[4/5] Cloning metal..."
    gh repo clone joeycastilloUS/metal "$METAL_DIR"
fi

# === Step 5: Run full toolchain ===
echo ""
echo "[5/5] Launching metal.Fe..."
cd "$METAL_DIR"
bash go-runtime.sh < /dev/tty
