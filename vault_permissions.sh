#!/usr/bin/env bash

VAULT="$HOME/secure-vault-data"

# Check if vault exists
if [ ! -d "$VAULT" ]; then
    echo "Vault not found! Run vault_setup.sh first."
    exit 1
fi

# Function to update permissions
set_perm() {
    FILE=$1
    DEFAULT=$2

    ls -l "$FILE"
    echo "Enter permission for $(basename "$FILE") or press Enter for default ($DEFAULT):"
    read PERM

    if [ -z "$PERM" ]; then
        chmod "$DEFAULT" "$FILE"
    else
        chmod "$PERM" "$FILE"
    fi
}

# Set permissions for each file
set_perm "$VAULT/keys.txt" 600
set_perm "$VAULT/secrets.txt" 640
set_perm "$VAULT/logs.txt" 644

echo "Final permissions:"
ls -l "$VAULT"
