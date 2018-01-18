#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )"
. "${DIR}/../util.sh"

run "clear"

run "cat ${DIR}/etcd-operator.yaml"

run "kubectl create -f ${DIR}/etcd-operator.yaml"

run "kubectl --namespace operator-demo get pods"

run "kubectl get thirdpartyresources"

run "cat ${DIR}/etcd-cluster.yaml"

run "kubectl create -f ${DIR}/etcd-cluster.yaml"

tmux new -d -s my-session-2 \
    "${DIR}/split_watch_etcd.sh" \; \
    split-window -v -p 66 "${DIR}/split_update_etcd.sh" \; \
    attach

