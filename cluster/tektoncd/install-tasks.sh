#!/usr/bin/env bash

# This Task consists of two steps:
# 1- The first step runs sed in an Alpine Linux container to update the YAML file 
#    used for deployment with the image that was built by the kaniko Task. 
#    This step requires the YAML file to have two character strings, 
#    __IMAGE__ and __DIGEST__, which are substituted with parameter values.
#
# 2- The second step runs kubectl using Lachlan Evenson’s popular k8s-kubectl 
#    container image to apply the YAML file to the same cluster where the pipeline is running.
#!/usr/bin/env bash

# install the tekton catalog task git-clone into your cluster
kubectl apply -f https://raw.githubusercontent.com/tektoncd/catalog/v1beta1/git/git-clone.yaml

# install the tekton task to build an image and push it into a container registry
kubectl apply -f https://raw.githubusercontent.com/tektoncd/catalog/v1beta1/kaniko/kaniko.yaml

# install a task that deploys a Docker image into your Kubernetes cluster
kubectl apply -f tasks/deploy-using-kubectl.yaml

