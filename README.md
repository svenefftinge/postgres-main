# postgres-test

# seed:

```
psql
\i myapp-init.sdl
```

# export

```
pg_dump -d myapp -f /home/gitpod/.dotfiles/backup1.sql
```

# imoort

```
psql -d myapp -f input_file.sql
```

# wipe

DROP DATABASE myapp;