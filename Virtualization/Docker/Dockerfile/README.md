<!-- omit in toc -->
# Introduction
Take notes of dockerfile

<br />

<!-- omit in toc -->
# Table of Contents
- [Fundamental Concepts](#fundamental-concepts)
  - [Docker image](#docker-image)
  - [Multi-stage builds](#multi-stage-builds)
- [Commands](#commands)
  - [Build Image](#build-image)
  - [tag image](#tag-image)
  - [Push Image to DockerHub](#push-image-to-dockerhub)
    - [Issue: can not login DockerHub](#issue-can-not-login-dockerhub)
- [Arguments](#arguments)
  - [Entrypoint vs CMD](#entrypoint-vs-cmd)
- [shebang (WIP)](#shebang-wip)
- [PATH](#path)
- [Reference](#reference)
- [:$](#)

<br />

# Fundamental Concepts
## Docker image
* Docker images are immutable; once you create an image you can never change it again
  * if want to modify the existing images 
    1. delete the current image
    2. build the image again
  
<br />

## [Multi-stage builds](https://docs.docker.com/develop/develop-images/multistage-build/)
* Goal: to write an efficient docker image
* How: 
  1. use shell
  2. ensure each layer is as small as possible by using the artifacts it needs from the previous layer and nothing else 




<br />

# Commands

## Build Image

    docker build -f dockerfile -t <image_name>:1.0.1 .

 
  * -f:<br />
  * -t:  <br />
  * . : dockerfile in the current directory


## tag image

  docker tag SOURCE_IMAGE[:TAG] TARGET_IMAGE[:TAG]

## Push Image to DockerHub
### Issue: can not login DockerHub

    error getting credentials - err: exit status 1, out: `GDBus.Error:org.freedesktop.DBus.Error.ServiceUnknown: The name org.freedesktop.secrets was not provided by any .service files

**Solution:**

    sudo apt install gnupg2 pass
    docker login --username <username>



# Arguments
## [Entrypoint vs CMD](https://www.ctl.io/developers/blog/post/dockerfile-entrypoint-vs-cmd/)
* There is **at least one entrypoint or CMD** in a dockerfile.
However, if there are multiple CMD, only the last one will be executed.

* Always use **exec form** instead of shell form

* They have the same function - **to be executed when executing a container**. However, there are some slight difference between them. As the table below,

||CMD|Entrypoint|
|:---:|:---|:---|
|Main Purpose|provide **defaults** for an executing container, which can be omitted|provide **stronger arguments** to be executed in case users change it|
|Override|overridden by `docker run commands`|overridden by `docker run --entrypoint`|

* Sometimes, the combination of CMD and Entrypoint is required. <br />
  e.g. CMD provides users to change and entrypoint ensures arguments must be executed


# [shebang (WIP)](https://stackoverflow.com/a/34554506)
* written in the first line of scripts to tell Linux to execute it using a specific language
  
```python
#!/usr/bin/env python
```

* (WIP) may work without `entrypoint` and `cmd`, but only `run`. `run` is executed in the intermediate layer of a container (does not finish the container (without `entrypoint` and `cmd`)) and use **shebang** to execute the script (without `entrypoint` and `cmd`) can not execute script) => the process only occurs in the intermediate layers of container. Therefore,  


# PATH
* path with brackets implies the [host's PATH](https://stackoverflow.com/a/65119275)
  
    ENV PATH="/usr/local/bin:${PATH}"


# Reference

[dockerfile arguments](https://betterprogramming.pub/the-whole-shebang-dockerfiles-5d59ace94d28)


# :$
related to bash
https://stackoverflow.com/questions/32342841/colon-at-the-beginning-of-line-in-docker-entrypoint-bash-script