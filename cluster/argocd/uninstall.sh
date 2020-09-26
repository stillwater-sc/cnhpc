#!/usr/bin/env bash

kubectl delete -n argocd -f install.yaml 
kubectl delete namespace argocd
