<!-- omit in toc -->
# Introduction
Take note of concepts of computer network and docker network

<br />

<!-- omit in toc -->
# Table of Contents
- [Fundamental Concepts](#fundamental-concepts)
  - [**Namespaces**](#namespaces)
    - [**What is the goal of namespace?**](#what-is-the-goal-of-namespace)
    - [**How namespace achieves the goal?**](#how-namespace-achieves-the-goal)
    - [**Image a namespace**](#image-a-namespace)
  - [**Socket**](#socket)
    - [**Socket Address**](#socket-address)
- [Docker Networks](#docker-networks)
  - [Types of Docker Network](#types-of-docker-network)
    - [Bridge Networking](#bridge-networking)
    - [Host Networking](#host-networking)
    - [Set Network](#set-network)
  - [Top-Level Networks Key](#top-level-networks-key)
  - [topologies](#topologies)
- [Service Networks](#service-networks)
  - [Example 1](#example-1)
    - [Explanation](#explanation)
- [Example 2](#example-2)

<br />


# Fundamental Concepts

<br />

## [**Namespaces**](https://www.youtube.com/watch?v=-YnMr1lj4Z8)

Docker uses a Linux technology, namespaces.

<br />

### **What is the goal of namespace?**
[To isolate workspaces](https://docs.docker.com/engine/security/userns-remap/)

### **How namespace achieves the goal?**
* When running a container, Docker creates a set of namespaces for the container
* A namespace enables to place a bunch of code under a name
* Each namespace has an unique name to avoid naming conflicts between classes, functions and constants
  
  > like same scripts name in different directories
* Each namespace has its own IP address, network interfaces, routing tables ... etc.

### **Image a namespace**
* like a directory/drawer. Files can be put in it. You label the directory/drawer to make it clear to identify.

<br />

## [**Socket**](https://www.youtube.com/watch?v=-utm73RxNo4)
an end-point of communication between two devices

> each device has a socket to communicate to other device

<br />

### **Socket Address**
IP address + port

<br />

# Docker Networks

<br />

## [Types of Docker Network](https://k21academy.com/docker-kubernetes/docker-networking-different-types-of-networking-overview-for-beginners/)

Below introduces two networking. However, Docker has many other network modes.

<br />

### Bridge Networking
* default network in docker
* docker **automatically** creates a network for the current directory when running a container 

  <bt />
  services in the container by default join the network to connect other services.

* Good time to use bridge networking ?
  
  If you want to customize networks

<bt />

### Host Networking
* container shares host's networking namespace
  * container does not have its own IP address, but using host's IP address
  * aware of **port conflicts** while working in Docker host networking mode
  

* performance optimizations over other Docker networking modes, e.g., "none" and "bridge" modes.
  * does not require network address translation (NAT), making it easier to handle a large number of ports simultaneously
  


### Set Network
  > --net=host

    docker run -it --name web2 --net=host vaibhavthakur/docker:webinstance2





## [Top-Level Networks Key](https://docs.docker.com/compose/compose-file/compose-file-v2/#network-configuration-reference)


1. Instead of just using the default app network, you can specify your own networks
2. create more complex topologies and specify custom network drivers and options
3. connect services to externally-created networks which aren’t managed by Compose


Each service can specify what networks to connect to with the service-level networks key, which is a list of names referencing entries under the top-level networks key.

## topologies
The different arrangements of computer connections and devices 





# Service Networks

## [Example 1](https://docs.docker.com/compose/networking/)


    # services all connect to the network, automatically generated 

    version: "3.9"
    services:
      web:
        build: .
        ports:
          - "8000:8000"
      db:
        image: postgres
        ports:
          - "8001:5432"
### Explanation
* default networking: host (you may not see the networking field)

* port
  **TODO**

# Example 2
* each service can connect to each other by [alias/hostname](https://docs.docker.com/compose/compose-file/compose-file-v3/#network_mode)

Note: in docker, services connect to each other by host name/ Service name instead of IP
Advantages:
* docker can be deployed in differenct environments without the limitation of static ip
* if machine maintanence, servers will change to other machines. Use ip, you need to change ip at the same time. Use service name, you will not change anything
* For security, it is best to not let other people know your service ip.
* for loading balance...

#



* Networked service-to-service communication uses the CONTAINER_PORT
    db:
        image: postgres
        ports:
        - "8001:5432"

    * HOST_PORT: 8001
        * from the host machine, connection string: postgres://{DOCKER_IP}:8001
    * container port: 5432 (postgres default)
        * Within the web container, connection string to db: postgres://db:5432


[Referrence](https://www.itread01.com/article/1538012515.html)




docker network inspect my_network
docker network disconnect -f my_network container_name # only one container
docker network rm my_network




Docker provides a host network which lets containers share your host's networking stack. This approach means localhost inside a container resolves to the physical host, instead of the container itself. Now your container can reference localhost or 127.0. 0.1 directly.
https://www.howtogeek.com/devops/how-to-connect-to-localhost-within-a-docker-container/





-----
Reference:
Practical Design Patterns in Docker Networking
https://www.youtube.com/watch?v=PpyPa92r44s

Network Keywords
https://www.ibm.com/cloud/learn/networking-a-complete-guide