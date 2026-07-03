#!/usr/bin/env bash
# metal.Fe -- Iron. Dev tools, identity, auth.
# v2.0 -- 2026-03-23
set -uo pipefail

VERSION="2.0"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Tools-only mode: dev toolchain only, no identity/auth.
#   Go.Fe.sh --tools-only   (the tools.sh runner passes this)
TOOLS_ONLY=0
case "${1:-}" in
    --tools-only|tools|-t) TOOLS_ONLY=1 ;;
esac

echo ""
echo "  ============================================"
echo "  metal.Fe -- Iron. Dev tools, identity, auth."
echo "  ============================================"
echo ""

# -- Helpers --------------------------------------

LOGDIR="$SCRIPT_DIR/logs"
mkdir -p "$LOGDIR"
LOGFILE="$LOGDIR/tools_$(date '+%Y%m%d_%H%M').log"
INSTALL_TIMEOUT="${INSTALL_TIMEOUT:-300}"
OK_COUNT=0
SKIP_COUNT=0
FAIL_COUNT=0
TIMEOUT_COUNT=0

if command -v timeout &>/dev/null; then
    TIMEOUT_CMD="timeout"
elif command -v gtimeout &>/dev/null; then
    TIMEOUT_CMD="gtimeout"
else
    TIMEOUT_CMD=""
fi

log() { echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*" >> "$LOGFILE"; }

run_install() {
    local label="$1"; shift
    log "START $label"
    log "CMD: $*"
    echo "  Installing $label..."
    local ec=0
    if [[ -n "$TIMEOUT_CMD" ]]; then
        $TIMEOUT_CMD "$INSTALL_TIMEOUT" "$@" >> "$LOGFILE" 2>&1; ec=$?
    else
        "$@" >> "$LOGFILE" 2>&1; ec=$?
    fi
    if [[ $ec -eq 124 ]]; then
        log "TIMEOUT $label -- exceeded ${INSTALL_TIMEOUT}s"
        echo "  [TIMEOUT] $label -- exceeded ${INSTALL_TIMEOUT}s"
        ((TIMEOUT_COUNT++)); return 1
    elif [[ $ec -ne 0 ]]; then
        log "FAIL $label -- exit code $ec"
        echo "  [FAIL] $label -- exit $ec -- see $LOGFILE"
        ((FAIL_COUNT++)); return 1
    else
        log "OK $label"
        echo "  [OK] $label"
        ((OK_COUNT++)); return 0
    fi
}

install_pkg() {
    local name="$1"; shift
    if command -v "$name" &>/dev/null; then
        log "SKIP $name -- already installed"
        echo "  $name: already installed. Skipping."
        ((SKIP_COUNT++)); return 0
    fi
    if [[ "$OSTYPE" == "darwin"* ]]; then
        run_install "$name" brew install "$@"
    elif command -v apt-get &>/dev/null; then
        run_install "$name" sudo apt-get install -y "$@"
    elif command -v dnf &>/dev/null; then
        run_install "$name" sudo dnf install -y "$@"
    elif command -v pacman &>/dev/null; then
        run_install "$name" sudo pacman -S --noconfirm "$@"
    else
        log "ERROR $name -- no package manager found"
        echo "  ERROR: No package manager found. Install $name manually."
        ((FAIL_COUNT++)); return 1
    fi
}

# -- Step 1: Dev tools --
METAL_STATE="$HOME/.metal"
mkdir -p "$METAL_STATE"
TOOLS_DONE="$METAL_STATE/.tools-done"
TOOLS_CURRENT=0
if [ -f "$TOOLS_DONE" ]; then
    TOOLS_VER="$(cat "$TOOLS_DONE" | tr -d '[:space:]')"
    if [ "$TOOLS_VER" = "$VERSION" ]; then
        TOOLS_CURRENT=1
    fi
fi

if [ "$TOOLS_CURRENT" = "1" ]; then
    echo "[Fe 1/3] Dev tools already installed (v${VERSION}). Skipping."
else
    if [ -f "$TOOLS_DONE" ]; then
        echo "[Fe 1/3] Dev tools installed for older version. Updating..."
    fi
    echo ""
    echo "-- Fe STEP 1: Dev Tools --"
    echo "Git, GCC, Python, Node, Rust, gh, gcloud, Claude, Wrangler, Snowflake."
    echo ""
    read -r -p "Install dev tools? [Y/N]: " TOOLS_ANSWER < /dev/tty
    case "$TOOLS_ANSWER" in
    [nN]) echo "  No. Skipping dev tools." ;;
    *)
        log "metal tools install started"
        log "Timeout: ${INSTALL_TIMEOUT}s | Command: ${TIMEOUT_CMD:-none}"

        # -- Core dev tools --
        echo "[1/3] Core dev tools..."

        if [[ "$OSTYPE" == "darwin"* ]]; then
            if ! xcode-select -p &>/dev/null; then
                echo "  Installing Xcode Command Line Tools..."
                xcode-select --install 2>/dev/null || true
                echo "  A system dialog should appear. Click Install and wait."
                echo "  After install completes, run this script again."
                exit 0
            else
                log "SKIP Xcode CLI Tools -- already installed"
                echo "  Xcode CLI Tools: already installed. Skipping."
                ((SKIP_COUNT++))
            fi
            if ! command -v brew &>/dev/null; then
                run_install "Homebrew" bash -c 'NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
                eval "$(/opt/homebrew/bin/brew shellenv 2>/dev/null || /usr/local/bin/brew shellenv 2>/dev/null)"
            else
                log "SKIP Homebrew -- already installed"
                echo "  Homebrew: already installed. Skipping."
                ((SKIP_COUNT++))
            fi
        fi

        if [[ "$OSTYPE" == "linux"* ]]; then
            if ! command -v gcc &>/dev/null; then
                if command -v apt-get &>/dev/null; then
                    run_install "build-essential" bash -c 'sudo apt-get update -qq && sudo apt-get install -y build-essential'
                elif command -v dnf &>/dev/null; then
                    run_install "Development Tools" sudo dnf groupinstall -y "Development Tools"
                elif command -v pacman &>/dev/null; then
                    run_install "base-devel" sudo pacman -S --noconfirm base-devel
                fi
            else
                log "SKIP GCC -- already installed"
                echo "  GCC: already installed. Skipping."
                ((SKIP_COUNT++))
            fi
        fi

        install_pkg git git
        install_pkg gh gh
        install_pkg python3 python3
        install_pkg node nodejs
        install_pkg make make

        if command -v rustup &>/dev/null; then
            log "SKIP Rust -- already installed"
            echo "  Rust: already installed. Skipping."
            ((SKIP_COUNT++))
        else
            run_install "Rust" bash -c 'curl --proto "=https" --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y'
            source "$HOME/.cargo/env" 2>/dev/null || true
        fi

        if command -v gcloud &>/dev/null; then
            log "SKIP Google Cloud CLI -- already installed"
            echo "  Google Cloud CLI: already installed. Skipping."
            ((SKIP_COUNT++))
        else
            if [[ "$OSTYPE" == "darwin"* ]]; then
                run_install "Google Cloud CLI" brew install --cask google-cloud-sdk
            elif command -v apt-get &>/dev/null; then
                run_install "Google Cloud CLI" bash -c 'echo "deb [signed-by=/usr/share/keyrings/cloud.google.asc] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee /etc/apt/sources.list.d/google-cloud-sdk.list && curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo tee /usr/share/keyrings/cloud.google.asc >/dev/null && sudo apt-get update -qq && sudo apt-get install -y google-cloud-cli'
            elif command -v dnf &>/dev/null; then
                run_install "Google Cloud CLI" sudo dnf install -y google-cloud-cli
            elif command -v pacman &>/dev/null; then
                echo "  Install gcloud manually: https://cloud.google.com/sdk/docs/install"
            fi
        fi

        echo "  Done."

        # -- CLI tools (npm, pip) --
        echo "[2/3] CLI tools (npm, pip)..."

        if command -v claude &>/dev/null; then
            log "SKIP Claude Code -- already installed"
            echo "  Claude Code: already installed. Skipping."
            ((SKIP_COUNT++))
        else
            run_install "Claude Code" npm install -g @anthropic-ai/claude-code
        fi

        if command -v wrangler &>/dev/null; then
            log "SKIP Wrangler -- already installed"
            echo "  Wrangler: already installed. Skipping."
            ((SKIP_COUNT++))
        else
            run_install "Wrangler" npm install -g wrangler
        fi

        if command -v snow &>/dev/null; then
            log "SKIP Snowflake CLI -- already installed"
            echo "  Snowflake CLI: already installed. Skipping."
            ((SKIP_COUNT++))
        else
            run_install "Snowflake CLI" bash -c 'pip3 install snowflake-cli-labs || python3 -m pip install snowflake-cli-labs'
        fi

        echo "  Done."

        # -- Browsers --
        echo "[3/3] Browsers..."

        if [[ "$OSTYPE" == "darwin"* ]]; then
            for app in "google-chrome:Google Chrome" "firefox:Firefox" "brave-browser:Brave Browser" "opera:Opera"; do
                cask="${app%%:*}"
                name="${app##*:}"
                if [ -d "/Applications/$name.app" ]; then
                    log "SKIP $name -- already installed"
                    echo "  $name: already installed. Skipping."
                    ((SKIP_COUNT++))
                else
                    run_install "$name" brew install --cask "$cask"
                fi
            done
        elif [[ "$OSTYPE" == "linux"* ]]; then
            echo "  Linux browser install varies by distro -- install Chrome, Brave, Opera manually."
            install_pkg firefox firefox || true
        fi

        echo "  Done."

        # -- Tools summary --
        log "SUMMARY: $OK_COUNT installed, $SKIP_COUNT skipped, $FAIL_COUNT failed, $TIMEOUT_COUNT timed out"
        echo ""
        echo "  Results: $OK_COUNT installed, $SKIP_COUNT skipped, $FAIL_COUNT failed, $TIMEOUT_COUNT timed out"
        if [[ $FAIL_COUNT -gt 0 || $TIMEOUT_COUNT -gt 0 ]]; then
            echo "  Check log: $LOGFILE"
        fi

        echo "$VERSION" > "$TOOLS_DONE"
        ;;
    esac
