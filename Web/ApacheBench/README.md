<!-- omit in toc -->
# Introduction
Take note of ApacheBench


<br />

<!-- omit in toc -->
# Table of Contents
- [Fundamental Concepts](#fundamental-concepts)
  - [ApacheBench](#apachebench)
  - [ApacheBench Metrics](#apachebench-metrics)
    - [Failed requests](#failed-requests)
    - [Request per second](#request-per-second)
    - [Time per request](#time-per-request)
- [Commands](#commands)
  - [install ApacheBench](#install-apachebench)
  - [mock requests to a website](#mock-requests-to-a-website)


# Fundamental Concepts
## [ApacheBench](https://www.youtube.com/watch?v=2kpd7HceFz4)
* mock multiple users and requests to a server to calculate how much time each request gets responses and how many failed requests are.

## ApacheBench Metrics
### Failed requests
* if a server is not stable, it may lead to a 1% failure rate
  
### Request per second

### Time per request
* FastAPI has two similar metrics. One is the average response time of 10 users. The other is the average response time of one user



# Commands
## install ApacheBench

    apt-get install apache2-utils -y

## mock requests to a website 

    ab -n 1000 -c 10 'http://127.0.0.1:8888/'

  * 1000 requests, only responses 10 requests at the same time. So the website needs to deal with requests 10 times

