# How to Create Kubernetes-in-Docker (kind) Powered Demos
# https://www.conjur.org/blog/tutorial-spin-up-your-kubernetes-in-docker-cluster-and-they-will-come/

# Example: CyberArk Secretless Kubernetes Demo 
# To see an example of an “All You Need is Docker” demo, check out the CyberArk Secretless Broker Kubernetes Demo: https://github.com/diverdane/secretless-k8s-demo 
# Starting the Demo with Docker Run 
# To start the CyberArk Secretless Broker demo, run the following command:
docker run --rm --name secretless-demo-client -p 30303:8001 -p 3000:3000 -v /var/run/docker.sock:/var/run/docker.sock -it diverdane/secretless-k8s-demo:v1.17.0

# The following table explains the fields used in this docker run command: 
# --rm 	Remove the container after running 
# --name secretless-demo-client 	Name to use for demo-client container 
# -p 30303:8001 	Map port 8001 (proxy for K8s dashboard) in demo container to port 30303 on the host. 
# This provides access to the dashboard at localhost:30303. 
# -p 3000:3000 	Map port 3000 in the demo container to port 3000 on the host. This provides access to the Grafana dashboard at localhost:3000. 
# -v /var/run/docker.sock:/var/run/docker.sock 	This volume mapping maps the Docker socket in the demo-client container to the Docker socket in the host. This essentially means that the demo-client container:
# * Uses its own Docker client
# * Uses the host’s Docker daemon as Docker server.
# This configuration is referred to as “Docker-on-Docker.” 
# -it 	Run the demo-client container in interactive/tty mode. 
# diverdane/secretless-k8s-demo:v1.17.0 	Run the dockerhub image diverdane/secretless-k8s-demo:v1.17.0 for this demo. This will load a kubectl version 1.17.0 binary in the demo-client container and spin up a kind cluster running Kubernetes 1.17.0. 

kubectl cluster-info --context kind-secretless
kubectl cluster-info

# After the cluster has been created, the demo container will deploy a “Pet Store” application along with a Secretless Broker sidecar container.
# A Pet Store application pod has been deployed that contains both an application container and a CyberArk Secretless Broker sidecar container. The Secretless Broker sidecar container allows the application to connect to a password-protected Postgres database without any knowledge of database credentials!!!
# To see the Kubernetes resources that have been configured, start with the following commands:

kubectl get namespaces
kubectl get all
kubectl get all -n quick-start-application-ns
kubectl get all -n quick-start-backend-ns

# To see the CyberArk Secretless Broker in action, use the scripts in /root to create and list pets in the pet store:

add_pet "Genghis D. Dog"
add_pet "Miss Ava"
add_pet "Mr. Roboto"
list_pets

# And a Kubernetes Dashboard will be deployed: 
# You can access the Kubernetes dashboard at the following location:
# http://127.0.0.1:30303/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/
# You will be prompted for login credentials. Run the following script to display the dashboard access token:

get_dashboard_token

# And a Grafana Dashboard: 
# You can access the Grafana dashboard at the following location:
# http://127.0.0.1:3000
# You will be prompted for a login username/password. To get the username/password credentials, run the following script:

get_grafana_credentials

# Exploring the Docker Container Configuration on the Host 
# By running ‘docker ps’ in the Docker container shell, you can see that your local host has 4 containers running: a demo container, one Kubernetes master container and 2 worker node containers: 

docker ps
docker ps --format "{{.ID}}\t\t{{.Image}}\t\t{{.Names}}"

# This shows that the nodes are implemented as containers running directly on the host’s Docker bridge network. 
# Exploring the Kubernetes Cluster 
# The kubectl command can be used in the demo container shell to explore the cluster. For example, displaying the nodes in the cluster:

kubectl get nodes

# Using the Kubernetes Dashboard 
# The demo deploys a Kubernetes Dashboard service in the cluster. To access the dashboard:
# In the demo container shell, run the get_dashboard_token script.

get_dashboard_token

# Copy the displayed token into your clipboard.
# Open a browser and navigate to the dashboard URL:
# http://127.0.0.1:30303/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/#/login
# You should see a Kubernetes Dashboard sign-in screen, as shown below. Select <Token>, then paste the token from step (2) into the ‘Enter Token’ field and select <Sign In>.
# At this point, you should see the Kubernetes Dashboard screen. You can select the `quick-start-application-ns` or `quick-start-backend-ns` and explore the demo namespaces.

