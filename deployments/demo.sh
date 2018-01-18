#!/bin/bash
# Copyright 2016 The Kubernetes Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )"
. "${DIR}/../util.sh"

run "clear"

kubectl create namespace demos > /dev/null || true

desc "Create a service that fronts any version of this demo"
run "cat ${DIR}/svc.yaml"
run "kubectl --namespace=demos apply -f ${DIR}/svc.yaml"

desc "Deploy v1 of our app"
run "cat ${DIR}/deployment.yaml"
run "kubectl --namespace=demos apply -f ${DIR}/deployment.yaml"

# The output of describe is too wide, uncomment the following if needed.
# desc "Check it"
# run "kubectl --namespace=demos describe deployment deployment-demo"

tmux new -d -s my-session \
    "${DIR}/split1_control.sh" \; \
    split-window -v -p 66 "${DIR}/split1_hit_svc.sh" \; \
    split-window -v "${DIR}/split1_watch.sh v1" \; \
    split-window -h -d "${DIR}/split1_watch.sh v2" \; \
    select-pane -t 0 \; \
    attach \;
