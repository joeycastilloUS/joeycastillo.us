#!/usr/bin/env bash
# metal.Li — Lithium. OS diet.
# v1.5.2 — 2026-03-23
# curl -fsSL https://joeycastillo.us/metal/Go.Li.sh | bash
# Each step is optional — you choose what to apply.
# Mac and Linux. Idempotent — safe to run again.

echo ""
echo "  metal.Li — Lithium. OS diet."
echo "  v1.5.2 — 2026-03-23"
echo "  Strip the fat. Dark mode. Full power."
echo "  Each step is optional. Safe to run on any machine."
echo ""

ask() {
    local prompt="$1"
    local answer
    printf "       Apply? [Y/n]: " >/dev/tty
    read -r answer < /dev/tty 2>/dev/null || answer="y"
    case "$answer" in
    [nN]) return 1 ;;
    *) return 0 ;;
    esac
}

APPLIED=0

if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "  macOS detected."
    echo ""

    # ── 1/9: Dark mode ──
    echo "[1/9] Dark mode"
    echo "       System-wide dark appearance."
    if ask; then
        osascript -e 'tell app "System Events" to tell appearance preferences to set dark mode to true' 2>/dev/null || true
        echo "       Done."
        APPLIED=1
    else
        echo "       Skipped."
    fi
    echo ""

    # ── 2/9: Dock ──
    echo "[2/9] Dock — clean, fast, left"
    echo "       Auto-hide, no recents, small icons, left side."
    if ask; then
        defaults write com.apple.dock autohide -bool true
        defaults write com.apple.dock autohide-delay -float 0
        defaults write com.apple.dock autohide-time-modifier -float 0.3
        defaults write com.apple.dock tilesize -int 36
        defaults write com.apple.dock show-recents -bool false
        defaults write com.apple.dock minimize-to-application -bool true
        defaults write com.apple.dock orientation -string "left"
        echo "       Done."
        APPLIED=1
    else
        echo "       Skipped."
    fi
    echo ""

    # ── 3/9: Finder ──
    echo "[3/9] Finder preferences"
    echo "       Show hidden files, extensions, path bar, status bar."
    if ask; then
        defaults write com.apple.finder AppleShowAllFiles -bool true
        defaults write NSGlobalDomain AppleShowAllExtensions -bool true
        defaults write com.apple.finder ShowPathbar -bool true
        defaults write com.apple.finder ShowStatusBar -bool true
        defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
        defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
        defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
        echo "       Done."
        APPLIED=1
    else
        echo "       Skipped."
    fi
    echo ""

    # ── 4/9: Keyboard ──
    echo "[4/9] Keyboard — max repeat rate"
    echo "       Fastest repeat, short delay, no press-and-hold."
    if ask; then
        defaults write NSGlobalDomain KeyRepeat -int 2
        defaults write NSGlobalDomain InitialKeyRepeat -int 15
        defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
        echo "       Done."
        APPLIED=1
    else
        echo "       Skipped."
    fi
    echo ""

    # ── 5/9: Windows keyboard remap ──
    echo "[5/9] Windows keyboard remap for Mac"
    echo "       Win→Ctrl, Alt→Cmd. Ctrl stays Ctrl."
    echo "       Ctrl+C works in terminal. Alt+C/V copies/pastes."
    if ask; then
        hidutil property --set '{"UserKeyMapping":[
            {"HIDKeyboardModifierMappingSrc":0x700000E3,"HIDKeyboardModifierMappingDst":0x700000E0},
            {"HIDKeyboardModifierMappingSrc":0x700000E2,"HIDKeyboardModifierMappingDst":0x700000E3},
            {"HIDKeyboardModifierMappingSrc":0x700000E7,"HIDKeyboardModifierMappingDst":0x700000E4},
            {"HIDKeyboardModifierMappingSrc":0x700000E6,"HIDKeyboardModifierMappingDst":0x700000E7}
        ]}' >/dev/null 2>&1 || true
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
        echo "       Persists across reboots."
        echo "       Done."
        APPLIED=1
    else
        echo "       Skipped."
    fi
    echo ""

    # ── 6/9: Trackpad ──
    echo "[6/9] Trackpad — tap to click"
    echo "       Enable tap to click on trackpad."
    if ask; then
        defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
        defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
        defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
        echo "       Done."
        APPLIED=1
    else
        echo "       Skipped."
    fi
    echo ""

    # ── 7/9: Screenshots ──
    echo "[7/9] Screenshots"
    echo "       No shadow, PNG format."
    if ask; then
        defaults write com.apple.screencapture disable-shadow -bool true
        defaults write com.apple.screencapture type -string "png"
        echo "       Done."
        APPLIED=1
    else
        echo "       Skipped."
    fi
    echo ""

    # ── 8/9: Privacy ──
    echo "[8/9] Privacy — disable Siri, auto-update on"
    echo "       Kill Siri, enable automatic updates."
    if ask; then
        defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true
        defaults write com.apple.SoftwareUpdate AutomaticDownload -bool true
        defaults write com.apple.commerce AutoUpdate -bool true
        defaults write com.apple.assistant.support "Assistant Enabled" -bool false 2>/dev/null || true
        launchctl disable "user/$(id -u)/com.apple.Siri.agent" 2>/dev/null || true
        echo "       Done."
        APPLIED=1
    else
        echo "       Skipped."
    fi
    echo ""

    # ── 9/9: Power ──
    echo "[9/9] Power — prevent sleep on AC"
    echo "       Never sleep on AC, 15min on battery."
    if ask; then
        sudo pmset -c displaysleep 30 2>/dev/null || true
        sudo pmset -c sleep 0 2>/dev/null || true
        sudo pmset -b displaysleep 5 2>/dev/null || true
        sudo pmset -b sleep 15 2>/dev/null || true
        echo "       Done."
        APPLIED=1
    else
        echo "       Skipped."
    fi

    if [ "$APPLIED" = "1" ]; then
        echo ""
        echo "  Restarting Finder and Dock..."
        killall Finder 2>/dev/null || true
        killall Dock 2>/dev/null || true
    fi

elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo "  Linux detected."
    echo ""

    if command -v gsettings &>/dev/null; then
        echo "[1/4] Dark mode"
        echo "       GNOME dark theme."
        if ask; then
            gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark' 2>/dev/null || true
            gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark' 2>/dev/null || true
            echo "       Done."
        else
            echo "       Skipped."
        fi
        echo ""

        echo "[2/4] Keyboard — fast repeat"
        echo "       200ms delay, 25ms repeat."
        if ask; then
            gsettings set org.gnome.desktop.peripherals.keyboard delay 200 2>/dev/null || true
            gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 25 2>/dev/null || true
            echo "       Done."
        else
            echo "       Skipped."
        fi
        echo ""

        echo "[3/4] File manager — show hidden"
        echo "       Show hidden files in Nautilus."
        if ask; then
            gsettings set org.gnome.nautilus.preferences show-hidden-files true 2>/dev/null || true
            echo "       Done."
        else
            echo "       Skipped."
        fi
        echo ""

        echo "[4/4] Power"
        echo "       Never sleep on AC, 15min on battery."
        if ask; then
            gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing' 2>/dev/null || true
            gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-timeout 900 2>/dev/null || true
            echo "       Done."
        else
            echo "       Skipped."
        fi
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
