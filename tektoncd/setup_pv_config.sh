#!/usr/bin/env bash

# Ask Tekton to request a Persistent Volume of 10Gi with the manual storage class when running a workflow

kubectl create configmap config-artifact-pvc \
	                 --from-literal=size=10Gi \
			 --from-literal=storageClassName=manual \
			 -o yaml -n tekton-pipelines \
			 --dry-run=client |                         kubectl replace -f -
