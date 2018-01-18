#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )"
. "${DIR}/../util.sh"

watch kubectl --namespace operator-demo get pods
