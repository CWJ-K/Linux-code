
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