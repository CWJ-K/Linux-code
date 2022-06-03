
apt install docker
apt install docker-compose


# format
docker ps --format "table {{.Names}}\t{{.ID}}"
https://blog.poychang.net/formating-docker-ps-output/