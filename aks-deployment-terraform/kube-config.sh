#! /bin/bash

echo "$(terraform output kube_config)" > ./azurek8s

cat ./azurek8s 
# if you see << EOT at the beginning and EOT at the end, remove these characters from the file. Otherwise, you may receive the following error message: error: error loadin
export KUBECONFIG=./azurek8s
kubectl get nodes
