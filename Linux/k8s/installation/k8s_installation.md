STEP1 (execute in all nodes)
---
#Docker installtion on master node and worker node
commands:
$ curl -fsSL https://get.docker.com -o get-docker.sh
$ sh get-docker.sh
---
STEP2: (execute in all nodes)
* move to root user (sudo -i)
# Run these commands as root
wget https://storage.googleapis.com/golang/getgo/installer_linux
chmod +x ./installer_linux
./installer_linux
source /root/.bash_profile

git clone https://github.com/Mirantis/cri-dockerd.git
cd cri-dockerd
mkdir bin
go build -o bin/cri-dockerd
mkdir -p /usr/local/bin
install -o root -g root -m 0755 bin/cri-dockerd /usr/local/bin/cri-dockerd
cp -a packaging/systemd/* /etc/systemd/system
sed -i -e 's,/usr/bin/cri-dockerd,/usr/local/bin/cri-dockerd,' /etc/systemd/system/cri-docker.service
systemctl daemon-reload
systemctl enable cri-docker.service
systemctl enable --now cri-docker.socket
---
STEP3:
# run the below commands in root 
* come to home of root user (cd ~)
* create a file 
* copy below commands to that file
* change the file permissions (sudo chmod 744 <file name>)
* Run the command (./<file name>)
""
#!/bin/sh
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl
sudo curl -fsSLo /etc/apt/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.g
echo "deb [signed-by=/etc/apt/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl
---
STEP4:(execute in master nodes)
kubeadm init --pod-network-cidr "10.244.0.0/16" --cri-socket "unix:///var/run/cri-dockerd.sock"
---
STEP 5: (execute in master node)
* exit from root user (exit)
* Run below commands 
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
kubectl apply -f https://github.com/flannel-io/flannel/releases/latest/download/kube-flannel.yml
---
STEP 6: 
* To add worker nodes to master node
* In worker node as a root user execute below command
* the below command is generated in master node at last 
* add cri-socket to that command as shown below.
kubeadm join 172.31.14.184:6443 --token bxshtg.51w2pxgp9u3jqtr6 \
--cri-socket "unix:///var/run/cri-dockerd.sock" --discovery-token-ca-cert-hash sha256:8593ab70510b50f84c4d7ace392d8e39c3e0860258fdbcade1b2ff8a9814f714




''
# Creating alias for my requirement
alias ka='kubectl apply -f'
alias kgp='kubectl get pods'
alias kar='kubectl api-resources'
alias kdp='kubectl describe pods'
alias kgpw='kubectl get pods -o wide'
alias kdp='kubectl delete pods'
alias kgs='kubectl get sevices'
alias kds='kubectl delete services'
alias krh='kubectl rollout history deployments/'
alias krs='kubectl rollout status deployments/'
alias kdd='kubectl describe deploy'