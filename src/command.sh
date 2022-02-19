kubeadm token list
kubeadm token delete j4wtld.11b2vck3hpw9blb6
kubeadm create token --ttl 50h
kubeadm join 192.168.0.23:6443 --token j4wtld.11b2vck3hpw9blb6 \
    --discovery-token-ca-cert-hash sha256:cbc842ce0289855f655b52a9ab8600bec8fbbd6711e0394c33688ee14fae275a

kubectl get pods -o wide
kubectl run testpod --image=centos:7 --command sleep 5
kubectl run testpod --dry-run --image=centos:7 --command sleep 5
kubectl run testpod --dry-run --image=centos:7 --command sleep 5 -o yaml >  test.yaml

kubectl scale statefulset ss-mainui --replicas=4
kubectl scale statefulset ss-mainui --replicas=2

kubectl edit statefulsets.apps ss-mainui
kubectl describe statefulsets.apps ss-mainui
kubectl rollout undo statefulset ss-mainui
kubectl rollout history statefulset ss-mainui


