import json
import docker
client = docker.DockerClient(base_url='unix://var/run/docker.sock')
client.containers.run('alpine', 'echo hello world!')
