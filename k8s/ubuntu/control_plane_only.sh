#!/bin/bash
sudo kubeadm init --pod-network-cidr 192.168.0.0/16 --kubernetes-version 1.25.2

echo "\n\n\n\n"
echo "following other recommendations"
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
