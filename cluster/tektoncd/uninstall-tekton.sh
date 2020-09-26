#!/usr/bin/env bash

# first delete the dashboard
kubectl delete -f dashboard/tekton-dashboard-release.yaml

# now delete the Tekton operator
release=v0.16.3
kubectl delete -f $release/release.yaml

