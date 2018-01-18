#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )"
. "${DIR}/../util.sh"

run "clear"

run "kubectl --namespace operator-demo exec -it example-etcd-cluster-0000 -- etcdctl cluster-health"

run "vi ${DIR}/etcd-cluster.yaml"

run "kubectl apply -f ${DIR}/etcd-cluster.yaml"

run "kubectl --namespace operator-demo exec -it example-etcd-cluster-0000 -- etcdctl cluster-health"

run "kubectl --namespace operator-demo exec -it example-etcd-cluster-0000 -- etcdctl cluster-health"

run "kubectl delete -f ${DIR}/etcd-cluster.yaml"

kubectl delete namespaces operator-demo


