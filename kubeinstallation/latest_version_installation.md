# both the server master and node 
    hostnamectl set-hostname kube-master.local

    apt update
    mkdir -p /etc/apt/keyrings
    curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.29/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
    echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.29/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
    sudo apt-get update
    sudo apt-get install -y apt-transport-https ca-certificates curl ipvsadm containerd
    sudo apt-get install -y kubelet kubeadm kubectl
    
    echo "net.bridge.bridge-nf-call-iptables = 1" >> /etc/sysctl.conf
    modprobe br_netfilter
    sysctl -p /etc/sysctl.conf
    echo 1 > /proc/sys/net/ipv4/ip_forward
    swapoff -a

    systemctl daemon-reload

# master node runs 
    kubeadm init



==============================================================================



Your Kubernetes control-plane has initialized successfully!

# To start using your cluster, you need to run the following as a regular user:

      mkdir -p $HOME/.kube
      sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
      sudo chown $(id -u):$(id -g) $HOME/.kube/config

# Alternatively, if you are the root user, you can run:

      export KUBECONFIG=/etc/kubernetes/admin.conf

You should now deploy a pod network to the cluster.
Run "kubectl apply -f [podnetwork].yaml" with one of the options listed at:
  https://kubernetes.io/docs/concepts/cluster-administration/addons/

# Then you can join any number of worker nodes by running the following on each as root:

    kubeadm join 192.168.2.45:6443 --token u4l73o.0v6cr0dl3afwevif \
        --discovery-token-ca-cert-hash sha256:853bffedc095b2dd51c04ff7e3cfe1dbd35e56224b8ef29103d7a8b9785fc1d0

===============================================================================


# add CNI to dns ready with the nodes
    kubectl apply -f https://github.com/weaveworks/weave/releases/download/v2.8.1/weave-daemonset-k8s.yaml


# bash auto-completes k alias command

    source <(kubectl completion bash)
    echo "source <(kubectl completion bash)" >> ~/.bashrc


    openssl x509 -req -in sudarshan.csr -CA CA_LOCATION/ca.crt -CAkey CA_LOCATION/ca.key -CAcreateserial -out sudarshan.crt -days 500

openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 -keyout sudarshan.key -out certificate.crt


kubectl config set-credentials sudarshan --client-key=/home/ubuntu/sudarshan.key --client-certificate=/home/ubuntu/certificate.crt --embed-certs=false

kubectl config set-context developer --user=martin --cluster=kubernetes
