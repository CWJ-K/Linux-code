# Swarm

    docker swarm init 

## join other machines as workers, use below code to create codes for worker machines
    docker swarm join-token worker # in manager machine 

# Portainer
UI for swarm


## activate portainer
    docker stack deploy -c portainer.yml por
## build networ
    docker network create --scope=swarm --driver=overlay my_network

    # scope: the scope of network
    # driver: ovelay = services in the swarm can connenct to each other

## add other service
    # mysql deploy
    version: '3.3'
    services:
    mysql:
        image: mysql:8.0
        command: mysqld --default-authentication-plugin=mysql_native_password
        ports:
        - 3306:3306
        environment:
        MYSQL_DATABASE: stock
        MYSQL_USER: user
        MYSQL_PASSWORD: user
        MYSQL_ROOT_PASSWORD: root
        volumes:
        - mysql:/var/lib/mysql
        deploy:
        mode: replicated
        replicas: 1
        placement:
            constraints: [node.labels.mysql == true]

    # phpmyadmin
    phpmyadmin:
        image: phpmyadmin/phpmyadmin
        links:
        - mysql:db
        ports:
        - 8000:80
        environment:
        MYSQL_USER: user
        MYSQL_PASSWORD: user
        MYSQL_ROOT_PASSWORD: root
        PMA_HOST: mysql

## deploy services
    docker stack deploy --with-registry-auth -c <service.yml> <stack_name>
    # -c, --compose-file strings   Path to a Compose file, or "-" to read from stdin

    # stack_name => stack ?
    what if some services in the same stack



## mysql continously crash in stack
https://serverfault.com/a/970821