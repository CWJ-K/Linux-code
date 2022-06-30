<!-- omit in toc -->
# Introduction
How does ApacheBench help websites?

<br />

<!-- omit in toc -->
# Table of Contents
- [Fundamental Concepts](#fundamental-concepts)
  - [1. ApacheBench](#1-apachebench)
  - [2. ApacheBench Metrics](#2-apachebench-metrics)
    - [2.1. Failed requests](#21-failed-requests)
    - [2.2. Request per second](#22-request-per-second)
    - [2.3. Time per request](#23-time-per-request)
- [Commands](#commands)
  - [1. install ApacheBench](#1-install-apachebench)
  - [2. mock requests to a website](#2-mock-requests-to-a-website)

<br />

# Fundamental Concepts

## 1. [ApacheBench](https://www.youtube.com/watch?v=2kpd7HceFz4)
* mock multiple users and HTTP requests to a server to calculate how much time each request gets responses and how many failed requests are.

<br />

## 2. [ApacheBench Metrics](https://www.datadoghq.com/blog/apachebench/#how-apachebench-works)

<br />

### 2.1. Failed requests
* if a server is not stable, it may lead to a 1% failure rate
  
<br />

### 2.2. Request per second

<br />

### 2.3. Time per request
* FastAPI has two similar metrics. One is the average response time of 10 users. The other is the average response time of one user

<br />

# Commands

## 1. install ApacheBench

  ```sh
  apt-get install apache2-utils -y
  ```

<br />

## 2. mock requests to a website 

  ```sh
  ab -n 1000 -c 10 'http://127.0.0.1:8888/'
  ```

  * 1000 requests, only responses 10 requests at the same time. So the website needs to deal with requests 10 times
  * -n: The number of requests to send
  * -t: Seconds to max. wait for responses
    > -t should always go first—otherwise ApacheBench will [override](https://www.pinkbike.com/news/Apache-Bench-you-may-be-using-it-incorrectly.html) the value of -n and assign the default -n value of 50000
  * -c: The number of concurrent requests to make

