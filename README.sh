sudo apt-get update -y

sudo apt-get install docker.io -y

sudo systemctl enable docker

sudo systemctl start docker

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add

sudo apt-get install curl -y

sudo apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"

sudo apt-get install kubeadm kubelet kubectl -y

sudo apt-mark hold kubeadm kubelet kubectl

sudo kubeadm init --pod-network-cidr=10.244.0.0/16

kubectl taint node m1 node-role.kubernetes.io/master:NoSchedule-

sudo kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml

#============================================================== V command only on workers ============================================================

kubeadm join 10.0.0.40:6443 --token abc --discovery-token-ca-cert-hash sha256:def
