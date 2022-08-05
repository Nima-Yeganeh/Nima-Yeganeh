import json
import docker
client = docker.DockerClient(base_url='unix://var/run/docker.sock')
print(json.dumps(client.version(), indent=2))
