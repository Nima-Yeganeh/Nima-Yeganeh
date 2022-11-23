#!/bin/bash

while [ $# -gt 0 ]; do

   if [[ $1 == *"--"* ]]; then
        v="${1/--/}"
        declare $v="$2"
   fi

  shift
done

# Create
if [ -z create ] ; then
  kubectl create namespace wordpress

  tr --delete '\n' <password.txt >.strippedpassword.txt && mv .strippedpassword.txt password.txt
  kubectl apply -f ./local-volumes.yaml
  kubectl create secret -n wordpress generic wp-mysql-pass --from-file=password.txt
  kubectl apply -n wordpress -f ./mysql-deployment.yaml
  kubectl apply -n wordpress -f ./wordpress-deployment.yaml

  kubectl get svc nginx -n wordpress
elif [ -v create ] && [ "$create" == "conduit" ]; then
  kubectl create namespace wordpress

  tr --delete '\n' <password.txt >.strippedpassword.txt && mv .strippedpassword.txt password.txt
  kubectl apply -f ./local-volumes.yaml
  kubectl create secret -n wordpress generic wp-mysql-pass --from-file=password.txt
  cat ./mysql-deployment.yaml | conduit inject --skip-inbound-ports=3306 - | kubectl apply -n wordpress -f -
  cat ./wordpress-deployment.yaml | conduit inject --skip-outbound-ports=3306,9000,11211 --skip-inbound-ports=3306,9000,11211 - | kubectl apply -n wordpress -f -

  kubectl get svc nginx -n wordpress -o jsonpath="{.status.loadBalancer.ingress[0].*}"

  kubectl get svc nginx -n wordpress
elif [ -v create ] && [ "$create" == "istio" ]; then
  kubectl create namespace wordpress
  kubectl label namespace wordpress istio-injection=enabled

  tr --delete '\n' <password.txt >.strippedpassword.txt && mv .strippedpassword.txt password.txt
  kubectl apply -f ./local-volumes.yaml
  kubectl create secret -n wordpress  generic wp-mysql-pass --from-file=password.txt
  kubectl apply -n wordpress -f ./mysql-deployment.yaml
  kubectl apply -n wordpress -f ./wordpress-deployment.yaml
  kubectl apply -n wordpress -f ./wordpress-ingress.yaml

  export GATEWAY_URL=$(kubectl get po -l istio=ingress -n istio-system -o 'jsonpath={.items[0].status.hostIP}'):$(kubectl get svc istio-ingress -n istio-system -o 'jsonpath={.spec.ports[0].nodePort}')

  printf "Istio Gateway: $GATEWAY_URL"
fi


# Delete
if [ -z delete ] || [ "$delete" == "conduit" ]; then
  kubectl delete -f ./local-volumes.yaml
  kubectl delete secret -n wordpress wp-mysql-pass
  kubectl delete -n wordpress -f ./mysql-deployment.yaml
  kubectl delete -n wordpress -f ./wordpress-deployment.yaml

  kubectl delete namespace wordpress
fi

if [ -v delete ] && [ "$delete" == "istio" ]; then
  kubectl delete -f ./local-volumes.yaml
  kubectl delete secret -n wordpress wp-mysql-pass
  kubectl delete -n wordpress -f ./mysql-deployment.yaml
  kubectl delete -n wordpress -f ./wordpress-deployment.yaml
  kubectl delete -n wordpress -f ./wordpress-ingress.yaml

  kubectl delete namespace wordpress
fi