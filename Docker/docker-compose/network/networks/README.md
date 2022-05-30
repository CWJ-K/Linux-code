
Networks

* default: Compose sets up a single network base on a directory
* when running ```docker-compose up```, each container for a service will join the default network
* each service can connect to each other by alias/hostname
* Networked service-to-service communication uses the CONTAINER_PORT
    db:
        image: postgres
        ports:
        - "8001:5432"

    * HOST_PORT: 8001
        * from the host machine, connection string: postgres://{DOCKER_IP}:8001
    * container port: 5432 (postgres default)
        * Within the web container, connection string to db: postgres://db:5432


[Referrence](https://www.itread01.com/article/1538012515.html)