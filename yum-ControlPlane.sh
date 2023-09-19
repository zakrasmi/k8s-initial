echo -e "+++
echo "Install packages"
yum install vim sudo screen tmux -y

echo -e "+++"
echo "Add sudo user"
adduser zak
usermod -aG wheel zak

echo -e "+++"
echo "Prepare teh control-plane" 
kubeadm init \
--kubernetes-version="1.27.2" \
--pod-network-cidr=10.33.0.0/16 \
--upload-certs \
--apiserver-advertise-address $(hostname -i) \
--service-cidr="10.3.0.0/16" \
| tee kubeadm-init-test.log_$(date +"%Y-%m-%d-%H-%M-%S") # Save output for future review 
#--control-plane-endpoint="node:6443" \

echo -e "+++"
echo "Prepare networking"
kubectl apply -f https://raw.githubusercontent.com/cloudnativelabs/kube-router/master/daemonset/kubeadm-kuberouter.yaml

echo -e "+++"
echo "Prepare auto complete and aliases"
source <(kubectl completion bash) # set up autocomplete in bash into the current shell, bash-completion package should be installed first.
echo "source <(kubectl completion bash)" >> ~/.bashrc # add autocomplete permanently to your bash shell.
alias k=kubectl
complete -o default -F __start_kubectl k

