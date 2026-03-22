#!/usr/bin/env bash
# metal.Li — Lithium. OS diet.
# curl -fsSL https://joeycastillo.us/metal/Go.Li.sh | bash
# Strips bloat, dark mode, privacy, power. No dev tools.
# Mac and Linux. Idempotent — safe to run again.

set -e

echo ""
echo "  metal.Li — Lithium. OS diet."
echo "  Strip the fat. Dark mode. Full power."
echo ""

if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "  macOS detected. Applying diet..."
    echo ""

    # ── 1/8: Dark mode ──
    echo "[1/8] Dark mode..."
    osascript -e 'tell app "System Events" to tell appearance preferences to set dark mode to true' 2>/dev/null || true
    echo "  Done."

    # ── 2/8: Dock — clean, fast, left ──
    echo "[2/8] Dock preferences..."
    defaults write com.apple.dock autohide -bool true
    defaults write com.apple.dock autohide-delay -float 0
    defaults write com.apple.dock autohide-time-modifier -float 0.3
    defaults write com.apple.dock tilesize -int 36
    defaults write com.apple.dock show-recents -bool false
    defaults write com.apple.dock minimize-to-application -bool true
    defaults write com.apple.dock orientation -string "left"
    echo "  Done."

    # ── 3/8: Finder preferences ──
    echo "[3/8] Finder preferences..."
    defaults write com.apple.finder AppleShowAllFiles -bool true
    defaults write NSGlobalDomain AppleShowAllExtensions -bool true
    defaults write com.apple.finder ShowPathbar -bool true
    defaults write com.apple.finder ShowStatusBar -bool true
    defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
    defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
    defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
    echo "  Done."

    # ── 4/8: Keyboard — fast repeat ──
    echo "[4/8] Keyboard — max repeat rate..."
    defaults write NSGlobalDomain KeyRepeat -int 2
    defaults write NSGlobalDomain InitialKeyRepeat -int 15
    defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
    echo "  Done."

    # ── 5/8: Trackpad — tap to click ──
    echo "[5/8] Trackpad..."
    defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
    defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
    defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
    echo "  Done."

    # ── 6/8: Screenshots — no shadow, PNG, to Desktop ──
    echo "[6/8] Screenshots..."
    defaults write com.apple.screencapture disable-shadow -bool true
    defaults write com.apple.screencapture type -string "png"
    echo "  Done."

    # ── 7/8: Privacy — minimal analytics ──
    echo "[7/8] Privacy..."
    defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true
    defaults write com.apple.SoftwareUpdate AutomaticDownload -bool true
    defaults write com.apple.commerce AutoUpdate -bool true
    # Disable Siri
    defaults write com.apple.assistant.support "Assistant Enabled" -bool false 2>/dev/null || true
    launchctl disable "user/$(id -u)/com.apple.Siri.agent" 2>/dev/null || true
    echo "  Done."

    # ── 8/8: Power — prevent sleep on AC ──
    echo "[8/8] Power..."
    sudo pmset -c displaysleep 30 2>/dev/null || true
    sudo pmset -c sleep 0 2>/dev/null || true
    sudo pmset -b displaysleep 5 2>/dev/null || true
    sudo pmset -b sleep 15 2>/dev/null || true
    echo "  Done."

    # Restart affected apps
    echo ""
    echo "  Restarting Finder and Dock..."
    killall Finder 2>/dev/null || true
    killall Dock 2>/dev/null || true

elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo "  Linux detected. Applying diet..."
    echo ""

    # GNOME desktop
    if command -v gsettings &>/dev/null; then
        echo "[1/4] Dark mode..."
        gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark' 2>/dev/null || true
        gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark' 2>/dev/null || true
        echo "  Done."

        echo "[2/4] Keyboard — fast repeat..."
        gsettings set org.gnome.desktop.peripherals.keyboard delay 200 2>/dev/null || true
        gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 25 2>/dev/null || true
        echo "  Done."

        echo "[3/4] File manager — show hidden..."
        gsettings set org.gnome.nautilus.preferences show-hidden-files true 2>/dev/null || true
        echo "  Done."

        echo "[4/4] Power..."
        gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing' 2>/dev/null || true
        gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-timeout 900 2>/dev/null || true
        echo "  Done."
    else
        echo "  No GNOME detected. Skipping desktop preferences."
        echo "  (KDE/XFCE/i3 users: configure manually)"
    fi
else
    echo "  Unknown OS: $OSTYPE"
    exit 1
fi

echo ""
echo "  ============================================"
echo "  metal.Li — diet complete."
echo "  Log out and back in for all changes."
echo "  ============================================"
echo ""
