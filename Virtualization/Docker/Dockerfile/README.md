<!-- omit in toc -->
# Introduction
How to use dockerfile to build images?

<br />

<!-- omit in toc -->
# Table of Contents
- [Fundamental Concepts](#fundamental-concepts)
  - [1. Docker image](#1-docker-image)
  - [2. Multi-stage builds](#2-multi-stage-builds)
- [Commands](#commands)
  - [1. Build Image](#1-build-image)
  - [2. tag image](#2-tag-image)
  - [3. Push Image to DockerHub](#3-push-image-to-dockerhub)
    - [3.1. Issue: can not login DockerHub](#31-issue-can-not-login-dockerhub)
- [Arguments](#arguments)
  - [1. Entrypoint vs CMD](#1-entrypoint-vs-cmd)
- [shebang (WIP)](#shebang-wip)
- [PATH](#path)
- [:$](#)
- [Issue](#issue)
  - [1. standard_init_linux.go:190: exec user process caused "no such file or directory"](#1-standard_init_linuxgo190-exec-user-process-caused-no-such-file-or-directory)
- [Reference](#reference)

<br />

# Fundamental Concepts

## 1. Docker image
* Docker images are immutable; once you create an image you can never change it again
  * if want to modify the existing images 
    1. delete the current image
    2. build the image again
  
<br />

## 2. [Multi-stage builds](https://docs.docker.com/develop/develop-images/multistage-build/)
* Goal: to write an efficient docker image
* How: 
  1. use shell
  2. ensure each layer is as small as possible by using the artifacts it needs from the previous layer and nothing else 


<br />

# Commands

## 1. Build Image

  ```s
  docker build -f dockerfile -t <image_name>:1.0.1 .
  ```
  * -f:<br />
  * -t:  <br />
  * . : dockerfile in the current directory

<br />

## 2. tag image

  ```s
  docker tag SOURCE_IMAGE[:TAG] TARGET_IMAGE[:TAG]
  ```

<br />

## 3. Push Image to DockerHub

### 3.1. Issue: can not login DockerHub

  error getting credentials - err: exit status 1, out: `GDBus.Error:org.freedesktop.DBus.Error.ServiceUnknown: The name org.freedesktop.secrets was not provided by any .service files

**Solution:**

  ```s
  sudo apt install gnupg2 pass
  docker login --username <username>
  ```

<br />

# Arguments

## 1. [Entrypoint vs CMD](https://www.ctl.io/developers/blog/post/dockerfile-entrypoint-vs-cmd/)
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

<br />

# [shebang (WIP)](https://stackoverflow.com/a/34554506)
* written in the first line of scripts to tell Linux to execute it using a specific language
  
```python
#!/usr/bin/env python
```

* (WIP) may work without `entrypoint` and `cmd`, but only `run`. `run` is executed in the intermediate layer of a container (does not finish the container (without `entrypoint` and `cmd`)) and use **shebang** to execute the script (without `entrypoint` and `cmd`) can not execute script) => the process only occurs in the intermediate layers of container. Therefore,  

<br />

# PATH
* path with brackets implies the [host's PATH](https://stackoverflow.com/a/65119275)
  
    ENV PATH="/usr/local/bin:${PATH}"

<br />


# :$
related to bash
https://stackoverflow.com/questions/32342841/colon-at-the-beginning-of-line-in-docker-entrypoint-bash-script

<br />

# Issue

## 1. standard_init_linux.go:190: exec user process caused "no such file or directory"
> change `ENTRYPOINT`, instead of `ENTRYPOINT ["/entrypoint.sh"]`. Use below

```s
  ENTRYPOINT ["sh", "/entrypoint.sh"]
```

# Reference

[dockerfile arguments](https://betterprogramming.pub/the-whole-shebang-dockerfiles-5d59ace94d28)