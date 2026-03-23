#!/usr/bin/env bash
# metal.Li — Lithium. OS diet.
# v1.6.1 — 2026-03-23
# curl -fsSL https://joeycastillo.us/metal/Go.Li.sh | bash
# Strips bloat, dark mode, privacy, power. No dev tools.
# Mac and Linux. Idempotent — safe to run again.

set -e

echo ""
echo "  metal.Li — Lithium. OS diet."
echo "  v1.6.1 — 2026-03-23"
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

    # ── 4/9: Keyboard — fast repeat ──
    echo "[4/9] Keyboard — max repeat rate..."
    defaults write NSGlobalDomain KeyRepeat -int 2
    defaults write NSGlobalDomain InitialKeyRepeat -int 15
    defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
    echo "  Done."

    # ── 5/9: Windows keyboard remap for Mac ──
    echo "[5/9] Windows keyboard remap..."
    # Physical Ctrl → stays Control (Ctrl+C interrupts in terminal/Claude)
    # Physical Win  → Control      (no more "start button", acts as Ctrl)
    # Physical Alt  → Command      (Alt+C=copy, Alt+V=paste, Alt+Tab=switch)
    # Result: Ctrl works in terminal. Alt does Mac GUI shortcuts. Win = bonus Ctrl.
    hidutil property --set '{"UserKeyMapping":[
        {"HIDKeyboardModifierMappingSrc":0x700000E3,"HIDKeyboardModifierMappingDst":0x700000E0},
        {"HIDKeyboardModifierMappingSrc":0x700000E2,"HIDKeyboardModifierMappingDst":0x700000E3},
        {"HIDKeyboardModifierMappingSrc":0x700000E7,"HIDKeyboardModifierMappingDst":0x700000E4},
        {"HIDKeyboardModifierMappingSrc":0x700000E6,"HIDKeyboardModifierMappingDst":0x700000E7}
    ]}' >/dev/null 2>&1 || true

    # Persist across reboots via LaunchAgent
    PLIST_DIR="$HOME/Library/LaunchAgents"
    PLIST_PATH="$PLIST_DIR/local.metalKeyRemap.plist"
    mkdir -p "$PLIST_DIR"
    cat > "$PLIST_PATH" << 'PLISTEOF'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>Label</key>
  <string>local.metalKeyRemap</string>
  <key>ProgramArguments</key>
  <array>
    <string>/usr/bin/hidutil</string>
    <string>property</string>
    <string>--set</string>
    <string>{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x700000E3,"HIDKeyboardModifierMappingDst":0x700000E0},{"HIDKeyboardModifierMappingSrc":0x700000E2,"HIDKeyboardModifierMappingDst":0x700000E3},{"HIDKeyboardModifierMappingSrc":0x700000E7,"HIDKeyboardModifierMappingDst":0x700000E4},{"HIDKeyboardModifierMappingSrc":0x700000E6,"HIDKeyboardModifierMappingDst":0x700000E7}]}</string>
  </array>
  <key>RunAtLoad</key>
  <true/>
</dict>
</plist>
PLISTEOF
    launchctl unload "$PLIST_PATH" 2>/dev/null || true
    launchctl load "$PLIST_PATH" 2>/dev/null || true
    echo "  Win → Ctrl, Alt → Cmd. Ctrl stays Ctrl."
    echo "  Ctrl+C works in Claude. Alt+C/V copies/pastes. Alt+Tab switches apps."
    echo "  Persists across reboots."
    echo "  Done."

    # ── 6/9: Trackpad — tap to click ──
    echo "[6/9] Trackpad..."
    defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
    defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
    defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
    echo "  Done."

    # ── 7/9: Screenshots — no shadow, PNG, to Desktop ──
    echo "[7/9] Screenshots..."
    defaults write com.apple.screencapture disable-shadow -bool true
    defaults write com.apple.screencapture type -string "png"
    echo "  Done."

    # ── 8/9: Privacy — minimal analytics ──
    echo "[8/9] Privacy..."
    defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true
    defaults write com.apple.SoftwareUpdate AutomaticDownload -bool true
    defaults write com.apple.commerce AutoUpdate -bool true
    # Disable Siri
    defaults write com.apple.assistant.support "Assistant Enabled" -bool false 2>/dev/null || true
    launchctl disable "user/$(id -u)/com.apple.Siri.agent" 2>/dev/null || true
    echo "  Done."

    # ── 9/9: Power — prevent sleep on AC ──
    echo "[9/9] Power..."
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
