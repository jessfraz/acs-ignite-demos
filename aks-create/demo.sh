#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )"
. "${DIR}/../util.sh"

RESOURCE_GROUP="k8s-bburns-demo"
NAME="demo"

run "clear"

run "az group create --name=${RESOURCE_GROUP} --location=eastus"

run "az aks create --name=${NAME} --resource-group=${RESOURCE_GROUP}"

run "az aks kubernetes get-credentials --name=${NAME} --resource-group=${RESOURCE_GROUP}"

run "kubectl get nodes"

