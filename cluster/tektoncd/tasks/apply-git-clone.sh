#!/usr/bin/env bash

# install the tekton catalog task git-clone into your cluster
kubectl apply -f https://raw.githubusercontent.com/tektoncd/catalog/v1beta1/git/git-clone.yaml
