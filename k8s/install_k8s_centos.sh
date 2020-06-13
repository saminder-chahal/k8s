# URL: https://phoenixnap.com/kb/how-to-install-kubernetes-on-centos

EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF

echo "Installing Kubelet Kubeadm and Kubectl"
yum install -y kubelet kubeadm kubectl
echo "Enabling Kubelet"
systemctl enable kubelet
systemctl start kubelet

## on Master NODE; add following ports to firewalld
sudo firewall-cmd --permanent --add-port=6443/tcp
sudo firewall-cmd --permanent --add-port=2379-2380/tcp
sudo firewall-cmd --permanent --add-port=10250/tcp
sudo firewall-cmd --permanent --add-port=10251/tcp
sudo firewall-cmd --permanent --add-port=10252/tcp
sudo firewall-cmd --permanent --add-port=10255/tcp
sudo firewall-cmd --reload

## on WORKER NODE
# sudo firewall-cmd --permanent --add-port=10251/tcp
# sudo firewall-cmd --permanent --add-port=10255/tcp
# firewall-cmd –-reload


# Update Iptable Settings
echo "Updating Iptable Setttings"
cat  < /etc/sysctl.d/master_node_name
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
sysctl --system


echo "Disable SELINUX"
sudo sed -i '/swap/d' /etc/fstab
sudo swapoff -a




