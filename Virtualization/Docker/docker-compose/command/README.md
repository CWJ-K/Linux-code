<!-- omit in toc -->
# Introduction
How does docker-compose.yml execute commands at build time?

<br />

<!-- omit in toc -->
# Table of Contents
- [Fundamental Concepts](#fundamental-concepts)
  - [1. Command](#1-command)
  - [2. CMD](#2-cmd)
  - [3. Entrypoint](#3-entrypoint)

<br />

# Fundamental Concepts

## 1. [Command](https://docs.docker.com/compose/compose-file/#command)
* only one command in each service
* overrides the default command declared by the container image (i.e. by Dockerfile’s [CMD](https://docs.docker.com/compose/compose-file/#command))

<br />

## 2. CMD
https://www.bmc.com/blogs/docker-cmd-vs-entrypoint/

<br />

## 3. Entrypoint