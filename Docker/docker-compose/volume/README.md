
# Volumes:
    * local_location:container_location
    * create local volume
        ```docker volume create hello```
Note: location is at local host directory: /var/lib/docker/volume



#   External:
[External](https://docs.docker.com/compose/compose-file/compose-file-v3/#external:~:text=%3A/docker/example%22-,external,-%F0%9F%94%97)

External:
    * True: specifiy the volume has created outside of Compose. Therefore, it will look for an existing volume outside of Compose and mount it into the service’s containers