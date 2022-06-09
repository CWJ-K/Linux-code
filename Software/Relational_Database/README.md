<!-- omit in toc -->
# Introduction
Take note of relational database


<br />

<!-- omit in toc -->
# Table of Contents

- [Fundamental Concepts](#fundamental-concepts)
  - [Mysql](#mysql)
    - [mysqld](#mysqld)
    - [mysql](#mysql-1)
  - [phpMyadmin](#phpmyadmin)
  - [Types of Database](#types-of-database)

<br />

# Fundamental Concepts

## Mysql
### mysqld

        # part docker-compose about mysql
        version: '3.3'
        services:
        mysql:
            image: mysql:8.0
            command: mysqld --default-authentication-plugin=mysql_native_password

  * a server daemon. this is the database server's main binary (executable)
  * To execute Mysql client-server

### mysql
  * a command-line (administration) tool

<br />

## phpMyadmin
* handles the administration of MySQL over the Web
* supports a wide range of operations on MySQL and MariaDB

<br />

## Types of Database
|Type|Relation Database|Time Series Database|
|:---:|:---:|:---:|
||MySQL|InfluxDB, kdb+, TimescaleDB, DolphinDB|


