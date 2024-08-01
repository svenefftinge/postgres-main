# Postgres Data Backup Repository

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/svenefftinge/postgres-main)

This repository provides a set of scripts for automating PostgreSQL database backups in a development environment, particularly tailored for use with Gitpod. It allows for easy database initialization, periodic backups, and manual backups, all integrated with Git for version control.

## Features

- Automatic initialization of PostgreSQL database from the latest backup
- Perform manual backups
- Schedule periodic backups
- Automatically commit and push backups to the Git repository

## Quick Start

The easiest way to get started is to open this project in Gitpod:

1. Click the "Open in Gitpod" button above.
2. Wait for the Gitpod workspace to start and initialize.

That's it! The database will be automatically set up and periodic backups will start running.

## Scripts

1. `init-postgres.sh`: Initializes the PostgreSQL database from the latest backup.
2. `backup-postgres.sh`: Performs a manual backup of the database.
3. `periodic-backup-postgres.sh`: Sets up periodic backups of the database.

## Gitpod Configuration

The `.gitpod.yml` file in this repository takes care of the initialization process. It:

1. Uses a custom Dockerfile for the workspace environment.
2. Automatically runs the initialization script.
3. Starts the periodic backup process.
4. Sets up the necessary ports for PostgreSQL.

## Manual Usage

While the Gitpod configuration automates most processes, you can still manually interact with the scripts if needed:

### Manual Backup

To perform a manual backup:

```
bash .gitpod/backup-postgres.sh
```

This will create a backup of your database, commit it to Git, and push it to the remote repository.

## Customization

You can customize the backup frequency, database name, and other parameters by modifying the `.env` file in the `.gitpod` directory.