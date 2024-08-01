#!/bin/bash

# Set variables
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
source "${SCRIPT_DIR}/.env"

# Default to 60 minutes if not set in .env
BACKUP_EVERY_N_MINUTES=${BACKUP_EVERY_N_MINUTES:-60}

# Function to run backup
run_backup() {
    echo "Running backup..."
    bash "${SCRIPT_DIR}/backup-postgres.sh"
}

# Function to handle SIGINT
handle_sigint() {
    echo "Received SIGINT. Running backup before exit..."
    run_backup
    exit 0
}

# Set up SIGINT trap
trap handle_sigint SIGINT

# Main loop
while true; do
    run_backup
    echo "Sleeping for ${BACKUP_EVERY_N_MINUTES} minutes..."
    sleep $((BACKUP_EVERY_N_MINUTES * 60))
done