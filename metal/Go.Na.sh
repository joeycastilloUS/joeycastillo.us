#!/usr/bin/env bash
# metal.Na — Sodium. The reset.
# v1.8.1 — 2026-03-23
# curl -fsSL https://joeycastillo.us/metal/Go.Na.sh | bash
# Removes metal repos so you can test a fresh install.
# Leaves tools and OS changes in place.

echo ""
echo "  metal.Na — Sodium. The reset."
echo "  v1.8.1 — 2026-03-23"
echo "  Explodes on contact. Clean slate."
echo ""
echo "  This will remove:"
echo ""

METAL_DIR="$HOME/metal"
[ ! -d "$METAL_DIR" ] && [ -d "/metal" ] && METAL_DIR="/metal"
[ ! -d "$METAL_DIR" ] && [ -d "C:/metal" ] && METAL_DIR="C:/metal"

METAL_BE="$HOME/metal.Be"
[ ! -d "$METAL_BE" ] && [ -d "/metal.Be" ] && METAL_BE="/metal.Be"
[ ! -d "$METAL_BE" ] && [ -d "C:/metal.Be" ] && METAL_BE="C:/metal.Be"

if [ -d "$METAL_DIR" ]; then
    echo "    $METAL_DIR"
else
    echo "    ~/metal                  [not found]"
fi
if [ -d "$METAL_BE" ]; then
    echo "    $METAL_BE"
else
    echo "    ~/metal.Be               [not found]"
fi

echo ""
echo "  Tools and OS changes will NOT be touched."
echo ""
printf "  Proceed? [y/N]: " >/dev/tty
read -r CONFIRM < /dev/tty 2>/dev/null || CONFIRM="n"
case "$CONFIRM" in
[yY]) ;;
*)
    echo "  Aborted."
    exit 0
    ;;
esac

echo ""

if [ -d "$METAL_DIR" ]; then
    echo "  Removing $METAL_DIR..."
    rm -rf "$METAL_DIR"
    echo "  Done."
else
    echo "  metal not found. Skipping."
fi

if [ -d "$METAL_BE" ]; then
    echo "  Removing $METAL_BE..."
    rm -rf "$METAL_BE"
    echo "  Done."
else
    echo "  metal.Be not found. Skipping."
fi

echo ""
echo "  ============================================"
echo "  metal.Na — Sodium. Reset complete."
echo "  Run Go.Fe to start fresh."
echo "  ============================================"
echo ""
