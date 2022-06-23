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
* mock multiple users and HTTP requests to a server to calculate how much time each request gets responses and how many failed requests are.

## [ApacheBench Metrics](https://www.datadoghq.com/blog/apachebench/#how-apachebench-works)
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
  * -n: The number of requests to send
  * -t: Seconds to max. wait for responses
    > -t should always go first—otherwise ApacheBench will [override](https://www.pinkbike.com/news/Apache-Bench-you-may-be-using-it-incorrectly.html) the value of -n and assign the default -n value of 50000
  * -c: The number of concurrent requests to make

