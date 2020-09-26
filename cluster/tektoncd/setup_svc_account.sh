#!/usr/bin/env bash

# Tekton uses the default service account in your Kubernetes cluster unless otherwise configured.
# To override the service account update the -default-service-account- attribute of the Configmap config-defaults

kubectl create configmap config-defaults \
	                  --from-literal=default-service-account=YOUR-SERVICE-ACCOUNT \
			  -o yaml -n tekton-pipelines \
			  --dry-run=client |                 kubectl replace -f -
