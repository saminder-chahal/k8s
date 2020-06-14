## Master config

echo "Using flanner virtual network for the pods communication"
sudo kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
echo "========================================================"
echo "========================================================"
echo "Creating the Cluster"
sudo kubeadm init --pod-network-cidr=10.244.0.0/16
## RESET kubeadm init run "kubeadm reset"


echo "========================================================"
echo "========================================================"
echo "Enabling Kubelet"
systemctl enable kubelet
systemctl start kubelet
systemctl status kubelet
#DEBUG: sudo journalctl -xeu kubelet
## some of the configs files might be missing just use kubeadm init first; then try to restart kubelet

echo "========================================================"
echo "========================================================"
echo "Checking status of cluster"
sudo kubectl get pods --all-namespaces


echo "========================================================"
## Manager Cluster as regular user settings
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
