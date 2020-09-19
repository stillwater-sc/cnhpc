#!/usr/bin/env bash

# install a task that deploys a Docker image into your Kubernetes cluster
kubectl apply -f deploy-using-kubectl.yaml

# This Task consists of two steps:
# 1- The first step runs sed in an Alpine Linux container to update the YAML file 
#    used for deployment with the image that was built by the kaniko Task. 
#    This step requires the YAML file to have two character strings, 
#    __IMAGE__ and __DIGEST__, which are substituted with parameter values.
#
# 2- The second step runs kubectl using Lachlan Evenson’s popular k8s-kubectl 
#    container image to apply the YAML file to the same cluster where the pipeline is running.
