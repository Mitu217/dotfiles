#!/bin/bash

# Stop script if errors occur
trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -eu

# Load vital library that is most important and
# constructed with many minimal functions
. "$DOTPATH"/etc/lib/vital.sh

# exit with true if you have go command
if has "go"; then
    log_pass "go: already installed"
    exit
fi

if has "brew"; then
    if brew install go; then
        log_pass "go: installed successfully"
    else
        log_fail "go: failed to install golang"
        exit 1
    fi
else
    log_fail "error: require: Homebrew"
    exit 1
fi