#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )"
. "${DIR}/../util.sh"

run "clear"

desc "Part #1: Create a simple namespace"
statefile="${DIR}/simple/terraform.tfstate"

rm -f "${DIR}/simple/terraform.tfstate"

run "kubectl get namespaces"

run "cat ${DIR}/simple/namespace.tf"

run "terraform init simple"

run "terraform apply -state ${statefile} simple"

run "kubectl get namespaces"

desc "Part #2: Create a simple service"
statefile="${DIR}/service/terraform.tfstate"
name=service

rm -f service/terraform.tfstate

run "cat service/service.tf"

run "terraform init ${name}"

run "terraform apply -state ${statefile} ${name}"

run "kubectl --namespace terraform-demo get rc"

run "kubectl --namespace terraform-demo get pods"

run "kubectl --namespace terraform-demo get services"

tmux new -d -s my-session \
    "${DIR}/split_hit_svc.sh" \; \
    split-window -v -p 66 "${DIR}/split_update_svc.sh" \; \
    attach
