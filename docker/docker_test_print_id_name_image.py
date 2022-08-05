import json
import docker
client = docker.DockerClient(base_url='unix://var/run/docker.sock')
for item in client.containers.list():
    print(item.short_id, item.name, item.image)
    