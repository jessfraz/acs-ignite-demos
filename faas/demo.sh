#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )"
. "${DIR}/../util.sh"

run "clear"

run "kubectl create ns kubeless"

run "curl -sL https://github.com/kubeless/kubeless/releases/download/v0.1.0/kubeless-v0.1.0.yaml | kubectl create -f -"

run "kubectl get functions"

run "cat ${DIR}/simple.py"

run "kubeless function deploy get-python --runtime python2.7 --handler test.simple --from-file ${DIR}/simple.py --trigger-http"

run "kubectl get functions"

run "kubeless function call get-python --data '{\"name\": \"ignite-demo\"}'"

run "kubeless function delete get-python"

run "kubectl delete namespace kubeless"

kubectl delete thirdpartyresources function.k8s.io
