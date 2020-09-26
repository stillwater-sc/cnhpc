#!/usr/bin/env bash

# install the tekton catalog task git-clone into your cluster
kubectl apply -f https://raw.githubusercontent.com/tektoncd/catalog/v1beta1/git/git-clone.yaml

# install the tekton task to build an image and push it into a container registry
kubectl apply -f https://raw.githubusercontent.com/tektoncd/catalog/v1beta1/kaniko/kaniko.yaml

# install a task that deploys a Docker image into your Kubernetes cluster
kubectl apply -f tasks/deploy-using-kubectl.yaml

# install a build and deploy pipeline
kubectl apply -f pipeline/build-and-deploy.yaml

# install the demo CI run
kubectl create -f run/picalc-pipeline-run.yaml
