<!-- omit in toc -->
# Table of Contents
- [Introduction](#introduction)
  - [Virtualization](#virtualization)
    - [Drawback](#drawback)
  - [Container-based virtualization](#container-based-virtualization)
    - [How to interact with the host machine?](#how-to-interact-with-the-host-machine)


# Introduction

In the software world, the biggest challenge is deployment - how to make sure your applications can run as expected on target machines. 

<br />

## Virtualization
To solve the issue, virtualization emerges through installing **Virtual Machine** (VM). VM enables to virtualize an operating system on the host operating system and install required dependencies on it. Therefore, we only have to deploy our application on VM and make sure all required dependencies are installed. It can create the same environment as the development environment.

### Drawback
However, VM is heavy since:
* it requires running an entire operating system on top of the host operating system
* Every VM has its guest operating system. It takes considerable resources to run multiple VM on a single machine
  
<br />

## Container-based virtualization
To solve the drawback of VM, container-based virtualization brings a much more lightweight approach to virtualization. Container-based virtualization uses kernel-level functionality in the host operating machine to virtualize applications, instead to run its operating systems. 

### How to interact with the host machine?

Containers interact with the host operating system via **container engine**. The container engine offers API for managing and running different containers and images. To attach the API, users can use **command-line tooling**. <br />

The most famous container engine is Docker






<br />

