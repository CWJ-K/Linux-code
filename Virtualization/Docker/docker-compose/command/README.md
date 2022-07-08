<!-- omit in toc -->
# Introduction
How does docker-compose.yml execute commands at build time?

<br />

<!-- omit in toc -->
# Table of Contents
- [Fundamental Concepts](#fundamental-concepts)
  - [1. Command](#1-command)

<br />

# Fundamental Concepts

## 1. [Command](https://docs.docker.com/compose/compose-file/#command)
* only one command in each service
* overrides the default command declared by the container image (i.e. by Dockerfile’s [CMD] (https://docs.docker.com/compose/compose-file/#command))

* e.g. 
  |CMD|Command|
  |:---:|:---:|
  |CMD [ "bundle", "exec", "thin", "-p", "3000" ]|command: [ "bundle", "exec", "thin", "-p", "3000" ] <br /> command: bundle exec thin -p 3000|