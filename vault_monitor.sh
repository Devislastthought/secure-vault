#!/usr/bin/env bash

VAULT="$HOME/secure_vault"
REPORT="$VAULT/vault_report.txt"

echo "Vault Security Report" > "$REPORT"
echo "Generated on: $(date)" >> "$REPORT"
echo "------------------------" >> "$REPORT"

for file in "$VAULT"/*; do
    perms=$(stat -c "%a" "$file")
    size=$(stat -c "%s" "$file")
    modified=$(stat -c "%y" "$file")

    echo "File: $(basename "$file")" >> "$REPORT"
    echo "Size: $size bytes" >> "$REPORT"
    echo "Last Modified: $modified" >> "$REPORT"
    echo "Permissions: $perms" >> "$REPORT"

    if [ "$perms" -gt 644 ]; then
        echo "⚠️ SECURITY RISK DETECTED" >> "$REPORT"
    fi

    echo "------------------------" >> "$REPORT"
done

echo "✅ Report created at $REPORT"
