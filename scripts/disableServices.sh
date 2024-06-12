#kubelet & runtime
systemctl stop kubelet
systemctl stop docker / crio
iptables --flush
iptables -tnat --flush
systemctl start kubelet
systemctl start docker / crio

#coredns deployment
kubectl rollout restart deployment coredns --namespace

#proxy
kubectl delete pod -n kube-system kube-proxy-xxx-xxx

#firewalld
systemctl stop firewalld
systemctl disable firewalld