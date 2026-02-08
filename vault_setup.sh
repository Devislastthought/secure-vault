#!/usr/bin/env bash

VAULT_DIR="$HOME/secure_vault"

echo "🔐 Setting up Secure Vault..."

mkdir -p "$VAULT_DIR"

echo "Welcome to the Secure Vault Keys File" > "$VAULT_DIR/keys.txt"
echo "Welcome to the Secure Vault Secrets File" > "$VAULT_DIR/secrets.txt"
echo "Welcome to the Secure Vault Logs File" > "$VAULT_DIR/logs.txt"

echo "✅ Secure Vault setup completed successfully."
echo
ls -l "$VAULT_DIR"
