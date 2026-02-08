#!/usr/bin/env bash

VAULT="$HOME/secure_vault"
SECRETS="$VAULT/secrets.txt"
LOGS="$VAULT/logs.txt"

while true; do
    echo
    echo "🔐 Secure Vault Menu"
    echo "1) Add Secret"
    echo "2) Update Secret"
    echo "3) Add Log Entry"
    echo "4) Access Keys"
    echo "5) Exit"
    read -p "Choose option: " choice

    case "$choice" in
        1)
            read -p "Enter secret: " secret
            echo "$secret" >> "$SECRETS"
            ;;
        2)
            read -p "Text to replace: " old
            read -p "New text: " new
            if grep -q "$old" "$SECRETS"; then
                sed -i "s/$old/$new/g" "$SECRETS"
            else
                echo "No match found."
            fi
            ;;
        3)
            echo "[$(date)] Log entry" >> "$LOGS"
            ;;
        4)
            echo "ACCESS DENIED 🚫"
            ;;
        5)
            echo "Goodbye."
            break
            ;;
        *)
            echo "Invalid option."
            ;;
    esac
done
