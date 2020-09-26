#!/usr/bin/env bash

# This script is for uninstalling OLM from a local staging
set -e

if [[ ${#@} -ne 1 ]]; then
    echo "Usage: $0 version"
    echo "* version: the local release version"
    exit 1
fi

release=$1
namespace=olm

kubectl delete -f "${release}/olm.yaml"
kubectl delete -f "${release}/crds.yaml"
