#!/bin/bash

# Set variables
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
source ${SCRIPT_DIR}/.env

# Check if GITPOD_OWNER_ID is set
if [ -z "$GITPOD_OWNER_ID" ]; then
    echo "Error: GITPOD_OWNER_ID environment variable is not set."
    exit 1
fi

# Function to clone or pull repository
clone_or_pull_repo() {
    if [ -d "$REPO_DIR/.git" ]; then
        echo "Repository already exists. Pulling latest changes..."
        cd "$REPO_DIR" || exit
        git pull
    else
        echo "Cloning repository..."
        git clone "$REPO_URL" "$REPO_DIR"
        cd "$REPO_DIR" || exit
    fi
}

# Clone or pull the repository
clone_or_pull_repo

# Create or switch to the branch
git switch --create "$GITPOD_OWNER_ID"

echo "You are now on branch '$GITPOD_OWNER_ID' in the repository at $REPO_DIR"

# Check if the backup file exists
if [ ! -f "$BACKUP_FILE" ]; then
    echo "Error: Backup file $BACKUP_FILE not found."
    exit 1
fi

# Initialize the PostgreSQL database
echo "Initializing PostgreSQL database with backup data..."
psql -f "$BACKUP_FILE"

echo "Database initialization complete."