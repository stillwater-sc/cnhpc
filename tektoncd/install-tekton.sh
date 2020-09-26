#!/usr/bin/env bash

release=v0.16.3
kubectl apply -f $release/release.yaml

# install the dashboard as well
kubectl apply -f dashboard/tekton-dashboard-release.yaml

# access the dashboard via the kubernetes API server (kubectl proxy --port=8080)
# http://localhost:8080/api/v1/namespaces/tekton-pipelines/services/tekton-dashboard:http/proxy/
