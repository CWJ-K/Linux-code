<!-- omit in toc -->
# Introduction

<br />

<!-- omit in toc -->
# Table of Contents

<br />

# Fundamental Concepts

<br />

# Commands 
## install redis
```s
    apt-get install redis-server

```

## check redis status
```s
    service redis-server status

```
## restart redis
```s
    service redis-server restart
```

## test redis connection in other machines
```s
    redis-cli -h <host> -p 6379

```

## enable to connect [remote redis](https://stackoverflow.com/a/19091231)
1. 
    ```s
        vim /etc/redis/redis.conf
    ```
2. add `bind 0.0.0.0` after `bind 127.0.0.1`
> for security, use `Redis' AUTH`


