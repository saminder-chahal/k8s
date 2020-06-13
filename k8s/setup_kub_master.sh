## Master config

echo "Using flanner virtual network for the pods communication"
sudo kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml

echo "Creating the Cluster"
sudo kubeadm init –pod-network-cidr=10.244.0.0/16

echo "Checking status of cluster"
sudo kubectl get pods --all-namespaces


## Manager Cluster as regular user settings
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
