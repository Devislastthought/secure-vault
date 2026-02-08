#!/usr/bin/env bash

# Vault path
VAULT="$HOME/secure-vault"

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


