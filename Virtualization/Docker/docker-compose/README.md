<!-- omit in toc -->
# Introduction
Take note of the components of docker-compose in the view of docker-compose since I often use docker-compose.

<br />

<!-- omit in toc -->
# Table of Contents
- [Linux Commands](#linux-commands)
  - [1. Create and start containers](#1-create-and-start-containers)
  - [2. pull images](#2-pull-images)
  - [3. build docker-compose](#3-build-docker-compose)
- [Structure of this Directory](#structure-of-this-directory)

<br />

# Linux Commands

## 1. Create and start containers
  ```s
  docker-compose (-f docker-compose.yml) up -d --build
  ```
  

## 2. pull images
  ```s
  docker-compose -f <docker-compose.yml> pull
  ```

## 3. build docker-compose
  ```s
  docker-compose -f <docker-compose.yml> up
  
  ```
  

<br />

# Structure of this Directory
* Extension
* Network
  * Links
  * networks
* Volume
* Image
* Command
* Build
* Env

