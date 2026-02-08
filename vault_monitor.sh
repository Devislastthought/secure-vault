#!/usr/bin/env bash

# Vault path
<<<<<<< HEAD
VAULT="$HOME/secure-vault"
=======
VAULT="$HOME/secure-vault-data"
>>>>>>> f56da85bcff75b7cf665fa0779543b82a209767b

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


