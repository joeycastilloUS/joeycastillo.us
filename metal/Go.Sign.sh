#!/usr/bin/env bash
# Go.Sign.sh - Signed-commit bootstrap (Mac/Linux sibling of Go.Sign.ps1).
# Idempotent. Run standalone or from Go.Fe.sh Identity step.
#
# Algorithm matches Go.Sign.ps1:
#   1. Sanity check tools (git, gh, gpg).
#   2. Verify gh auth.
#   3. Read canonical identity from gh api user (uses gh --jq, no jq dep).
#   4. Find a usable local GPG key matching the identity:
#      a. If signingkey is set and key is in keyring, healthy -- exit.
#      b. If a local key matches the email, rewire signingkey to it.
#      c. Otherwise, generate fresh 4096-bit RSA key.
#   5. Wire git config global (user.name/email/signingkey + commit.gpgsign).
#   6. If we generated a new key, register pubkey via gh gpg-key add
#      (requires write:gpg_key scope; script triggers gh auth refresh once).
#   7. Smoke test in a scratch repo: git commit --allow-empty must succeed.
#
# Prints [OK] / [FAIL] markers. ASCII only. LF endings. Project DoD P1+P2.

set -uo pipefail

say()  { printf "  %s\n" "$1"; }
ok()   { printf "  [OK] %s\n" "$1"; }
fail() { printf "  [FAIL] %s\n" "$1" >&2; exit 1; }
warn() { printf "  [WARN] %s\n" "$1" >&2; }

echo ""
echo "  ============================================"
echo "  Go.Sign -- signed-commit bootstrap"
echo "  ============================================"
echo ""

# ---- Step 1: Sanity ----
# gpg location varies: Mac Apple Silicon brew at /opt/homebrew/bin,
# Mac Intel brew at /usr/local/bin, Linux at /usr/bin. Path probe
# augments the session PATH if gpg isn't already visible.
if ! command -v gpg >/dev/null 2>&1; then
    for candidate in /opt/homebrew/bin /usr/local/bin /usr/bin; do
        if [ -x "$candidate/gpg" ] && [[ ":$PATH:" != *":$candidate:"* ]]; then
            export PATH="$PATH:$candidate"
            break
        fi
    done
fi
for tool in git gh; do
    if ! command -v "$tool" >/dev/null 2>&1; then
        fail "$tool not found on PATH. Run install.sh first."
    fi
done
# gpg is OPTIONAL -- only the GPG signing path needs it. SSH signing (the
# default on this fleet) needs nothing but git + ssh-keygen. Don't fail here.
GPG_PRESENT=0
command -v gpg >/dev/null 2>&1 && GPG_PRESENT=1
if [ "$GPG_PRESENT" = "1" ]; then
    ok "tools present (git, gh, gpg)"
else
    ok "tools present (git, gh)"
fi

# ---- Step 2: gh auth ----
GH_STATUS_OUT=$(gh auth status 2>&1) || fail "gh not authenticated. Run: gh auth login"
ok "gh authenticated"

