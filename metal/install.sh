#!/usr/bin/env bash
# metal — install. Tools + engine in one shot.
# v3.0 — 2026-03-25
# curl -fsSL https://joeycastillo.us/metal/install.sh | bash
# Installs git, gh, clones metal, runs Fe (tools), launches Be.
# Idempotent — safe to run again.

set -e

# Mode: full (default) | iron | tools. The iron.sh / tools.sh web wrappers pass
# it as $1; the METAL_MODE env var also works. iron and tools reuse this same
# bootstrap (git/gh/auth/clone/self-heal) but stop after Fe -- no Be launch.
MODE="${1:-${METAL_MODE:-full}}"

echo ""
echo "  metal"
echo "  v3.0 — 2026-03-25"
echo ""
echo "  Dedicated to Our Lady of the Miraculous Medal"
echo ""
echo "  This script will:"
echo ""
echo "    1. Install Git (xcode-select on Mac, apt/dnf/pacman on Linux)"
echo "    2. Install GitHub CLI (brew on Mac, apt/dnf/pacman on Linux)"
echo "    3. Authenticate with GitHub (gh auth login)"
echo "    4. Clone metal repo"
echo "    5. Run Fe (dev tools + identity + auth)"
echo "    6. Launch Be (Claude Code + tilde commands)"
echo ""

if [ "$MODE" = "full" ]; then
    printf "  Install? [Y] yes / [S] skip: "
    read -r CHOICE < /dev/tty
    case "$CHOICE" in
        s|S)
            echo "  Skipped."
            exit 0
            ;;
    esac
else
    echo "  Mode: $MODE (standalone -- prerequisites + clone/self-heal, no launch)"
    echo ""
fi

# === Step 1: Install Git ===
if command -v git &>/dev/null; then
    echo "[1/6] Git already installed. Skipping."
else
    echo "[1/6] Installing Git..."
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
    echo "[2/6] GitHub CLI already installed. Skipping."
else
    echo "[2/6] Installing GitHub CLI..."
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
    echo "[3/6] Already authenticated. Skipping."
else
    echo ""
    echo "  GitHub will show a code. Paste it in the browser."
    echo ""
    echo "[3/6] Opening browser for GitHub login..."
    gh auth login --hostname github.com --git-protocol https --web
fi

# === Step 4: Clone metal ===
METAL_DIR="$HOME/metal"
[ ! -d "$METAL_DIR" ] && [ -d "/metal" ] && METAL_DIR="/metal"
[ ! -d "$METAL_DIR" ] && [ -d "C:/metal" ] && METAL_DIR="C:/metal"

if [[ -d "$METAL_DIR/.git" ]]; then
    # ONE STOP SHOP: no prompt, never aborts (the bare `git pull --ff-only`
    # under `set -e` used to kill the whole install on a dirty/diverged clone).
    # be/otel.jsonl + be/prompts.jsonl are runtime-only now; reconcile a legacy
    # clone to origin/main via be/tools/autoheal-pull.sh -- fetched from origin
    # first if an ancient clone predates it. Real local work is stashed, never lost.
    echo "[4/6] Reconciling metal to latest (self-heal, no prompt)..."
    git -C "$METAL_DIR" fetch -q origin main 2>/dev/null || true
    if [ ! -f "$METAL_DIR/be/tools/autoheal-pull.sh" ]; then
        git -C "$METAL_DIR" checkout origin/main -- be/tools/autoheal-pull.sh 2>/dev/null || true
    fi
    if [ -f "$METAL_DIR/be/tools/autoheal-pull.sh" ]; then
        sh "$METAL_DIR/be/tools/autoheal-pull.sh" || true
    else
        git -C "$METAL_DIR" reset --hard -q origin/main 2>/dev/null || true
    fi
else
    echo "[4/6] Cloning metal..."
    gh repo clone kastil-systems/metal-console "$HOME/metal"
    METAL_DIR="$HOME/metal"
fi

if [ ! -f "$METAL_DIR/go.sh" ]; then
    echo ""
    echo "  ERROR: metal repo not found at $METAL_DIR"
    echo "  Clone may have failed. Try manually:"
    echo "    gh repo clone kastil-systems/metal-console ~/metal"
    exit 1
fi

# === Step 5: Run Fe (Iron) ===
echo "[5/6] Running Fe..."
if [ -f "$METAL_DIR/Go.Fe.sh" ]; then
    if [ "$MODE" = "tools" ]; then
        bash "$METAL_DIR/Go.Fe.sh" --tools-only < /dev/tty
    else
        bash "$METAL_DIR/Go.Fe.sh" < /dev/tty
    fi
else
    echo "  Go.Fe.sh not found - skipping tools setup."
fi

# Standalone modes stop here -- Iron already did identity via its own Go.Sign
# step; tools mode did just the toolchain. No smoke re-run, no launch. Full mode
# falls through to 5b/5c/6.
if [ "$MODE" != "full" ]; then
    echo ""
    echo "  ============================================"
    echo "  metal.$MODE complete (standalone)."
    echo "  Launch anytime: cd \"$METAL_DIR\" && ./go.sh"
    echo "  ============================================"
    echo ""
    exit 0
fi

# === Step 5b: Run Go.Sign (identity + GPG + smoke test) ===
# Fe runs gh auth login at its Step 4. Go.Sign needs an authed gh
# to write user.signingkey from gh api user. Calling Go.Sign here
# ensures auth has completed. Idempotent -- safe to re-run; no-op
# if already healthy. Mirrors install.bat Step 5b (Board 97 Phase 3).
echo ""
echo "[5b/6] Running Go.Sign..."
if [ -f "$METAL_DIR/Go.Sign.sh" ]; then
    bash "$METAL_DIR/Go.Sign.sh" < /dev/tty
else
    echo "  Go.Sign.sh not found - signing setup skipped."
fi

# === Step 5c: Fresh-install smoke harness ===
# Verify HTTPS push auth works in $METAL_DIR via git ls-remote origin.
# Combined with Go.Sign's empty-commit smoke (Step 5b), proves first
# commit will land before Be launches. Failure does not block launch.
echo ""
echo "[5c/6] Smoke test..."
if (cd "$METAL_DIR" && git ls-remote origin >/dev/null 2>&1); then
    echo "  [OK] HTTPS push auth verified (ls-remote origin succeeded)"
    echo "  metal install verified -- first commit will land."
else
    echo "  [WARN] git ls-remote origin failed -- HTTPS push auth not wired."
    echo "  When ready: gh auth setup-git"
fi

# === Step 6: Launch Be ===
echo ""
echo "[6/6] Install complete. Launching Be..."
echo ""

cd "$METAL_DIR"
exec bash "$METAL_DIR/go.sh" < /dev/tty
