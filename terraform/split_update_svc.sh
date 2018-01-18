#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )"
. "${DIR}/../util.sh"

run "vi ${DIR}/service/variables.tf"

run "terraform apply -state ${DIR}/service/terraform.tfstate service"

run "kubectl --namespace=terraform-demo get pods"

run "terraform destroy -state ${DIR}/simple/terraform.tfstate simple"
