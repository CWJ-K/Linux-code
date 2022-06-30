<!-- omit in toc -->
# Introduction
Take note of concepts of computer network and docker network

<br />

<!-- omit in toc -->
# Table of Contents
- [Fundamental Concepts](#fundamental-concepts)
  - [1. **Namespaces**](#1-namespaces)
    - [1.1. **What is the goal of namespace?**](#11-what-is-the-goal-of-namespace)
    - [1.2. **How namespace achieves the goal?**](#12-how-namespace-achieves-the-goal)
    - [1.3. **Image a namespace**](#13-image-a-namespace)
  - [2. **Socket**](#2-socket)
    - [2.1. **Socket Address**](#21-socket-address)
  - [3. **Topologies**](#3-topologies)
- [**Docker Networks**](#docker-networks)
  - [1. Types of Docker Network](#1-types-of-docker-network)
    - [1.1. **Bridge Networking**](#11-bridge-networking)
    - [1.2. **Host Networking**](#12-host-networking)
- [Service Networks](#service-networks)
  - [1. Example](#1-example)
    - [1.1. Explanation](#11-explanation)
      - [1.1.1. **Default Networking**](#111-default-networking)
- [Top-Level Networks Key](#top-level-networks-key)
  - [1. Example](#1-example-1)
- [Port](#port)
- [Commands](#commands)
  - [1. show all mapped ports](#1-show-all-mapped-ports)
- [Reference](#reference)

<br />


# Fundamental Concepts

<br />

## 1. [**Namespaces**](https://www.youtube.com/watch?v=-YnMr1lj4Z8)

Docker uses a Linux technology, namespaces.

<br />

### 1.1. **What is the goal of namespace?**
[To isolate workspaces](https://docs.docker.com/engine/security/userns-remap/)

### 1.2. **How namespace achieves the goal?**
* When running a container, Docker creates a set of namespaces for the container
* A namespace enables to place a bunch of code under a name
* Each namespace has an unique name to avoid naming conflicts between classes, functions and constants
  
  > like same scripts name in different directories
* Each namespace has its own IP address, network interfaces, routing tables ... etc.

### 1.3. **Image a namespace**
* like a directory/drawer. Files can be put in it. You label the directory/drawer to make it clear to identify.

<br />

## 2. [**Socket**](https://www.youtube.com/watch?v=-utm73RxNo4)
an end-point of communication between two devices

> each device has a socket to communicate to other device

<br />

### 2.1. **Socket Address**
IP address + port

<br />


## 3. **Topologies**
The different arrangements of computer connections and devices 

<br />

# **Docker Networks**

<br />

## 1. [Types of Docker Network](https://k21academy.com/docker-kubernetes/docker-networking-different-types-of-networking-overview-for-beginners/)

Below introduces two networking. However, Docker has many other network modes. Network provides Docker network isolation.


<br />

### 1.1. **Bridge Networking**
* **default** network in docker
* docker **automatically** creates a network for the current directory when running a container 

  <bt />
  services in the container by default join the network to connect other services.

* Good time to use bridge networking ?
  
  If you want to customize networks

* with **docker0** as a bridge

<bt />

### 1.2. **Host Networking**
* container shares host's networking namespace
  * container does not have its own IP address, but using host's IP address
  * aware of **port conflicts** while working in Docker host networking mode
  

* performance optimizations over other Docker networking modes, e.g., "none" and "bridge" modes.
  * does not require network address translation (NAT), making it easier to handle a large number of ports simultaneously
  * breaks the isolation model of Docker containers
  
* **localhost** inside a container means the **host of host machine**, instead of the container itself
  * can [reference](https://www.howtogeek.com/devops/how-to-connect-to-localhost-within-a-docker-container/) **localhost** or **127.0.0.1**  => I tried to use **localhost** in python scripts to connect mysql, but it connects slowly or maybe failed

<br />

# Service Networks

## 1. [Example](https://docs.docker.com/compose/networking/)

  ```yml
  # services all connect to the network, automatically generated 
  
  version: "3.9"
  services:
    web:
      build: .
      ports:
        - "8000:8000"
      # network_mode: "bridge"
    db:
      image: postgres
      ports:
        - "8001:5432"
      # network_mode: "bridge"
  ```

### 1.1. Explanation

#### 1.1.1. **Default Networking**
  * bridge (you may not see the network_mode field)

<br />

# [Top-Level Networks Key](https://docs.docker.com/compose/compose-file/compose-file-v2/#network-configuration-reference)

Top-level networks key helps:
1. Instead of just using the default app network, you can specify your own networks
2. create more complex topologies and specify custom network drivers and options
3. connect services to externally-created networks which aren’t managed by Compose
4. Each service can specify what networks to connect to with the service-level networks key, which is a list of names referencing entries under the top-level networks key.


## 1. Example
  ```yml
  version: "2.4"

  services:
    proxy:
      build: ./proxy
      networks:
        - outside
        - default
    app:
      build: ./app
      networks:
        - default
  

  networks:
    outside:
      external: true
  ```

<br />

# Port
  * Image Network is a hotel and port is each room in the hotel
  * HOST_PORT : CONTAINER_PORT

    * HOST_PORT: How host machine connects the service
    
      ```yml
      postgres://{DOCKER_IP}:8001
      ```

    * CONTAINER_PORT: how services connect other ones in the container
      * connect services based on their [alias](https://docs.docker.com/compose/compose-file/compose-file-v3/#network_mode), instead of IP

        ```yml
        postgres://db:5432
        ```

        * Advantages

          1. docker can be deployed in different environments without the limitation of static ip
          2. If machine maintenance, servers change to other machines. Use ip, you need to change ip at the same time. Use service name, you do not change anything
          3. For security, it is best to not let other people know your service ip
  * mode: **TODO**
    * host

<br />


# Commands

  > --net=host => host networking
  
  ```s
  # Set Network
  docker run -it --name web2 --net=host vaibhavthakur/docker:webinstance2


  docker network inspect my_network

  # only disconnect one container at once
  docker network disconnect -f my_network container_name 


  docker network rm my_network

  # show bridge IP address
  ip addr show docker0
  ```

## 1. show all mapped ports
```s
  docker ps
```







<br />
<br />
<br />

---

# Reference
[Practical Design Patterns in Docker Networking](https://www.youtube.com/watch?v=PpyPa92r44s)


[Network Keywords](https://www.ibm.com/cloud/learn/networking-a-complete-guide)



[How does it work? Docker! Part 3: Load balancing, service discovery and security!](https://blog.octo.com/en/how-does-it-work-docker-part-3-load-balancing-service-discovery-and-security/)

