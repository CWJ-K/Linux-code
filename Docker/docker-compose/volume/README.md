<!-- omit in toc -->
# Purpose of Volumes
To persist data in the container

>If store non-persistent state data, use [**tmpfs mount**](https://docs.docker.com/storage/tmpfs/) instead

<br />

<!-- omit in toc -->
# Table of Contents
- [Fundamental Concepts](#fundamental-concepts)
  - [**volumes** vs **bind mounts**](#volumes-vs-bind-mounts)
  - [create volumes](#create-volumes)
  - [inspect volumes](#inspect-volumes)
  - [list volumes](#list-volumes)
  - [Remove volumes](#remove-volumes)
  - [cover existing data](#cover-existing-data)
- [Example](#example)
  - [Explanation](#explanation)
    - [fields](#fields)
    - [external](#external)
- [execute files when building docker-compose](#execute-files-when-building-docker-compose)

<br />

# Fundamental Concepts
## **volumes** vs **bind mounts**
  * **volumes** have more advantages than mounts
  * **mounts** has been used around in the early days of Docker
  
||Volumes|Bind Mounts|
|:---:|:---|:---|
|Dependency|completely managed by Docker| dependent on directory structure and OS of the host machine|
|Functionality| More| Limited|

## create volumes
* If start a container with a volume that does not yet exist, Docker will create the volume
* volumes will be referenced inside by **docker-compose**


        docker volume create volume_name

## inspect volumes
volumes are stored in the local location below:

    /var/lib/docker/volume

    # see Mountpoint
    docker volume inspect volumn_name

## list volumes
  
    docker volume ls

## Remove volumes
> **stop** containers using the volume first

> updating docker-compose does not affect the volume of the database

> **Remove service will not remove volumes**

 
    docker volume rm volumn_name

## cover existing data
**TODO: is it possible ?**

<br />

# Example
    version: "3.9"

    services:
    db:
        image: postgres
        volumes:
        - data:/var/lib/postgresql/data

    volumes:
    data:
        external: true
## Explanation
### fields

    local_location:container_location

### [external](https://docs.docker.com/compose/compose-file/compose-file-v3/#external:~:text=%3A/docker/example%22-,external,-%F0%9F%94%97)
* true:<br />
  compose will look for existing volume and mount it, instead of creating a new volume

# execute files when building docker-compose 
put .sql or .sh in the folder - **docker-entrypoint-initdb.d**

    volumes:
          - ./scripts/create_table.sql:/docker-entrypoint-initdb.d/create_table.sql

