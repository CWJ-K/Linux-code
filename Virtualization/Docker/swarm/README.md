<!-- omit in toc -->
# Introduction
How to use Swarm to deploy multiple services?

<br />

<!-- omit in toc -->
# Table of Contents
- [Fundamental Concepts](#fundamental-concepts)
  - [1. Docker Architecture](#1-docker-architecture)
    - [1.1. Docker Daemon](#11-docker-daemon)
    - [1.2. Docker Client](#12-docker-client)
    - [1.3. Docker Registries](#13-docker-registries)
  - [2. Docker Swarm](#2-docker-swarm)
    - [2.1. API](#21-api)
    - [2.2. Services](#22-services)
  - [3. Portainer](#3-portainer)
    - [3.1. Stack](#31-stack)
- [Commands](#commands)
  - [1. Initialize docker swarm](#1-initialize-docker-swarm)
  - [2. Make Other Machines as Workers](#2-make-other-machines-as-workers)
  - [3. Activate Portainer](#3-activate-portainer)
  - [4. Create Network](#4-create-network)
  - [5. Add other Services](#5-add-other-services)
    - [5.1. Deploy Mysql](#51-deploy-mysql)
      - [5.1.1. Deploy Field](#511-deploy-field)
  - [6. Deploy Services](#6-deploy-services)
- [Issue](#issue)
  - [1. Mysql Continuously Crashes in Stack](#1-mysql-continuously-crashes-in-stack)
  - [2. portainer delete old image serveice automaticall?](#2-portainer-delete-old-image-serveice-automaticall)
  - [3. if existing deploy api failed, and test api used api connection](#3-if-existing-deploy-api-failed-and-test-api-used-api-connection)



<br />

# Fundamental Concepts

## 1. [Docker Architecture](https://docs.docker.com/get-started/overview/#docker-architecture)

![Docker Architecture](./docker_structure.JPG)

> Docker client contacts docker dameon. Docker dameon pulls images from registry and creates a new container with the image. The container executes commands in the image inside the container. Docker dameon streams the output from the command to the Docker client in the terminal. 

<br />

### 1.1. Docker Daemon

* Docker Daemon interacts with the operating system to create or manage containers 
* Listen for Docker API requests and manages Docker objects

<br />

### 1.2. Docker Client
* The primary way the users interact with Docker, e.g. use commands to operate Docker
* Docker client talks to docker daemon to manage containers

<br />

### 1.3. Docker Registries
* To store Docker images
* Example: Docker Hub => a public registry for anyone
* docker pull image => go to Docker Hub and pull required images to build environment

<br />

## 2. Docker Swarm
![Docker Swarm](./docker_swarm.JPG)
[Reference](https://www.youtube.com/watch?v=Tm0Q5zr3FL4)
![Docker Swarm2](./docker_swarm2.JPG)

<br />

### 2.1. API
docker nodes/containers communicate Docker Swarm by RESTful API over HTTP

<br />

### 2.2. Services
* a description of tasks or the state
* Modes
  * global: run on every Swarm node
  * replicated: 
    * manager node distribute tasks to worker nodes
    >  replication: the process of sharing information so as to ensure consistency between redundant resources  
  
    
  
<br />


## 3. Portainer
* UI for Swarm

<br />

### 3.1. Stack
* a collection of services that make up an application in a specific environment
* a stack file is in Yaml format
* deploy multiple services linked together
  

<br />

# Commands

## 1. Initialize docker swarm
* Current machine is manager machine
* Creates two random tokens, a worker token and a manager token
> when deploy a docker swarm, at least one node must be deployed

  ```sh
  docker swarm init 
  ```

<br />

## 2. Make Other Machines as Workers
* generate worker token for machines to be workers
  
  ```sh
  # in manager machine 
  docker swarm join-token worker 
  ```

* Use worker token in machines to be workers

<br />

## 3. Activate Portainer
* [portainer.yml](https://github.com/portainer/portainer-compose/blob/master/docker-stack.yml) 

  ```sh
  docker stack deploy -c portainer.yml por
  ```

<br />

## 4. Create Network
> make sure there is no existing network with same name. If there is, remove the existing network first.

  ```sh
  docker network create --scope=swarm --driver=overlay my_network
  ```

  * Scope: the scope of network
  * Driver: overlay = services in the swarm can connect to each other
    > Networking mode: overlay

<br />

## 5. Add other Services

### 5.1. Deploy Mysql 

  ```yml
  version: '3.3'
  services:
  mysql:
    image: mysql:8.0
    command: mysqld --default-authentication-plugin=mysql_native_password
    ports:
      - 3306:3306
    environment:
      MYSQL_DATABASE: stock
      MYSQL_USER: user
      MYSQL_PASSWORD: user
      MYSQL_ROOT_PASSWORD: root
    volumes:
      - mysql:/var/lib/mysql
    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints: [node.labels.mysql == true]
  ```

<br />

#### 5.1.1. Deploy Field
* mode
* replicas
* placement
* constraints
    * Purpose: to assign services to different nodes if there are multiple nodes 
    * First go to Portainer UI to add labels, so nodes can identify the service assigned to them
      > Portainer UI: Swarm -> Nodes -> click a specific node -> Node Labels -> add the label of the service

<br />

## 6. Deploy Services

  ```sh
  docker stack deploy --with-registry-auth -c <service.yml> <stack_name>
  ```

  * -c, --compose-file strings   Path to a Compose file, or "-" to read from stdin
  *  --with-registry-auth

<br />

# Issue

## 1. [Mysql Continuously Crashes in Stack](https://serverfault.com/a/970821)

    Check that you do not already have another mysqld process using the same InnoDB data or log files

  1. Run ```ls -la``` in your mysql data directory
  2. ```ps -ef | grep mysqld```
  3. ```sudo kill -9 <mysqld_id>```
  4. Run the container again

<br />

## 2. portainer delete old image serveice automaticall?
can set always pull the latest image

<br />

## 3. if existing deploy api failed, and test api used api connection
use different environment for development

develop code in test env (test api), and use cicd for test environment (x),
use make to test all codes in test env.  >> before merging branch

 when all scccuess,merge branch

<br />

=> it is important to write a flow of cicd settings, if only production environment