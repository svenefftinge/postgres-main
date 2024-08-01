#!/bin/bash

# Set variables
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
source ${SCRIPT_DIR}/.env

cd ${REPO_DIR}
# Create the backup
if pg_dump -d "$DB_NAME" > "$BACKUP_FILE"; then
    echo "Backup created successfully: $BACKUP_FILE"

    # Add the backup file to git
    git add "$BACKUP_FILE"

    # Create commit with timestamp
    TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
    git commit -m "Database backup - $TIMESTAMP"

    # Push commit
    if git push origin "$GITPOD_OWNER_ID"; then
        echo "Backup committed and pushed successfully"
    else
        echo "Error: Failed to push the commit"
        exit 1
    fi
else
    echo "Error: Backup creation failed"
    exit 1
fi