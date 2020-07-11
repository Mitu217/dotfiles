#!/bin/bash

# Stop script if errors occur
trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -eu

# Load vital library that is most important and
# constructed with many minimal functions
. "$DOTPATH"/etc/lib/vital.sh

# This script is only supported with Windows
if ! is_windows; then
    log_fail "error: this script is only supported with windows"
    exit 1
fi

if ! has "choco"; then
    log_pass "choco: must be installed in advance"
    exit
fi

log_pass "choco: checked successfully"
