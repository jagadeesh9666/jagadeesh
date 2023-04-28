STEP1
---
#Docker installtion on master node and worker node
commands:
$ curl -fsSL https://get.docker.com -o get-docker.sh
$ sh get-docker.sh
---
STEP2:
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

''
# Creating alias for my requirement
* alias kaf='kubectl apply -f'
* alias kgp='kubectl get pods'
* alias kar='kubectl api-resources'
* alias kdp='kubectl describe pods'
* alias kgpw='kubectl get pods -o w'
* alias kd='kubectl delete -f'
