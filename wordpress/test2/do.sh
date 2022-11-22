docker-compose pull
docker-compose up -d

docker container ls
docker container exec -it <redis-container-id> sh
redis-cli
keys *