# ---- Step 2.5: SSH signing short-circuit ----
# If git is already configured for SSH commit signing, that is the whole job.
# An SSH signing key is NOT a GPG key -- it never appears in the GPG keyring,
# so the GPG path below would (wrongly) decide it is "missing" and try to mint
# a fresh 4096-bit GPG key. On a box with a wedged gpg-agent that fails on every
# launch. SSH signing needs no GPG at all -- verify, register, and exit clean.
SIGN_FORMAT=$(git config --global --get gpg.format 2>/dev/null | tr -d '[:space:]' || true)
if [ "$SIGN_FORMAT" = "ssh" ]; then
    SSH_KEY=$(git config --global --get user.signingkey 2>/dev/null | sed 's/^"//; s/"$//' || true)
    # signingkey may be a path to a .pub, a path to the private key, or a
    # literal "ssh-ed25519 AAAA..." string. Resolve to the public material.
    KEY_FILE=""
    if [ -n "$SSH_KEY" ] && [ -f "$SSH_KEY" ]; then
        KEY_FILE="$SSH_KEY"
    elif [ -n "$SSH_KEY" ] && [ -f "${SSH_KEY}.pub" ]; then
        KEY_FILE="${SSH_KEY}.pub"
    fi
    case "$SSH_KEY" in ssh-*) IS_INLINE=1 ;; *) IS_INLINE=0 ;; esac
    if [ -n "$KEY_FILE" ] || [ "$IS_INLINE" = "1" ]; then
        ok "signing format is ssh (no GPG needed)"
        if [ -n "$KEY_FILE" ]; then
            say "signing key: $KEY_FILE"
        else
            say "signing key: inline ssh key"
        fi
        if [ -z "$(git config --global --get commit.gpgsign 2>/dev/null)" ]; then
            git config --global commit.gpgsign true
            say "enabled commit.gpgsign"
        fi
        # Smoke test: a signed empty commit must verify locally.
        say "smoke test (signed commit in scratch repo)..."
        SMOKE_DIR=$(mktemp -d -t metal-sign-smoke.XXXXXX)
        (
            cd "$SMOKE_DIR" || exit 1
            git init -q
            if ! git commit --allow-empty -m "metal Go.Sign ssh smoke" >/dev/null 2>&1; then
                echo "  ssh-signed smoke commit failed -- check the key + ssh-keygen on PATH" >&2
                exit 1
            fi
            if git log --show-signature -1 2>&1 | grep -qE 'Good "git" signature|Good signature'; then
                printf "  [OK] ssh-signed smoke commit verified locally\n"
            else
                printf "  [WARN] commit signed but local verify needs allowed_signers (gpg.ssh.allowedSignersFile)\n" >&2
            fi
        )
        SMOKE_EXIT=$?
        rm -rf "$SMOKE_DIR"
        [ "$SMOKE_EXIT" -ne 0 ] && fail "ssh-signed smoke commit failed -- check the key + ssh-keygen on PATH"

        # Register the SSH public key with GitHub as a SIGNING key. Without this
        # the commit verifies locally but shows "Unverified" on GitHub -- an SSH
        # signing key must be registered with type=signing (distinct from an auth
        # key). Non-fatal: warn + the exact manual command; never block the box.
        PUB_FOR_GH=""
        TMP_PUB=""
        case "$KEY_FILE" in
            *.pub) PUB_FOR_GH="$KEY_FILE" ;;
            *)
                if [ -n "$KEY_FILE" ] && [ -f "${KEY_FILE}.pub" ]; then
                    PUB_FOR_GH="${KEY_FILE}.pub"
                elif [ "$IS_INLINE" = "1" ]; then
                    TMP_PUB=$(mktemp -t metal-ssh-signing.XXXXXX)
                    printf "%s\n" "$SSH_KEY" > "$TMP_PUB"
                    PUB_FOR_GH="$TMP_PUB"
                fi
                ;;
        esac
        if [ -n "$PUB_FOR_GH" ] && [ -f "$PUB_FOR_GH" ]; then
            PUB_TOKEN=$(awk '{print $2}' "$PUB_FOR_GH")
            HOST_NAME=$(hostname 2>/dev/null || echo "host")
            REGISTERED=0
            EXISTING=$(gh api user/ssh_signing_keys --jq '.[].key' 2>/dev/null || true)
            if [ -n "$EXISTING" ] && [ -n "$PUB_TOKEN" ]; then
                if printf "%s\n" "$EXISTING" | grep -qF "$PUB_TOKEN"; then
                    REGISTERED=1
                fi
            fi
            if [ "$REGISTERED" = "1" ]; then
                ok "ssh signing key already registered with GitHub"
            else
                if gh ssh-key add --type signing "$PUB_FOR_GH" --title "metal signing $HOST_NAME"; then
                    ok "registered ssh signing key with GitHub (commits will show Verified)"
                else
                    warn "could not register ssh signing key (gh scope admin:ssh_signing_key may be missing)."
                    warn "When ready: gh ssh-key add --type signing \"$PUB_FOR_GH\" --title \"metal signing $HOST_NAME\""
                fi
            fi
        else
            warn "ssh signing key registered locally but no public key file found to register with GitHub -- commit may show Unverified."
        fi
        [ -n "$TMP_PUB" ] && rm -f "$TMP_PUB"

        echo ""
        echo "  ============================================"
        echo "  Go.Sign ready -- ssh signing"
        echo "  ============================================"
        echo ""
        exit 0
    else
        warn "gpg.format is ssh but user.signingkey ($SSH_KEY) not found -- falling through"
    fi
