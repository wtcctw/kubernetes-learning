# CKA-01

#### 记录一些我认为重要有用的东西

- Tab提示，很好用 
```
source < (kubectl completion bash|zsh)
```

- 用一个已Running的资源实例来生成yaml
```
kubectl get xxx/xxx -n ns -o yaml --export > x.yaml
```


- 直接run一个deployment
```
kubectl run nginx --image=nginx:1.7.9
```

- 暴露一个service
```
kubectl expose deploy xxx --port=xx --target-port=xx --type=NodePort
```


- 修改NodePort Range
```
[root@ivyduan-gz-web-qnjgb ~]# ll /etc/kubernetes/manifests/
total 16
-rw------- 1 root root 1852 Mar  4 08:31 etcd.yaml
-rw------- 1 root root 2689 Mar 19 07:03 kube-apiserver.yaml
-rw------- 1 root root 2429 Mar  4 08:31 kube-controller-manager.yaml
-rw------- 1 root root 1161 Mar  4 08:31 kube-scheduler.yaml

vim kube-apiserver.yaml
在apiserver的启动参数中加入 --service-node-port-range=1-65535
然后delete掉kube-apiserver这个pod，由于其是static pod，kubelet会自动重启他，请确保此目录下只有这四个yaml
```

- 关于暴露出NodePort后，还是无法在外部访问NodePort Service
```
用netstat观察，发现响应port已经是LISTEN，并且是被kube-proxy创建的
iptables -P FORWARD ACCEPT，开启转发
```

