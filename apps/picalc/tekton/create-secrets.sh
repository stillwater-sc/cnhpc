#!/usr/bin/env bash

# IBM Cloud CR
kubectl create secret generic my-registry-secret --type="kubernetes.io/basic-auth" --from-literal=username=iamapikey --from-literal=password=mykey
kubectl annotate secret my-registry-key tekton.dev/docker-0=<domainname-of-registry>

# Docker Hub CR
kubectl create secret generic my-registry-secret --type="kubernetes.io/basic-auth" --from-literal=username=stillwater --from-literal=password=mykey
kubectl annotate secret my-registry-key tekton.dev/docker-0=hub.docker.com
