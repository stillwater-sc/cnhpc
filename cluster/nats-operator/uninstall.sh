#!/usr/bin/env bash

# delete the NATS operator in reverse order of install
kubectl delete -f ./v0.7.4/10-deployment.yaml
kubectl delete -f ./v0.7.4/00-prereqs.yaml
