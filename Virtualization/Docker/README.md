
# Introduction
Take note of the usage of Docker in Linux to solve questions below
1. how to write docker-compose
2. how to write dockerfile
3. how to use swarm

<br />

# Table of Contents
- [Docker-Compose](https://github.com/CWJ-K/Linux_Note/tree/main/Docker/docker-compose)
- [Dockerfile](https://github.com/CWJ-K/Linux_Note/tree/main/Docker/Dockerfile)
- [Swarm](https://github.com/CWJ-K/Linux_Note/tree/main/Docker/swarm)
- [Install on Linux](#install-on-linux-ubuntu)
  - [dockerfile](#dockerfile)
  - [docker-compose](#docker-compose)
- [Linux Commands](#linux-commands)

<br />

# Log in docker hub

    docker login --username <usename>

## Issue: Remote error from secret service
* the bug only in Ubuntu when using Docker
> Remote error from secret service: org.freedesktop.DBus.Error.ServiceUnknown: The name org.freedesktop.secrets was not provided by any .service files
Error saving credentials: error storing credentials - err: exit status 1, out: `The name org.freedesktop.secrets was not provided by any .service files`

        apt install gnupg2 pass
    
  * GnuPG2: an encryption tool that includes digital signatures and certificates
  * [pass](https://wiki.archlinux.org/title/Pass): With pass, each password lives inside of a gpg encrypted file whose filename is the title of the website or resource that requires the password

# Install on Linux (Ubuntu)
## dockerfile
    apt install docker
## docker-compose
    apt install docker-compose

<br />

# Linux Commands
## Format terminal output
    docker ps --format "table {{.Names}}\t{{.ID}}"


>|Placeholder|Description|
>|:---:|:---:|
>|.ID|Container ID|
>|.Image|Image ID|
>|.Status|	Container status|
>|.Size|	Container disk size|
>|.Names|	Container names|
>|.Networks|	Names of the networks attached to this container|