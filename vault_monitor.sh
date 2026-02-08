#!/usr/bin/env bash

# Vault path
<<<<<<< HEAD
<<<<<<< HEAD
VAULT="$HOME/secure-vault"
=======
VAULT="$HOME/secure-vault-data"
>>>>>>> f56da85bcff75b7cf665fa0779543b82a209767b
=======
VAULT="$HOME/secure-vault"
>>>>>>> f18c7dd3aa35d5767245c404b1651edbc000922a

# Report will be created in the repository folder
REPORT="$PWD/vault_report.txt"

echo "Vault Security Report" > "$REPORT"
echo "Generated on: $(date)" >> "$REPORT"
echo "------------------------" >> "$REPORT"

for FILE in "$VAULT"/*; do
    NAME=$(basename "$FILE")
    PERMS=$(stat -c "%a" "$FILE")
    SIZE=$(stat -c "%s" "$FILE")
    MODIFIED=$(stat -c "%y" "$FILE")

    echo "File: $NAME" >> "$REPORT"
    echo "Size: $SIZE bytes" >> "$REPORT"
    echo "Last Modified: $MODIFIED" >> "$REPORT"
    echo "Permissions: $PERMS" >> "$REPORT"

    if [ "$PERMS" -gt 644 ]; then
        echo "⚠️ SECURITY RISK DETECTED" >> "$REPORT"
    fi

    echo "------------------------" >> "$REPORT"
done

echo "✅ Report created at $REPORT"


