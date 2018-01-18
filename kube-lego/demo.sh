#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )"
. "${DIR}/../util.sh"

run "clear"

run "helm inspect values stable/kube-lego"

run "curl https://demos.azure-containers.io"

run "cat ${DIR}/kube-lego-values.yaml"

run "helm install -f ${DIR}/kube-lego-values.yaml stable/kube-lego"

run "cat ${DIR}/ingress-ssl.yaml"

run "kubectl apply -f ${DIR}/ingress-ssl.yaml"

while ! curl https://demos.azure-containers.io; do
    sleep 4
done
