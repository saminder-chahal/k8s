#!/bin/bash

#In the control plane node, create the token and copy the kubeadm join command (NOTE:The join command can also be found in the output from kubeadm init command):
# kubeadm token create --print-join-command
# In both worker nodes, paste the kubeadm join command to join the cluster. Use sudo to run it as root:
# sudo kubeadm join ...
# In the control plane node, view cluster status (Note: You may have to wait a few moments to allow all nodes to become ready):
# kubectl get nodes
