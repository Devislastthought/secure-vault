#!/usr/bin/env bash

VAULT_DIR="$HOME/secure_vault"

if [ ! -d "$VAULT_DIR" ]; then
    echo "❌ secure_vault does not exist."
    exit 1
fi

update_permissions() {
    local file="$1"
    local default="$2"

    ls -l "$file"
    read -p "Update permissions? (y/n, Enter = default): " answer

    if [ "$answer" = "y" ]; then
        read -p "Enter permission (e.g. 600): " perm
        chmod "$perm" "$file"
    else
        chmod "$default" "$file"
    fi
}

update_permissions "$VAULT_DIR/keys.txt" 600
update_permissions "$VAULT_DIR/secrets.txt" 640
update_permissions "$VAULT_DIR/logs.txt" 644

echo
echo "📄 Final permissions:"
ls -l "$VAULT_DIR"
