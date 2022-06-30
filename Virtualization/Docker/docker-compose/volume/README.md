<!-- omit in toc -->
# Purpose of Volumes
To persist data in the container

>If store non-persistent state data, use [**tmpfs mount**](https://docs.docker.com/storage/tmpfs/) instead

<br />

<!-- omit in toc -->
# Table of Contents
- [Fundamental Concepts](#fundamental-concepts)
  - [1. Alternative methods of volumes](#1-alternative-methods-of-volumes)
  - [2. **volumes** vs **bind mounts**](#2-volumes-vs-bind-mounts)
  - [3. create volumes](#3-create-volumes)
  - [4. inspect volumes](#4-inspect-volumes)
    - [4.1. see Mountpoint](#41-see-mountpoint)
  - [5. list volumes](#5-list-volumes)
  - [6. Remove volumes](#6-remove-volumes)
  - [7. cover existing data](#7-cover-existing-data)
- [Example](#example)
  - [1. Explanation](#1-explanation)
    - [1.1. fields](#11-fields)
    - [1.2. external](#12-external)
- [execute files when building docker-compose](#execute-files-when-building-docker-compose)
  - [1. directory: docker-entrypoint-initdb.d](#1-directory-docker-entrypoint-initdbd)
- [Issue:](#issue)
  - [1. mount jupyter notebook](#1-mount-jupyter-notebook)

<br />

# Fundamental Concepts

## 1. Alternative methods of volumes
* read/write files using storage can be accessed via the internet. e.g. Amazon S3 storage

<br />

## 2. **volumes** vs **bind mounts**
  * **volumes** have more advantages than mounts
  * **mounts** has been used around in the early days of Docker
  
||Volumes|Bind Mounts|
|:---:|:---|:---|
|Dependency|completely managed by Docker| dependent on directory structure and OS of the host machine|
|Functionality| More| Limited|

<br />

## 3. create volumes
* If start a container with a volume that does not yet exist, Docker will create the volume
* volumes will be referenced inside by **docker-compose**


  ```sh
  docker volume create volume_name
  ```

<br />

## 4. inspect volumes
volumes are stored in the local location below:

  ```sh
  /var/lib/docker/volume
  ```

<br />

### 4.1. see Mountpoint
  ```sh
  docker volume inspect <volumn_name>
  ```

<br />

## 5. list volumes
  
  ```sh
  docker volume ls
  ```

<br />

## 6. Remove volumes
> **stop** containers using the volume first

> updating docker-compose does not affect the volume of the database

> **Remove service will not remove volumes**

  ```sh
  docker volume rm volumn_name
  ```

> remove all unused volumes

  ```sh
  docker volume prune
  ```

<br />

## 7. cover existing data
**TODO: is it possible ?**

<br />

# Example
  ```yml
  version: "3.9"

  services:
  db:
      image: postgres
      volumes:
      - data:/var/lib/postgresql/data

  volumes:
  data:
      external: true
  ```

<br />

## 1. Explanation

### 1.1. fields

  ```yml
  local_location:container_location
  ```

<br />

### 1.2. [external](https://docs.docker.com/compose/compose-file/compose-file-v3/#external:~:text=%3A/docker/example%22-,external,-%F0%9F%94%97)
* true:<br />
  compose will look for existing volume and mount it, instead of creating a new volume

<br />

# execute files when building docker-compose 

## 1. directory: docker-entrypoint-initdb.d
* the directory will be executed while booting the container, which enables to initialize database structure and data
* put `*.sql`, `*.sql.gz` or `*.sh` in the folder - **docker-entrypoint-initdb.d**

    volumes:
          - ./scripts/create_table.sql:/docker-entrypoint-initdb.d/create_table.sql

<br />

# Issue:

## 1. mount jupyter notebook
not simply /work, but /home/jovyan/work/

    volumes:
      - ./:/home/jovyan/work/