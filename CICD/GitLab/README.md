<!-- omit in toc -->

# Introduction
How to build CI/CD pipelines in GitLab?

<br />

<!-- omit in toc -->
# Table of Contents
- [Introduction](#introduction)
- [Fundamental Concepts](#fundamental-concepts)
  - [1. read which file when merging branch](#1-read-which-file-when-merging-branch)
  - [2. docker runner](#2-docker-runner)
- [Commands](#commands)
  - [1. Install gitlab-runner in VM](#1-install-gitlab-runner-in-vm)
- [Issues](#issues)
  - [1. TypeError: 'NoneType' object is not callable CircleCI](#1-typeerror-nonetype-object-is-not-callable-circleci)
  - [2. not find make](#2-not-find-make)

<br />

# Fundamental Concepts

## 1. read which file when merging branch
https://docs.gitlab.com/ee/development/cicd/templates.html#template-directories

<br />

## 2. docker runner
* why docker runner is required?
  * database firewall
* docker runners are generally safe because every build runs in a new container, so there's nothing to worry.

<br />

# Commands 

## 1. Install gitlab-runner in VM
* https://docs.gitlab.com/runner/install/linux-manually.html
  
```sh
  sudo curl -L --output /usr/local/bin/gitlab-runner "https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-linux-amd64"

  sudo chmod +x /usr/local/bin/gitlab-runner

  sudo useradd --comment 'GitLab Runner' --create-home gitlab-runner --shell /bin/bash

  sudo gitlab-runner install --user=gitlab-runner --working-directory=/home/gitlab-runner
  sudo gitlab-runner start


  sudo usermod -aG docker gitlab-runner



  sudo gitlab-runner register \
    --non-interactive \
    --url "https://gitlab.com/" \
    --registration-token "your_token" \
    --executor "shell" \
    --description "build_image" \
    --tag-list "build_image" 

```

* docker 

```sh
  sudo gitlab-runner register \
    --non-interactive \
    --url "https://gitlab.com/" \
    --registration-token "your_token" \
    --executor "docker" \
    --docker-image continuumio/miniconda3:4.3.27 \
    --description "docker-runner" \
    --tag-list "docker-runner" 

```

<br />

# Issues

## 1. TypeError: 'NoneType' object is not callable CircleCI

https://stackoverflow.com/a/62152265

<br />

## 2. not find make
* install make in VM