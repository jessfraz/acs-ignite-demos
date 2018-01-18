#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )"

helm delete `helm list | grep ingress | awk '{print $0}'`
kubectl delete deployments/nginx
kubectl delete services/nginx
kubectl delete -f "${DIR}/ingress.yaml"

