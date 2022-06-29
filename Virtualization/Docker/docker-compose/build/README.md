<!-- omit in toc -->
# Introduction

How does `build` enable to execute configuration options that are applied at build time?


<br />

<!-- omit in toc -->
# Table of Contents
- [Fundamental Concepts](#fundamental-concepts)
  - [1. Build](#1-build)
  - [2. context](#2-context)
  - [3. dockerfile](#3-dockerfile)
  - [4. args](#4-args)
  - [5. relative path](#5-relative-path)

# Fundamental Concepts

## 1. Build
  * example in docker-compose.yml
  ```yml
  version: "3.9"
  services:
    webapp:
      build:
        context: ./dir
        dockerfile: Dockerfile-alternate
        args:
          buildno: 1
  ```

## 2. context
* a path where contains dockerfile
* if relative path, it is interpreted as relative to **the location of the Compose file**

## 3. dockerfile
* Compose uses an alternate dockerfile to build with
* name of dockerfile
* without the field, docker-compose will look for any Dockerfile in the path of context
  
## 4. args
* Add build arguments, which are environment variables accessible only during the build process.



## 5. relative path
compared with volume, which uses the folder in the same directory
> docker and data are at the same level of the directory. however, they have different meanings
* build: docker/test
  * to get the file in this path
* volume: ./data:/tmp/data
  * to get the files in the current directory
> without `./` means [specific location](https://stackoverflow.com/questions/34269027/why-do-i-need-to-put-dot-forward-slash-when-running-a-sh-command-in-linux) in the path
> with `./` means files in the current directory

