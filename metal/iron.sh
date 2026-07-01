#!/usr/bin/env bash
# metal -- Iron (standalone). Dev tools + identity + auth on a bare box.
#   curl -fsSL https://joeycastillo.us/metal/iron.sh | bash
#
# Reuses the full installer's bootstrap (git/gh/auth/clone/self-heal) but stops
# after Iron -- no Be launch. One source of truth: install.sh, mode=iron.
exec bash -c "$(curl -fsSL https://joeycastillo.us/metal/install.sh)" _ iron
