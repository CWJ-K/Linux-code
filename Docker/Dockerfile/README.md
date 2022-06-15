<!-- omit in toc -->
# Introduction
Take notes of dockerfile

<br />

<!-- omit in toc -->
# Table of Contents
- [Fundamental Concepts](#fundamental-concepts)
  - [Docker image](#docker-image)
- [Commands](#commands)
  - [Build Image](#build-image)
  - [tag image](#tag-image)
  - [Push Image to DockerHub](#push-image-to-dockerhub)
    - [Issue: can not login DockerHub](#issue-can-not-login-dockerhub)


# Fundamental Concepts
## Docker image
* Docker images are immutable; once you create an image you can never change it again
  * if want to modify the existing images 
    1. delete the current image
    2. build the image again


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
