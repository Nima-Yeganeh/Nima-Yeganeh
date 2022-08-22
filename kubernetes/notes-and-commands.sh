minikube start
minikube dashboard
minikube dashboard --url
kubectl create deployment hello-node --image=k8s.gcr.io/echoserver:1.4
kubectl get deployments
kubectl get pods
kubectl get events
kubectl config view
kubectl expose deployment hello-node --type=LoadBalancer --port=8080
kubectl get services
minikube service hello-node
minikube addons list
minikube addons enable metrics-server
kubectl get pod,svc -n kube-system
kubectl delete service hello-node
kubectl delete deployment hello-node
minikube stop
minikube delete

# example1
kubectl version
kubectl get nodes
kubectl apply -f deployment.yaml
kubectl get pods
kubectl get pods -n ingress-nginx
kubectl apply -f service.yaml
kubectl get svc
kubectl apply -f ingress.yaml
kubectl get svc
kubectl get svc \
  -n ingress-nginx ingress-nginx \
  -o=jsonpath='{.status.loadBalancer.ingress[0].ip}'
kubectl get svc -n ingress-nginx ingress-nginx -o=jsonpath='{.status.loadBalancer.ingress[0].ip}'
