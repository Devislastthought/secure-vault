#!/usr/bin/env bash

# Vault folder path
VAULT="$HOME/secure-vault-data"

echo "Creating secure vault..."

# Create vault folder if it doesn't exist
mkdir -p "$VAULT"

# Create files with welcome messages
echo "This file stores keys" > "$VAULT/keys.txt"
echo "This file stores secrets" > "$VAULT/secrets.txt"
echo "This file stores logs" > "$VAULT/logs.txt"

echo "Vault created successfully!"
ls -l "$VAULT"
