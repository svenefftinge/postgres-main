# postgres-test

# Setup
1. Create a new peronal private Github repo. 
2. Configure the Github repo as "Dotfiles" repo.
3. Start a workspace on this repo
4. Seed: psql -f seed.sql
5. Export: pg_dump -d /home/gitpod/.dotfiles/backup1.sql
5. Persist: in /home/gitpod/.dotfiles/, run "git lfs track backup1.sql", "git commit", "git push".

# Seed
Fill the database with 10 megabytes of generated random content. 

```
psql -f seed.sql
```

# Export
Export the dabase 
```
pg_dump -d /home/gitpod/.dotfiles/backup1.sql
```

# Import

```
psql -f /home/gitpod/.dotfiles/backup1.sql
```

# Wipe

```
psql -f wipe.sql
```

# List Tables

```
psql -c "\dt"
```