fi

# ---- Step 3: Identity from gh ----
# (GPG signing path -- only reached when gpg.format is not ssh.)
if [ "$GPG_PRESENT" != "1" ]; then
    fail "gpg.format is not ssh and gpg is not installed. Either install gpg, or set ssh signing: git config --global gpg.format ssh"
fi
# Use gh's built-in --jq so we don't require a separate jq install.
GH_NAME=$(gh api user --jq '.name // empty' 2>/dev/null || true)
GH_LOGIN=$(gh api user --jq '.login // empty' 2>/dev/null || true)
GH_ID=$(gh api user --jq '.id // empty' 2>/dev/null || true)
GH_EMAIL=$(gh api user --jq '.email // empty' 2>/dev/null || true)

if [ -z "$GH_EMAIL" ]; then
    # GitHub hides email by default, and user/emails needs the "user" OAuth
    # scope most gh tokens lack. Try it quietly -- a 404 here is expected
    # and non-fatal, not an error worth printing.
    GH_EMAIL=$(gh api user/emails --jq '.[] | select(.primary and .verified) | .email' 2>/dev/null | head -1 || true)
fi

if [ -z "$GH_EMAIL" ]; then
    # Final fallback: GitHub's noreply commit email. Built from login + id
    # (both already in gh api user, no extra scope), and push-accepted.
    if [ -n "$GH_LOGIN" ] && [ -n "$GH_ID" ]; then
        GH_EMAIL="${GH_ID}+${GH_LOGIN}@users.noreply.github.com"
        ok "using GitHub noreply email $GH_EMAIL"
    else
        fail "could not resolve GitHub identity (login/id missing from gh api user)."
    fi
fi

[ -z "$GH_NAME" ] && GH_NAME="$GH_LOGIN"

say "identity: $GH_NAME <$GH_EMAIL> (gh login: $GH_LOGIN)"

# ---- Step 4: Find or generate key ----

# Returns the long key ID (16 hex) of a secret key matching the email
# argument, or empty. Picks the most recent matching key.
find_local_key_for_email() {
    local target_email="$1"
    local colons
    colons=$(gpg --list-secret-keys --keyid-format LONG --with-colons 2>/dev/null) || return
    local current_key=""
    local current_date=0
    local matching_key=""
    local matching_date=0
    while IFS= read -r line; do
        case "$line" in
            sec:*)
                current_key=$(printf "%s" "$line" | awk -F: '{print $5}')
                current_date=$(printf "%s" "$line" | awk -F: '{print $6+0}')
                ;;
            uid:*)
                if [ -n "$current_key" ] && [[ "$line" == *"<$target_email>"* ]]; then
                    if [ "$current_date" -ge "$matching_date" ]; then
                        matching_key="$current_key"
                        matching_date=$current_date
                    fi
                fi
                ;;
        esac
    done <<< "$colons"
    printf "%s" "$matching_key"
}

CURRENT_SIGNINGKEY=$(git config --global --get user.signingkey 2>/dev/null | tr -d '[:space:]' || true)
KEY_TO_USE=""
GENERATED_NEW=0

# 4a. Is the current signingkey usable?
if [ -n "$CURRENT_SIGNINGKEY" ]; then
    if gpg --list-secret-keys "$CURRENT_SIGNINGKEY" >/dev/null 2>&1; then
        KEY_TO_USE="$CURRENT_SIGNINGKEY"
        ok "current signingkey ($CURRENT_SIGNINGKEY) is present in keyring"
    else
        warn "current signingkey ($CURRENT_SIGNINGKEY) is missing from keyring"
    fi
fi

# 4b. Look for any local key matching the GitHub email.
if [ -z "$KEY_TO_USE" ]; then
    LOCAL_KEY=$(find_local_key_for_email "$GH_EMAIL")
    if [ -n "$LOCAL_KEY" ]; then
        KEY_TO_USE="$LOCAL_KEY"
        ok "found local key matching $GH_EMAIL: $KEY_TO_USE"
    fi
