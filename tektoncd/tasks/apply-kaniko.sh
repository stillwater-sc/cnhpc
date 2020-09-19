#!/usr/bin/env bash

# install the tekton task to build an image and push it into a container registry
kubectl apply -f https://raw.githubusercontent.com/tektoncd/catalog/v1beta1/kaniko/kaniko.yaml
