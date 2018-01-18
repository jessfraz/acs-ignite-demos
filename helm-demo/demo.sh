#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )"
. "${DIR}/../util.sh"

run "clear"

run "helm init"

run "helm search mysql"

run "helm install mysql"

run "kubectl get pv"

run "kubectl get pods"

run "kubectl get services"
