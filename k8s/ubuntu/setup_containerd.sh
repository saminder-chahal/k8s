#!/bin/bash
echo "instructions url: https://kubernetes.io/docs/setup/production-environment/container-runtimes/#containerd"
sudo apt-get update && sudo apt-get install -y containerd
sudo mkdir -p /etc/containerd
sudo containerd config default | sudo tee /etc/containerd/config.toml
sudo systemctl restart containerd

echo "disable swap for stable k8s cluster"
sudo swapoff -a 
sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab
