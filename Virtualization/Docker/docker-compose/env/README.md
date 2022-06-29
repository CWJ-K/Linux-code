<!-- omit in toc -->
# Introduction

How to parse arguments in .env to docker-compose.yml ?

<br />

<!-- omit in toc -->
# Table of Contents
- [Fundamental Concepts](#fundamental-concepts)
  - [1. Path of .env](#1-path-of-env)
  - [2. Override](#2-override)
  - [3. syntax of environment variables](#3-syntax-of-environment-variables)

<br />

# Fundamental Concepts

## 1. Path of .env
* single .env file
  * Compose automatically looks for in project directory (**parent folder** of your Compose file)
* multiple .env files

<br />

## 2. Override
* Values set in the **shell environment** override those set in the .env file

<br />

## 3. [syntax of environment variables](https://docs.docker.com/compose/environment-variables/)
* $VARIABLE = ${VARIABLE}
> in some cases, ${VARIABLE} is more appropriate
* ${VARIABLE:-default}: evaluates to default if VARIABLE is [unset or empty](https://programmierfrage.com/items/properly-deleting-an-object-in-an-array-in-php) in the environment
> [without colon](https://stackoverflow.com/a/63799107): check only for variable existence <br />
> with colon: check both for variable existence and non-empties
* ${VARIABLE-default}: evaluates to default only if VARIABLE is unset in the environment

