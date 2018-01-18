#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )"

helm install stable/nginx-ingress

kubectl run nginx --image=nginx

kubectl expose deployments/nginx --port=80

kubectl create -f "${DIR}/ingress.yaml"
