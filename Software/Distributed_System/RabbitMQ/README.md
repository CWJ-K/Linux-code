<!-- omit in toc -->
# Introduction
Take notes of RabbitMQ

<br />

<!-- omit in toc -->
# Table of Contents
- [RabbitMQ](#rabbitmq)
  - [5 entities](#5-entities)
    - [Producer](#producer)
    - [Consumer](#consumer)
    - [Queue](#queue)
    - [Exchange](#exchange)
    - [Binding](#binding)
  - [port](#port)


# RabbitMQ
* message brokers:
    * like a post office, send messages to message receivers

![Structure of RabbitMQ](./RabbitMQ.JPG)

## 5 entities
### Producer
  * send messages to queues
  * if there is Exchange, producers will send messages to Exchange
### Consumer
  * receive messages
### Queue
  * store messages
  * First In First out
  * each queue with its own ID
### Exchange
  * send messages to queues based on conditions
  * conditions:
      * direct: send to specific queues
      * topic: send to queues based on binding rules, like regular expression
      * headers: send to queues based on headers of data
      * fanout: send to all queues
### Binding
  * a relationship between an exchange and a queue

## [port](https://stackoverflow.com/questions/12792856/what-ports-does-rabbitmq-use)
  * 15672: 
      * Management console for version 3.x
      * HTTP API clients and rabbitmqadmin (only if the management plugin is enabled)
  * 5672:
      * default
      * RabbitMQ main port
