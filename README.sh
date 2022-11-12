############################################ ALL NODES ########################################
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo apt-get update && sudo apt-get install -y apt-transport-https curl
# Add the google cloud package repository to your sources
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
cat <<EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF
sudo apt-get update

# Install components
sudo apt-get install -y kubelet kubeadm kubectl
# Hold version
sudo apt-mark hold kubelet kubeadm kubectl
sudo rm /etc/containerd/config.toml
sudo systemctl restart containerd

############################################ MASTER NODES ########################################

sudo kubeadm init --pod-network-cidr=10.244.0.0/16 --apiserver-advertise-address=0.0.0.0
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown (id -g) $HOME/.kube/config
kubectl apply -f https://raw.githubusercontent.com/flannel-io/flannel/master/Documentation/kube-flannel.yml
