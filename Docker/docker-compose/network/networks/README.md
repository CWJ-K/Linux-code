<!-- omit in toc -->
# Introduction
Take note of concepts of computer network and docker network

<br />

<!-- omit in toc -->
# Table of Contents
- [Fundamental Concepts](#fundamental-concepts)
  - [Network Terms](#network-terms)
    - [Namespace](#namespace)
  - [Socket](#socket)
    - [Socket Address](#socket-address)
  - [Three Kinds of Networks](#three-kinds-of-networks)
    - [Docker Network Host](#docker-network-host)
  - [top-level networks key](#top-level-networks-key)
  - [topologies](#topologies)
- [Networks](#networks)

<br />


# Fundamental Concepts
## Network Terms
### [Namespace](https://www.youtube.com/watch?v=-YnMr1lj4Z8)





Docker uses a technology called namespaces to provide the isolated workspace called the container. When you run a container, Docker creates a set of namespaces for that container.

These namespaces provide a layer of isolation. Each aspect of a container runs in a separate namespace and its access is limited to that namespace.



Linux namespaces provide isolation for running processes, limiting their access to system resources without the running process being aware of the limitations.
https://docs.docker.com/engine/security/userns-remap/
think of a namespace as a person's surname

A namespace allows you to place a bunch of code under a name and not have any naming conflicts with classes, functions and constants.

It allows your code to live in that namespace.

A Namespace works like a directory. You know how you can put files in a directory with the same names as files in the parent (or any other) directory? Well, a namespace lets you do that within an application for variables, functions and classes.

Namespace is like packaging many things into a single pack. Imagine a namespace as a drawer in which you can put all kinds of things: a pencil, a ruler, a piece of paper and so forth. To avoid using each other's items, you decide to label the drawers so it's clear what belongs to whom.

You can use namespace to avoid name collisions between code you create, and internal PHP classes/functions/constants or third-party classes/functions/constants. 

Each namespace has its own IP addresses, network interfaces, routing tables, and so forth.



## [Socket](https://www.youtube.com/watch?v=-utm73RxNo4)
an end-point of communication between two devices
### Socket Address
IP address + port


## Three Kinds of Networks
https://k21academy.com/docker-kubernetes/docker-networking-different-types-of-networking-overview-for-beginners/

### Docker Network Host
a networking mode in which a Docker container shares its network namespace with the host machine
        # to run a container in host networking mode
        docker run -it --name web2 --net=host vaibhavthakur/docker:webinstance2
can offer performance improvements and optimizations over other Docker networking modes, e.g., "none" and "bridge" modes.

does not require network address translation (NAT), making it easier to handle a large number of ports simultaneously

avoid port conflicts while working in Docker host networking mode

## [top-level networks key](https://docs.docker.com/compose/compose-file/compose-file-v2/#network-configuration-reference)
1. Instead of just using the default app network, you can specify your own networks
2. create more complex topologies and specify custom network drivers and options
3. connect services to externally-created networks which aren’t managed by Compose


Each service can specify what networks to connect to with the service-level networks key, which is a list of names referencing entries under the top-level networks key.

## topologies
The different arrangements of computer connections and devices 





# Networks
https://docs.docker.com/compose/networking/
https://docs.docker.com/compose/compose-file/compose-file-v3/#network_mode
=> default mode: bridge. automaticall create my_network and all services connect to it

Note: in docker, services connect to each other by host name/ Service name instead of IP
Advantages:
* docker can be deployed in differenct environments without the limitation of static ip
* if machine maintanence, servers will change to other machines. Use ip, you need to change ip at the same time. Use service name, you will not change anything
* For security, it is best to not let other people know your service ip.
* for loading balance...

#
* default: Compose sets up a single network base on a directory
* when running ```docker-compose up```, each container for a service will join the default network
* each service can connect to each other by alias/hostname
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