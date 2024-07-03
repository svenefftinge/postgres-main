# Requirements

* a developer owns their DB content
* good performance for 10MB DBs and larger
* a developer can run workspaces in parallel to run the Hibob app with different schema/data versions
* a developer can test db migrations.

# Building Block 1
* Need: Developer owned persitence
* --> Dotfiles
* but that's git. LFS to the rescue! Max file size 5GB instead of 100MB. Large file do not inflate git-hitory. 

# Building Block 2
* One database per workspace
* --> preinstall in base image or run docker image
