<!-- omit in toc -->
# Introduction

<br />

<!-- omit in toc -->
# Table of Contents
- [Fundamental Concepts](#fundamental-concepts)
- [Commands](#commands)
  - [1. install rabbitmq in Linux](#1-install-rabbitmq-in-linux)
  - [2. stop current rabbit](#2-stop-current-rabbit)
  - [3. start rabbitmq](#3-start-rabbitmq)
  - [4. list users](#4-list-users)
  - [5. create a user](#5-create-a-user)
- [Reference](#reference)

<br />

# Fundamental Concepts

<br />

# Commands 

## 1. install rabbitmq in Linux
```s
    apt-get update -y
    apt-get install rabbitmq-server
```

## 2. stop current rabbit
```s
    rabbitmqctl stop
```


## 3. start rabbitmq
```s
    rabbitmq-server

```

## 4. list users
```s
    rabbitmqctl list_users

```

## 5. create a user
```s
    rabbitmqctl add_user test test
    rabbitmqctl set_user_tags test administrator
    rabbitmqctl set_permissions -p / test ".*" ".*" ".*"

```


# Reference
1. [install rabbitmq](https://blog.51cto.com/u_10950710/2135676)