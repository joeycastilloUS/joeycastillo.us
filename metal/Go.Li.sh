#!/usr/bin/env bash
# metal.Li — Lithium. OS diet.
# v1.9 — 2026-03-23
# curl -fsSL https://joeycastillo.us/metal/Go.Li.sh | bash
# Apply all at once or choose step by step.
# Mac and Linux. Idempotent — safe to run again.

echo ""
echo "  metal.Li — Lithium. OS diet."
echo "  v1.9 — 2026-03-23"
echo "  Strip the fat. Dark mode. Full power."
echo ""

PICK=0

ask() {
    if [ "$PICK" = "0" ]; then return 0; fi
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
    echo "  9 steps:"
    echo ""
    echo "   1. Dark mode          (system-wide)"
    echo "   2. Dock               (auto-hide, small, left, no recents)"
    echo "   3. Finder             (show hidden, extensions, path bar)"
    echo "   4. Keyboard           (max repeat, no press-and-hold)"
    echo "   5. Keyboard remap     (Win→Ctrl, Alt→Cmd for Windows keyboards)"
    echo "   6. Trackpad           (tap to click)"
    echo "   7. Screenshots        (no shadow, PNG)"
    echo "   8. Privacy            (kill Siri, auto-update on)"
    echo "   9. Power              (never sleep on AC)"
    echo ""
    printf "  Apply all? [A] all / [P] pick one by one / [S] skip: " >/dev/tty
    read -r MODE < /dev/tty 2>/dev/null || MODE="a"
    case "$MODE" in
    [pP]) PICK=1 ;;
    [sS])
        echo ""
        echo "  Skipped."
        APPLIED=0
        ;;
    esac

    if [ "$MODE" != "s" ] && [ "$MODE" != "S" ]; then

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

    fi  # end of "not skip" guard

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
        echo "  4 steps:"
        echo ""
        echo "   1. Dark mode       (GNOME dark theme)"
        echo "   2. Keyboard        (fast repeat)"
        echo "   3. File manager    (show hidden)"
        echo "   4. Power           (never sleep on AC)"
        echo ""
        printf "  Apply all? [A] all / [P] pick one by one / [S] skip: " >/dev/tty
        read -r MODE < /dev/tty 2>/dev/null || MODE="a"
        case "$MODE" in
        [pP]) PICK=1 ;;
        [sS])
            echo ""
            echo "  Skipped."
            ;;
        esac

        if [ "$MODE" != "s" ] && [ "$MODE" != "S" ]; then

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

        fi  # end of "not skip" guard
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

# ── Launch metal.Be? ──
echo "  Launch metal.Be (Claude Code with tilde commands)?"
printf "  [Y/n]: " >/dev/tty
read -r LAUNCH < /dev/tty 2>/dev/null || LAUNCH="y"
case "$LAUNCH" in
[nN])
    echo "  See you next time."
    ;;
*)
    METAL_BE="$HOME/metal.Be"
    [ ! -d "$METAL_BE" ] && [ -d "/metal.Be" ] && METAL_BE="/metal.Be"

    if [ ! -d "$METAL_BE" ]; then
        echo "  Cloning metal.Be..."
        if command -v gh &>/dev/null; then
            gh repo clone joeycastilloUS/metal.Be "$HOME/metal.Be"
        else
            git clone https://github.com/joeycastilloUS/metal.Be.git "$HOME/metal.Be"
        fi
        METAL_BE="$HOME/metal.Be"
    fi

    if [ -f "$METAL_BE/Go.Be.sh" ]; then
        exec bash "$METAL_BE/Go.Be.sh"
    else
        echo "  [ERROR] Go.Be.sh not found at $METAL_BE"
    fi
    ;;
esac
