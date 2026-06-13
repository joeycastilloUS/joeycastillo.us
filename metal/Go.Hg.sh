#!/usr/bin/env bash
# Go.Hg -- Mercury: cross-machine telemetry sync for metal.
# Pulls every unit's prompt-trail + compute-cost logs and pushes this one's.
# The metal-raw origin is archived (read-only); Mercury uses the live shared hub
# acmedevUS/metal-telemetry as the writable "third place". Per-host folders = no conflicts.
set -e
REPO="https://github.com/acmedevUS/metal-telemetry.git"
DIR="${HOME}/metal-telemetry"
[ -d "$DIR/.git" ] || git clone "$REPO" "$DIR"
bash "$DIR/sync.sh"
