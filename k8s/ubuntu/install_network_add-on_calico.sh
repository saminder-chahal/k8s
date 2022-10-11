#!/bin/bash
echo "installing the network plugin"
kubectl apply -f https://docs.projectcalico.org/manifests/calico.yaml
echo "wait for some time and then run kubectl get nodes to see node in ready state"
