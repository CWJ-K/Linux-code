<!-- omit in toc -->
# Introduction
How to use rabbitMQ to send messages?

<br />

<!-- omit in toc -->
# Table of Contents
- [Fundamental Concepts](#fundamental-concepts)
  - [1. AMQP (Advanced Message Queuing Protocol)](#1-amqp-advanced-message-queuing-protocol)
  - [2. Virtual Host](#2-virtual-host)
- [RabbitMQ](#rabbitmq)
  - [1. entities](#1-entities)
    - [1.1. Producer](#11-producer)
    - [1.2. Consumer](#12-consumer)
    - [1.3. Queue](#13-queue)
    - [1.4. Exchange](#14-exchange)
    - [1.5. Binding](#15-binding)
  - [2. port](#2-port)

<br />

# Fundamental Concepts

## 1. [AMQP (Advanced Message Queuing Protocol)](https://www.cloudamqp.com/blog/what-is-amqp-and-why-is-it-used-in-rabbitmq.html)
* allow messaging interoperability between systems no matter what platforms or message broker vendor are used
* It defines a set of messages capabilities which must be followed by the **broker**
* an application layer protocol that focuses on process-to-process communication **across IP networks**
* everything sent over AMQP is **binary data**

![Structure of AMBQ](./AMBQ.JPG)

<br />

## 2. Virtual Host
* a [namespace](https://www.rabbitmq.com/uri-spec.html) for objects like Exchanges, Queues and Bindings
* [Vhosts](https://stackoverflow.com/a/66587594) are to Rabbit; virtual machines are to physical servers
* allow to run data for **multiple applications** safely and securely by providing **logical separation** between instances
* to avoiding **naming collisions** on queues and exchanges when running multiple Rabbits
* Each vhost is essentially a **mini-RabbitMQ server** with its own queues, exchanges, and bindings ... etc, more important, with its own **permissions**.

<br />

# RabbitMQ
* a messaging system that uses AMQP as the basis for a set of standards controlling the entire message passing process
* message brokers:
    * like a post office, send messages to message receivers
* [docker-compose for RabbitMQ](https://hub.docker.com/_/rabbitmq)

![Structure of RabbitMQ](./RabbitMQ.JPG)

<br />

## 1. entities

### 1.1. Producer
  * send messages to queues
  * if there is Exchange, producers will send messages to Exchange

<br />

### 1.2. Consumer
  * receive messages

<br />

### 1.3. Queue
  * store messages
  * First In First out
  * each queue with its own ID

<br />

### 1.4. Exchange
  * send messages to queues based on conditions
  * conditions:
      * direct: send to specific queues
      * topic: send to queues based on binding rules, like regular expression
      * headers: send to queues based on headers of data
      * fanout: send to all queues

<br />

### 1.5. Binding
  * a relationship between an exchange and a queue

<br />

## 2. [port](https://stackoverflow.com/questions/12792856/what-ports-does-rabbitmq-use)
  * 15672: 
      * Management console for version 3.x
      * HTTP API clients and rabbitmqadmin (only if the management plugin is enabled)
  * 5672:
      * default
      * RabbitMQ main port
