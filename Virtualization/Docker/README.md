
# Introduction
Take note of the usage of Docker in Linux to solve questions below
1. how to write docker-compose?
2. how to write dockerfile?
3. how to use Swarm?

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

  ```s
  docker login --username <usename>
  ```

<br />

## Issue: Remote error from secret service
* the bug only in Ubuntu when using Docker
> Remote error from secret service: org.freedesktop.DBus.Error.ServiceUnknown: The name org.freedesktop.secrets was not provided by any .service files
Error saving credentials: error storing credentials - err: exit status 1, out: `The name org.freedesktop.secrets was not provided by any .service files`

  ```s
  apt install gnupg2 pass
  ```
    
  * GnuPG2: an encryption tool that includes digital signatures and certificates
  * [pass](https://wiki.archlinux.org/title/Pass): With pass, each password lives inside of a gpg encrypted file whose filename is the title of the website or resource that requires the password

<br />

# Install on Linux (Ubuntu)
## dockerfile
  ```s
  apt install docker
  ```

<br />

## docker-compose

  ```s
  apt install docker-compose
  ```

<br />

# Linux Commands
## Format terminal output

  ```s
  docker ps --format "table {{.Names}}\t{{.ID}}"
  ```

>|Placeholder|Description|
>|:---:|:---:|
>|.ID|Container ID|
>|.Image|Image ID|
>|.Status|	Container status|
>|.Size|	Container disk size|
>|.Names|	Container names|
>|.Networks|	Names of the networks attached to this container|


## Command Docker commands
```bash
  # docker ps format
  docker ps --format "{{.ID}}\t{{.Names}}\t{{.CreatedAt}}" | sort -k 3 -r | head -n 5

```