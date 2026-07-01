#!/usr/bin/env bash
# metal -- Tools only (standalone). Dev toolchain on a bare box, no identity/auth.
#   curl -fsSL https://joeycastillo.us/metal/tools.sh | bash
#
# Reuses the full installer's bootstrap (git/gh/clone/self-heal) but runs only
# the dev-tools step. One source of truth: install.sh, mode=tools.
exec bash -c "$(curl -fsSL https://joeycastillo.us/metal/install.sh)" _ tools
