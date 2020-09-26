# Tektoncd Operator
The quickest and easiest way to install, upgrade and manage TektonCD Pipelines, Dashboard, Triggers on any Kubernetes Cluster.

Prerequisites
Kubernetes Cluster
kubectl
tkn (tektoncd/cli)

# Quick Start

The tektoncd-cli can be installed via brew and choco

```
λ choco install tektoncd-cli --confirm
Chocolatey v0.10.15
Installing the following packages:
tektoncd-cli
By installing you accept licenses for the packages.
Progress: Downloading tektoncd-cli 0.12.1... 100%

tektoncd-cli v0.12.1 [Approved]
tektoncd-cli package files install completed. Performing other installation steps.
Downloading tektoncd-cli 64 bit
  from 'https://github.com/tektoncd/cli/releases/download/v0.12.1/tkn_0.12.1_Windows_x86_64.zip'
Progress: 100% - Completed download of C:\Users\tomtz\AppData\Local\Temp\chocolatey\tektoncd-cli\0.12.1\tkn_0.12.1_Windows_x86_64.zip (10.58 MB).
Download of tkn_0.12.1_Windows_x86_64.zip (10.58 MB) completed.
Hashes match.
Extracting C:\Users\tomtz\AppData\Local\Temp\chocolatey\tektoncd-cli\0.12.1\tkn_0.12.1_Windows_x86_64.zip to C:\ProgramData\chocolatey\lib\tektoncd-cli\tools...
C:\ProgramData\chocolatey\lib\tektoncd-cli\tools
 ShimGen has successfully created a shim for tkn.exe
 The install of tektoncd-cli was successful.
  Software installed to 'C:\ProgramData\chocolatey\lib\tektoncd-cli\tools'

Chocolatey installed 1/1 packages.
 See the log for details (C:\ProgramData\chocolatey\logs\chocolatey.log).
```

```
$ brew tap tektoncd/tools
# brew install tektoncd/tools/tektoncd-cli
```

# Install Tektoncd Operator
To install the latest version of Tektoncd Operator, run
```
kubectl apply -f https://storage.googleapis.com/tekton-releases/operator/latest/release.notags.yaml
...
namespace/tekton-operator created
customresourcedefinition.apiextensions.k8s.io/tektonaddons.operator.tekton.dev created
customresourcedefinition.apiextensions.k8s.io/tektonpipelines.operator.tekton.dev created
deployment.apps/tekton-operator created
clusterrole.rbac.authorization.k8s.io/tekton-operator created
clusterrolebinding.rbac.authorization.k8s.io/tekton-operator created
serviceaccount/tekton-operator created
```

This will install the operator in tekton-operator namespace. 
Then the operator will automatically install Tekton Pipelines in the tekton-pipelines namespace.

# Check Tektoncd Pipelines Installation
```
Run

tkn version
...
Client version: 0.10.0
Pipeline version: v0.15.1
Triggers version: unknown
```

or check
```
kubectl get tektonpipelines cluster -o jsonpath='{.status.conditions[0]}'
---
map[code:installed version:v0.15.1]
```

# Test the PipelineRun

```
λ kubectl apply -f https://raw.githubusercontent.com/tektoncd/pipeline/release-v0.16.x/examples/v1beta1/pipelineruns/pipelinerun-with-params.yaml
pipeline.tekton.dev/pipeline-with-params created
task.tekton.dev/sum-params created
task.tekton.dev/multiply-params created
pipelinerun.tekton.dev/pipelinerun-with-params created
tomtz@sw-laptop-251 ~/Documents/dev/clones/cnhpc/tektoncd (master)
λ tkn pipelinerun ls
NAME                      STARTED          DURATION     STATUS
pipelinerun-with-params   13 seconds ago   12 seconds   Succeeded
tomtz@sw-laptop-251 ~/Documents/dev/clones/cnhpc/tektoncd (master)
λ tkn pipelinerun logs -f pipelinerun-with-params
[multiply-params : product] 50000

[sum-params : sum] 600
```