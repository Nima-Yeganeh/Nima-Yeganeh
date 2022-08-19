docker run -d --name gitlab-runner --restart always \
    -v /srv/gitlab-runner/config:/etc/gitlab-runner \
    -v /var/run/docker.sock:/var/run/docker.sock \
    gitlab/gitlab-runner

docker run -d --name gitlab-runner --restart always -v /srv/gitlab-runner/config:/etc/gitlab-runner -v /var/run/docker.sock:/var/run/docker.sock gitlab/gitlab-runner

docker run -d --name gitlab-runner --restart always gitlab/gitlab-runner

docker run -d --name gitlab-runner --restart always -v ./config:/etc/gitlab-runner -v ./docker.sock:/var/run/docker.sock gitlab/gitlab-runner

docker exec -it gitlab-runner apt update -y
docker exec -it gitlab-runner apt install docker.io -y
docker exec -it gitlab-runner apt install -y apt-transport-https ca-certificates curl software-properties-common
docker exec -it gitlab-runner curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
docker exec -it gitlab-runner add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
docker exec -it gitlab-runner apt-cache policy docker-ce
docker exec -it gitlab-runner

docker exec -it gitlab-runner apt install docker-ce docker-ce-cli containerd.io -y

docker exec -it gitlab-runner docker images
docker exec -it gitlab-runner docker ps

docker ps

docker stop gitlab-runner
docker rm gitlab-runner

docker exec -it gitlab-runner gitlab-runner register
docker exec -it gitlab-runner gitlab-runner register --docker-privileged

# rocker/verse:latest

docker restart gitlab-runner

docker exec -it gitlab-runner gitlab-runner list
docker exec -it gitlab-runner gitlab-runner stop
docker exec -it gitlab-runner gitlab-runner start
docker exec -it gitlab-runner gitlab-runner restart

docker exec -it gitlab-runner cat /srv/gitlab-runner/config/config.toml


docker run -d --name gitlab-runner --restart always
docker run -d --name docker-test --restart always docker
docker exec -it docker-test uname
docker rm -f docker-test

docker run -v /var/run/docker.sock:/var/run/docker.sock -ti docker
docker run -v /srv/gitlab-runner/config:/etc/gitlab-runner -v /var/run/docker.sock:/var/run/docker.sock -ti --name gitlab-runner --restart always gitlab/gitlab-runner

docker run -v /var/run/docker.sock:/var/run/docker.sock -ti --name gitlab-runner --restart always gitlab/gitlab-runner

docker run -v /var/run/docker.sock:/var/run/docker.sock -d --name gitlab-runner gitlab/gitlab-runner
docker rm -f gitlab-runner

docker run -v /var/run/docker.sock:/var/run/docker.sock --restart always -d --name gitlab-runner gitlab/gitlab-runner
docker exec -it gitlab-runner docker ps
docker rm -f gitlab-runner