fi

# 4c. Generate fresh.
if [ -z "$KEY_TO_USE" ]; then
    say "no usable key found -- generating fresh 4096-bit RSA..."
    # Clear stale gpg-agent / keyboxd locks first. A wedged keyboxd holding the
    # keybox surfaces as "database_open waiting for lock" / "SQL library used
    # incorrectly"; restarting the daemons releases it before gen-key.
    gpgconf --kill all >/dev/null 2>&1 || true
    BATCH_FILE=$(mktemp -t metal-gpg-batch.XXXXXX)
    cat > "$BATCH_FILE" <<EOF
%no-protection
Key-Type: RSA
Key-Length: 4096
Subkey-Type: RSA
Subkey-Length: 4096
Name-Real: $GH_NAME
Name-Email: $GH_EMAIL
Expire-Date: 0
%commit
EOF
    if ! gpg --batch --gen-key "$BATCH_FILE"; then
        rm -f "$BATCH_FILE"
        fail "gpg key generation failed"
    fi
    rm -f "$BATCH_FILE"

    KEY_TO_USE=$(find_local_key_for_email "$GH_EMAIL")
    [ -z "$KEY_TO_USE" ] && fail "key generated but could not be located in keyring"
    ok "generated new key: $KEY_TO_USE"
    GENERATED_NEW=1
fi

# ---- Step 5: Wire git config ----
git config --global user.signingkey "$KEY_TO_USE"
git config --global user.name "$GH_NAME"
git config --global user.email "$GH_EMAIL"
git config --global commit.gpgsign true
GPG_PATH=$(command -v gpg)
if [ -n "$GPG_PATH" ]; then
    git config --global gpg.program "$GPG_PATH"
fi
ok "git config wired to $KEY_TO_USE"

# ---- Step 6: Optional GitHub registration ----
if [ "$GENERATED_NEW" = "1" ]; then
    HAS_SCOPE=0
    if printf "%s" "$GH_STATUS_OUT" | grep -q "write:gpg_key"; then
        HAS_SCOPE=1
    fi
    if [ "$HAS_SCOPE" = "0" ]; then
        say "granting GPG-key scope to gh (browser will open)..."
        if gh auth refresh -h github.com -s write:gpg_key; then
            HAS_SCOPE=1
        else
            warn "gh auth refresh did not complete -- key NOT registered with GitHub."
            warn "When ready: gh auth refresh -h github.com -s write:gpg_key"
            warn "Then:       gpg --armor --export $KEY_TO_USE | gh gpg-key add -"
        fi
    fi
    if [ "$HAS_SCOPE" = "1" ]; then
        PUB_FILE=$(mktemp -t metal-gpg-pub.XXXXXX)
        gpg --armor --export "$KEY_TO_USE" > "$PUB_FILE"
        if gh gpg-key add "$PUB_FILE"; then
            ok "registered $KEY_TO_USE with GitHub"
        else
            warn "gh gpg-key add returned non-zero (key may already be registered)"
        fi
        rm -f "$PUB_FILE"
    fi
fi

# ---- Step 7: Smoke test ----
say "smoke test (commit in scratch repo)..."
SMOKE_DIR=$(mktemp -d -t metal-sign-smoke.XXXXXX)
(
    cd "$SMOKE_DIR" || exit 1
    git init -q
    if ! git commit --allow-empty -m "metal Go.Sign smoke" >/dev/null 2>&1; then
        echo "  smoke commit failed -- signing still broken" >&2
        exit 1
    fi
    if git log --show-signature -1 2>&1 | grep -q "Good signature"; then
        printf "  [OK] smoke commit signed and locally verified\n"
    else
        printf "  [WARN] commit succeeded but signature did not verify locally\n" >&2
    fi
)
SMOKE_EXIT=$?
rm -rf "$SMOKE_DIR"
[ "$SMOKE_EXIT" -ne 0 ] && fail "smoke commit failed -- signing still broken"

echo ""
echo "  ============================================"
echo "  Go.Sign ready -- $KEY_TO_USE"
echo "  Try a real commit."
echo "  ============================================"
echo ""
