import json
import docker
client = docker.DockerClient(base_url='unix://var/run/docker.sock')
print(json.dumps(client.version(), indent=2))
for item in client.containers.list():
    print(item.short_id, item.name, item.image)
client.containers.run('alpine', 'echo hello world')
