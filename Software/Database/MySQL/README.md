<!-- omit in toc -->
# Introduction
How to deploy a database by docker-compose.yml?


<br />

<!-- omit in toc -->
# Table of Contents
- [Fundamental Concepts](#fundamental-concepts)
  - [1. Mysql](#1-mysql)
    - [1.1. mysqld](#11-mysqld)
    - [1.2. mysql](#12-mysql)
    - [1.3. docker-compose for mysql](#13-docker-compose-for-mysql)
  - [2. phpMyadmin](#2-phpmyadmin)
  - [3. Types of Database](#3-types-of-database)
- [Commands](#commands)
  - [1. create volume for Mysql](#1-create-volume-for-mysql)

<br />

# Fundamental Concepts

<br />

## 1. Mysql
<br />

### 1.1. mysqld

  ```yml
  # part docker-compose about mysql
  version: '3.3'
  services:
  mysql:
    image: mysql:8.0
    command: mysqld --default-authentication-plugin=mysql_native_password
  ```

  * a server daemon. this is the database server's main binary (executable)
  * To execute Mysql client-server

### 1.2. mysql
  * a command-line (administration) tool

### 1.3. [docker-compose for mysql](https://hub.docker.com/_/mysql)

<br />

## 2. phpMyadmin
* handles the administration of MySQL over the Web
* supports a wide range of operations on MySQL and MariaDB

<br />

## 3. Types of Database
|Type|Relation Database|Time Series Database|
|:---:|:---:|:---:|
||MySQL|InfluxDB, kdb+, TimescaleDB, DolphinDB|

<br />

# Commands

<br />

## 1. create volume for Mysql

    docker volume create mysql




