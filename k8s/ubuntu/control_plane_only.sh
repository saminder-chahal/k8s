#!/bin/bash
sudo kubeadm init --pod-network-cidr 192.168.0.0/16 --kubernetes-version 1.21.0

echo "\n\n\n\n"
echo "following other recommendations"
mkdir -o $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
