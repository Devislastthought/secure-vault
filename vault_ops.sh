#!/usr/bin/env bash

VAULT="$HOME/secure-vault-data"

while true; do
    echo "------ Secure Vault ------"
    echo "1) Add Secret"
    echo "2) Update Secret"
    echo "3) Add Log"
    echo "4) Access Keys"
    echo "5) Exit"
    read -p "Choose an option: " CHOICE

    case $CHOICE in
        1)
            read -p "Enter new secret: " SECRET
            echo "$SECRET" >> "$VAULT/secrets.txt"
            ;;
        2)
            read -p "Text to replace: " OLD
            read -p "Replace with: " NEW
            sed -i "s/$OLD/$NEW/g" "$VAULT/secrets.txt"
            ;;
        3)
            echo "$(date) - Log entry" >> "$VAULT/logs.txt"
            ;;
        4)
            echo "ACCESS DENIED 🚫"
            ;;
        5)
            echo "Exiting..."
            break
            ;;
        *)
            echo "Invalid option"
            ;;
    esac
done
