<!-- omit in toc -->
# Introduction
Take notes of dockerfile

<br />

<!-- omit in toc -->
# Table of Contents
- [Commands](#commands)
  - [Build Image](#build-image)
  - [Push Image to DockerHub](#push-image-to-dockerhub)
    - [Issue: can not login DockerHub](#issue-can-not-login-dockerhub)


# Commands

## Build Image

    docker build -f Dockerfile -t web_crawler:1.0.1 .

 
  * -f:<br />
  * -t:  <br />
  * . : dockerfile in the current directory

## Push Image to DockerHub
### Issue: can not login DockerHub

    error getting credentials - err: exit status 1, out: `GDBus.Error:org.freedesktop.DBus.Error.ServiceUnknown: The name org.freedesktop.secrets was not provided by any .service files

**Solution:**

    sudo apt install gnupg2 pass
    docker login --username <username>