# When you run kind from inside the demo container, it needs a way to ‘docker run’ Kubernetes node containers. This is achieved by using a “Docker-on-Docker” operation whereby the demo container uses:

# Docker Client: Its own Docker client
# Docker Server: The docker daemon of the host
# This is accomplished by bundling the docker client in the container and starting the container with the following option to mount the host’s docker socket:
# -v /var/run/docker.sock:/var/run/docker.sock
# This means that running ‘docker ps’ in the demo-client container will show you the same running containers as you’d see when running ‘docker ps’ on the host.

docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' secretless-kube-control-plane

# Modifying kubectl Config to Point to the Master Node
# When kind spins up a cluster, it also creates (or modifies) a kubectl config file that allows kubectl access to the kind cluster. Normally, kind sets up port forwarding between the Kubernetes master container and the host and uses a Kubernetes access IP of 127.0.0.1 (localhost) in the kubectl config.
# When kind is run from inside a demo container, the host’s localhost address of 127.0.0.1 no longer applies. In order to provide kubectl access to the cluster from within the container, the Kubernetes server IP/port hostport address in kubectl config is modified from 127.0.0.1:<some-port> to <Master-Node-IP-address>:6443.
# This is done in the `secretless_demo_runner` script that is executed when the demo container starts up:

MASTER_IP=$(docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' secretless-kube-control-plane)
sed -i "s/^    server:.*/    server: https:\/\/$MASTER_IP:6443/" $HOME/.kube/config

# Breaking this down, the first line in this sequence gets the Master node IP by using Docker to inspect the master node container. The second line in this sequence stream edits the kubectl config to modify the server field to use https://<master-ip>:6443 to access the Kubernetes API server.

# Setting up kubectl Proxy for the Kubernetes Dashboard
# For the demo, we would like to provide the participant access to the Kubernetes dashboard using a browser running on their host platform using a URL of the form http://127.0.0.1:30303/<some-path>. The plumbing required to accomplish this is two-fold:

# A “kubectl proxy” is run on the demo container, setting up a secure channel between the Kubernetes cluster and the demo client container. By default, the ‘kubectl proxy’ process serves on localhost. However, for the demo client container, we need it to serve on an IP that is accessible from the host, i.e. the container’s Docker network IP. The ‘kubectl proxy’ background process is started in the ‘secretless_demo_runner’ with the following:

CLIENT_IP=$(docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' secretless-demo-client)
kubectl proxy --address=$CLIENT_IP --accept-hosts=^localhost$,^127\.0\.0\.1$,^\[::1\]$ &

# Breaking this down, the first line in this sequence inspects the IP address of the demo client container. The second line in this sequence starts up a kubectl proxy process that serves on the demo client container’s IP address.

# The demo client container exposes the dashboard service on host port 30303 because the following argument was used when the container was started:
-p 30303:8001

# Setting up Port Forwarding for the Grafana Dashboard
# For the demo, we would like to provide the participant access to the Kubernetes dashboard using a browser running on their host platform, using a URL of the form http://127.0.0.1:3000. The plumbing required to accomplish this is two-fold:
# “kubectl port-forward” is run in the demo container for the Grafana dashboard service. This is done in the `secretless-demo-runner` script with:
POD_NAME=$(kubectl get pods --namespace grafana -l "app=grafana,release=my-release" -o jsonpath="{.items[0].metadata.name}")
kubectl port-forward --namespace grafana --address $CLIENT_IP $POD_NAME 3000:3000 &

# Breaking this down, the first line in this sequence gets the name of the Grafana pod by looking for a pod that is in the namespace “grafana” and has the labels “app=grafana” and “release=my-release”. The second line sets up port forwarding between the Grafana pod port 3000 and the demo client container’s port 3000.

# The demo container exposes the demo client container’s port 3000 on the host’s port 3000 because the following docker run argument was used to start up the demo client container:
-p 3000:3000

docker run --rm --name secretless-demo-client -p 30303:8001 -p 3000:3000 -v /var/run/docker.sock:/var/run/docker.sock -it diverdane/secretless-k8s-demo:v1.17.0
