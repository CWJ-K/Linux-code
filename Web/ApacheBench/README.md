# ApacheBench

    apt-get install apache2-utils -y
    ab -c 10 -n 1000 'http://127.0.0.1:8888/'

mock multiple users and requests to a server in order to calculate how much time of each request and how many failed requests are.

## Metrcis
* Failed requests: if a server is not stable, it may lead to 1% failure rate
* Request per second
* Time per request: FastAPI has two similar metrics. One is average response time of 10 users. The other is average response time of one user