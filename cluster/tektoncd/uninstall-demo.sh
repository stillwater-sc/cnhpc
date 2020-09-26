#!/usr/bin/env bash

# in reverse order, uninstall the CI/CD pipeline components

# uninstall the demo CI run
# the run is a create not an apply
#kubectl delete -f run/picalc-pipeline-run.yaml

# uninstall a build and deploy pipeline
kubectl delete -f pipeline/build-and-deploy.yaml

# uninstall a task that deploys a Docker image into your Kubernetes cluster
kubectl delete -f tasks/deploy-using-kubectl.yaml

# uninstall the tekton task to build an image and push it into a container registry
kubectl delete -f https://raw.githubusercontent.com/tektoncd/catalog/v1beta1/kaniko/kaniko.yaml

# uninstall the tekton catalog task git-clone into your cluster
kubectl delete -f https://raw.githubusercontent.com/tektoncd/catalog/v1beta1/git/git-clone.yaml

