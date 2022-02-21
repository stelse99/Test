kubeadm token list
kubeadm token delete j4wtld.11b2vck3hpw9blb6
kubeadm create token --ttl 50h
kubeadm join 192.168.0.23:6443 --token j4wtld.11b2vck3hpw9blb6 \
    --discovery-token-ca-cert-hash sha256:cbc842ce0289855f655b52a9ab8600bec8fbbd6711e0394c33688ee14fae275a

kubectl get pods -o wide
kubectl get pods -o yaml
kubectl get pods -o json
kubectl get pods --watch

kubectl get job,pods
kubectl get pods

kubectl delete job.apps centos-job

kubectl run testpod --image=centos:7 --command sleep 5
kubectl run testpod --dry-run --image=centos:7 --command sleep 5
kubectl run testpod --dry-run=client --image=centos:7 --command sleep 5 -o yaml >  test.yaml

kubectl scale statefulset ss-mainui --replicas=4
kubectl scale statefulset ss-mainui --replicas=2

kubectl edit statefulsets.apps ss-mainui

kubectl describe statefulsets.apps ss-mainui

kubectl rollout undo statefulset ss-mainui
kubectl rollout history statefulset ss-mainui

kubectl exec webui-5665757cd-mwhss -it -- /bin/bash
echo "webui #1" > /usr/share/nginx/html/index.html
echo "webui #2" > /usr/share/nginx/html/index.html
echo "webui #3" > /usr/share/nginx/html/index.html

## externalname Service
netstat -napt |grep 30200
curl externalname-service.default.svc.cluster.local

## headless Service
## statefullSet Controller 와 궁합이 잘맞다.
##coreDNS
kubectl run testpod -it --image=centos:7
If you don't see a command prompt, try pressing enter.
[root@testpod /]#
cat /etc/resolv.conf

## Pod 의 DNS 주소: pod-ip-address.namespace.pod.cluster.local
curl 10-5-3-7.default.pod.cluster.local


## 쿠버네티스 네트웍 모드
## kube-proxy
1.userspaces: 현재 사용 하지않음.
2. default  iptables -t nat  -S | grep 80
3. IPVS:
   -.리눅스 커널이 지원하는 L4 로드밸런스 기술이용.
   -.별도의 IPVS 지원 모듈을 설정한후 적용가능.
   -.지원알고리즘: rr(Round-Robin), lc(least connection), dh(destination hashing)
                 sh(source hashing), sed(shortest expected delay), nc(network queue)


## ingress
1. controller 설치
https://kubernetes.github.io/ingress-nginx/deploy/#bare-metal-clusters

kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.1.1/deploy/static/provider/baremetal/deploy.yaml

kubectl get pods -n ingress-nginx
kubectl get svc -n ingress-nginx

## namespace 치환방법
kubectl config -help
kubectl config view
kubectl config set-context ingress-admin@kubernetes --cluster=kubernetes --user=kubernetes-admin --namespace=ingress-nginx
kubectl config view
kubectl config use-context ingress-admin@kubernetes
kubectl config current-context
kubectl get all
kubectl apply -f marvel-home.yaml -f pay.yaml