fi

# -- Tools-only stop point --
# The tools.* runners want the dev toolchain only -- no identity, MCP, or auth.
if [ "$TOOLS_ONLY" = "1" ]; then
    echo ""
    echo "  ============================================"
    echo "  metal.Fe -- Tools only. Toolchain ready."
    echo "  (identity/auth skipped -- run iron for the full setup)"
    echo "  ============================================"
    echo ""
    exit 0
fi

# -- Step 2: Identity + memory --
# Per-machine identity is delegated to Go.Sign.sh -- it reads from
# gh api user, finds or generates a GPG key, and writes user.name /
# user.email / user.signingkey / gpg.program via git config --global.
# No more shipped .gitconfig with hardcoded values; no more sed-fix
# of Windows-shaped GPG paths. Mirrors Go.Fe.ps1 Step 2 (Board 97).
echo "[Fe 2/4] Syncing identity + memory..."
SIGN_SCRIPT="$SCRIPT_DIR/Go.Sign.sh"
if [ -f "$SIGN_SCRIPT" ]; then
    bash "$SIGN_SCRIPT"
    SIGN_EXIT=$?
    if [ "$SIGN_EXIT" -ne 0 ]; then
        echo "  [WARN] Go.Sign returned $SIGN_EXIT -- identity may be incomplete."
    fi
else
    echo "  [WARN] Go.Sign.sh not found at $SIGN_SCRIPT -- skipping identity setup."
fi
mkdir -p "$HOME/.claude"
cp "$SCRIPT_DIR/claude/settings.json" "$HOME/.claude/settings.json" 2>/dev/null
cp "$SCRIPT_DIR/claude/settings.local.json" "$HOME/.claude/settings.local.json" 2>/dev/null
echo "  Claude settings installed"

# -- Step 3: MCP -- metal does NOT install or support MCP servers.
# NUCLEAR by default, but RESPECTFUL: any server named in ~/.metal-mcp-ignore is
# KEPT (one name per line, # for comments), and ~/.claude.json is backed up first
# so a removal is always recoverable. metal ADDS zero MCP; it only clears them.
if command -v claude &>/dev/null; then
    echo "[Fe 3/4] MCP -- removing servers (keeping any listed in ~/.metal-mcp-ignore)..."
    # Back up the live config so nothing is ever lost unrecoverably.
    [ -f "$HOME/.claude.json" ] && cp "$HOME/.claude.json" "$HOME/.claude.json.metal-mcp-backup" 2>/dev/null
    # Load the keep-list (names metal must NOT remove).
    keep=""
    if [ -f "$HOME/.metal-mcp-ignore" ]; then
        keep=$(grep -vE '^[[:space:]]*#' "$HOME/.metal-mcp-ignore" 2>/dev/null | tr -d '\r' | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')
    fi
    removed=0; kept=0
    while IFS= read -r line; do
        tok="${line%%[[:space:]]*}"
        name="${tok%:}"
        [ -n "$name" ] || continue
        case "$name" in http*|https*|Checking|No|MCP|Name) continue ;; esac
        if printf '%s\n' "$keep" | grep -qxF "$name"; then
            echo "  Kept MCP (in ~/.metal-mcp-ignore): $name"; kept=$((kept + 1)); continue
        fi
        claude mcp remove "$name" >/dev/null 2>&1
        claude mcp remove --scope user "$name" >/dev/null 2>&1
        echo "  Removed MCP: $name"
        removed=$((removed + 1))
    done < <(claude mcp list 2>/dev/null)
    [ "$removed" = "0" ] && [ "$kept" = "0" ] && echo "  No MCP servers found."
    [ "$removed" != "0" ] && echo "  (backup: ~/.claude.json.metal-mcp-backup)"
    echo "  metal uses no MCP servers (kept: $kept)."
else
    echo "[Fe 3/4] Claude Code not found -- nothing to do (metal uses no MCP)."
fi

# -- Step 4: Auth --
echo ""
echo "-- Fe STEP 4: Authentication --"
echo ""

if gh auth status &>/dev/null; then
    echo "[Fe 4/4] GitHub: already authenticated."
else
    echo "Logging into GitHub..."
    gh auth login < /dev/tty
fi

echo ""
if gcloud auth print-access-token &>/dev/null 2>&1; then
    echo "[Fe 4/4] Google Cloud: already authenticated."
else
    echo "Logging into Google Cloud..."
    gcloud auth login < /dev/tty || true
fi

echo ""
echo "  ============================================"
echo "  metal.Fe -- Iron complete."
echo "  ============================================"
echo ""
