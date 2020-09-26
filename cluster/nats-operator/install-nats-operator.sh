#!/usr/bin/env bash

kubectl apply -f ./v0.7.4/00-prereqs.yaml
kubectl apply -f ./v0.7.4/10-deployment.yaml

# kubectl apply -f https://github.com/nats-io/nats-operator/releases/download/v0.7.4/00-prereqs.yaml
# kubectl apply -f https://github.com/nats-io/nats-operator/releases/download/v0.7.4/10-deployment.yaml

# docker image
# docker run connecteverything/nats-operator:0.7.4


