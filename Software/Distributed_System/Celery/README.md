<!-- omit in toc -->
# Importance of Queue

Limited resources emphasize the importance of queues. In the modern technology world, real-time response is a key to keeping users continuously using applications or services. However, not everything has equal importance in real-time response.

Take social software for example. Users care more about submitting something quickly. The latency should not be over half a second. The next person to follow the person's contents can delay 1 to 10 seconds. It is important to know [simultaneity does not matter](https://decafbad.com/blog/2008/07/04/queue-everything-and-delight-everyone/) and latency is acceptable. Moreover, with limited resources, it is hard to operate everything at the same time. And these points highlight why the queue is acceptable and even delightful to take advantage of.

To accomplish queue, Celery system is developed.


<br />

<!-- omit in toc -->
# Table of Contents
- [Fundamental Concepts](#fundamental-concepts)
  - [Celery](#celery)
  - [Queues](#queues)
  - [Flower](#flower)
- [Commands](#commands)
  - [Install Celery](#install-celery)
  - [**TODO**](#todo)
  - [Help](#help)
  - [Run Celery Worker](#run-celery-worker)
    - [Parameters](#parameters)
  - [Monitor registered tasks](#monitor-registered-tasks)
  - [Start flower](#start-flower)
  - [Celery and RabbitMQ in different machines?](#celery-and-rabbitmq-in-different-machines)



# Fundamental Concepts
## Celery
![celery architecture](./celery_architecture.png)
* **Task queue systems**
  1. input: a unit of work, called a task
  2. workers process tasks
  3. monitor the queue 
* Celery communicates by **messages**
* uses a **broker** to mediate (send/receive messages) between clients and workers
  * broker: RabbitMQ, Redis, Amazon SQS ... etc.
* Celery is written in **Python**

## [Queues](https://docs.celeryq.dev/en/stable/userguide/routing.html)
* **add queues through flower UI**
* Automatic routing
  * by default:  task_create_missing_queues
  * a named queue not defined in task_queues will be created automatically


## Flower
  * a web-based tool for monitoring and administrating Celery clusters


# Commands

## Install Celery
        pip install celery

## **TODO** 
    apt install python-celery-common


## Help
        celery --help
        celery worker --help



## Run Celery Worker
* run the worker in the directory above folder with any celery-related scripts
    
        pipenv run celery -A proj worker --loglevel=INFO --concurrency=10 -n worker1@%h

### Parameters
  * start multiple workers on the same machine
    * %h: hostname including domain name => worker1@george.example.com
    * %n: Hostname only => worker1@george
    * %d: Domain name only => worker1@example.com




## [Monitor registered tasks](https://docs.celeryq.dev/en/stable/userguide/monitoring.html)

        celery inspect registered

    

## Start flower
              # broker url                        # flower port      
    flower --broker=amqp://worker:worker@rabbitmq --port=8888


## Celery and RabbitMQ in different machines?
**TODO**