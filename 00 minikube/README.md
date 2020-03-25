# minikube

#### 在MacOS上安装minikube
1) ```brew cask install virtualbox```
2) ```brew cask install virtualbox-extension-pack```
3) ```brew install minikube```

#### 在MacOS上启动minikube
注意这里选择阿里云作为container的源

- 
```
  minikube start \
        --cpus=2 \ 
        --disk-size='10g' \
        --image-mirror-country='cn' \
        --image-repository='registry.cn-hangzhou.aliyuncs.com/google_containers'
```

#### 在MacOS试用minikube
注意这里同样可以选择阿里云作为image的源
1) ```kubectl create deployment hello-minikube --image=registry.cn-hangzhou.aliyuncs.com/google_containers/echoserver:1.10```
2) ```kubectl expose deployment hello-minikube --type=NodePort --port=8080```
3) ```kubectl get pod```
4) ```kubectl get deployment```
5) ```kubectl get service```
6) ```kubectl delete service xxx```
7) ```kubectl delete deployment xxx```

#### 在MacOS上停止和清理minikube
1) ```minikube stop```
2) ```minikube delete```


#### minikube研究
- .minikube 文件夹下的内容
```
.minikube
├── addons
├── apiserver.crt
├── apiserver.key
├── ca.crt
├── ca.key
├── ca.pem
├── cache
│   ├── images
│   │   ├── gcr.io
│   │   │   └── k8s-minikube
│   │   │       └── storage-provisioner_v1.8.1
│   │   ├── k8s.gcr.io
│   │   │   ├── coredns_1.6.5
│   │   │   ├── dashboard_v2.0.0-beta8
│   │   │   ├── etcd_3.4.3-0
│   │   │   ├── kube-apiserver_v1.17.3
│   │   │   ├── kube-controller-manager_v1.17.3
│   │   │   ├── kube-proxy_v1.17.3
│   │   │   ├── kube-scheduler_v1.17.3
│   │   │   ├── metrics-scraper_v1.0.2
│   │   │   └── pause_3.1
│   │   ├── kubernetesui
│   │   │   ├── dashboard_v2.0.0-beta8
│   │   │   └── metrics-scraper_v1.0.2
│   │   └── registry.cn-hangzhou.aliyuncs.com
│   │       └── google_containers
│   │           ├── coredns_1.6.5
│   │           ├── dashboard_v2.0.0-beta8
│   │           ├── etcd_3.4.3-0
│   │           ├── kube-apiserver_v1.17.3
│   │           ├── kube-controller-manager_v1.17.3
│   │           ├── kube-proxy_v1.17.3
│   │           ├── kube-scheduler_v1.17.3
│   │           ├── metrics-scraper_v1.0.2
│   │           ├── pause_3.1
│   │           └── storage-provisioner_v1.8.1
│   ├── iso
│   │   └── minikube-v1.7.3.iso
│   └── linux
│       └── v1.17.3
│           ├── kubeadm
│           ├── kubectl
│           └── kubelet
├── cert.pem
├── certs
│   ├── ca-key.pem
│   ├── ca.pem
│   ├── cert.pem
│   └── key.pem
├── client.crt
├── client.key
├── config
│   └── config.json
├── files
├── key.pem
├── last_update_check
├── logs
├── machines
│   ├── minikube
│   │   ├── boot2docker.iso
│   │   ├── config.json
│   │   ├── disk.vmdk
│   │   ├── id_rsa
│   │   ├── id_rsa.pub
│   │   └── minikube
│   │       ├── Logs
│   │       │   ├── VBox.log
│   │       │   ├── VBox.log.1
│   │       │   ├── VBox.log.2
│   │       │   └── VBox.log.3
│   │       ├── minikube.vbox
│   │       └── minikube.vbox-prev
│   ├── server-key.pem
│   └── server.pem
├── profiles
│   └── minikube
│       └── config.json
├── proxy-client-ca.crt
├── proxy-client-ca.key
├── proxy-client.crt
└── proxy-client.key
```

- minikube run起来之后的k8s resources
```
# kubectl get clusterrole,namespace,node,svc,ingress,cm,secret,pv,pvc,storageclass,deploy,rs,rc,ds,statefulsets,job,cj,pod -A -o wide

NAME                                                                                                         AGE
clusterrole.rbac.authorization.k8s.io/admin                                                                  14h
clusterrole.rbac.authorization.k8s.io/cluster-admin                                                          14h
clusterrole.rbac.authorization.k8s.io/edit                                                                   14h
clusterrole.rbac.authorization.k8s.io/kubernetes-dashboard                                                   14h
clusterrole.rbac.authorization.k8s.io/system:aggregate-to-admin                                              14h
clusterrole.rbac.authorization.k8s.io/system:aggregate-to-edit                                               14h
clusterrole.rbac.authorization.k8s.io/system:aggregate-to-view                                               14h
clusterrole.rbac.authorization.k8s.io/system:auth-delegator                                                  14h
clusterrole.rbac.authorization.k8s.io/system:basic-user                                                      14h
clusterrole.rbac.authorization.k8s.io/system:certificates.k8s.io:certificatesigningrequests:nodeclient       14h
clusterrole.rbac.authorization.k8s.io/system:certificates.k8s.io:certificatesigningrequests:selfnodeclient   14h
clusterrole.rbac.authorization.k8s.io/system:controller:attachdetach-controller                              14h
clusterrole.rbac.authorization.k8s.io/system:controller:certificate-controller                               14h
clusterrole.rbac.authorization.k8s.io/system:controller:clusterrole-aggregation-controller                   14h
clusterrole.rbac.authorization.k8s.io/system:controller:cronjob-controller                                   14h
clusterrole.rbac.authorization.k8s.io/system:controller:daemon-set-controller                                14h
clusterrole.rbac.authorization.k8s.io/system:controller:deployment-controller                                14h
clusterrole.rbac.authorization.k8s.io/system:controller:disruption-controller                                14h
clusterrole.rbac.authorization.k8s.io/system:controller:endpoint-controller                                  14h
clusterrole.rbac.authorization.k8s.io/system:controller:expand-controller                                    14h
clusterrole.rbac.authorization.k8s.io/system:controller:generic-garbage-collector                            14h
clusterrole.rbac.authorization.k8s.io/system:controller:horizontal-pod-autoscaler                            14h
clusterrole.rbac.authorization.k8s.io/system:controller:job-controller                                       14h
clusterrole.rbac.authorization.k8s.io/system:controller:namespace-controller                                 14h
clusterrole.rbac.authorization.k8s.io/system:controller:node-controller                                      14h
clusterrole.rbac.authorization.k8s.io/system:controller:persistent-volume-binder                             14h
clusterrole.rbac.authorization.k8s.io/system:controller:pod-garbage-collector                                14h
clusterrole.rbac.authorization.k8s.io/system:controller:pv-protection-controller                             14h
clusterrole.rbac.authorization.k8s.io/system:controller:pvc-protection-controller                            14h
clusterrole.rbac.authorization.k8s.io/system:controller:replicaset-controller                                14h
clusterrole.rbac.authorization.k8s.io/system:controller:replication-controller                               14h
clusterrole.rbac.authorization.k8s.io/system:controller:resourcequota-controller                             14h
clusterrole.rbac.authorization.k8s.io/system:controller:route-controller                                     14h
clusterrole.rbac.authorization.k8s.io/system:controller:service-account-controller                           14h
clusterrole.rbac.authorization.k8s.io/system:controller:service-controller                                   14h
clusterrole.rbac.authorization.k8s.io/system:controller:statefulset-controller                               14h
clusterrole.rbac.authorization.k8s.io/system:controller:ttl-controller                                       14h
clusterrole.rbac.authorization.k8s.io/system:coredns                                                         14h
clusterrole.rbac.authorization.k8s.io/system:discovery                                                       14h
clusterrole.rbac.authorization.k8s.io/system:heapster                                                        14h
clusterrole.rbac.authorization.k8s.io/system:kube-aggregator                                                 14h
clusterrole.rbac.authorization.k8s.io/system:kube-controller-manager                                         14h
clusterrole.rbac.authorization.k8s.io/system:kube-dns                                                        14h
clusterrole.rbac.authorization.k8s.io/system:kube-scheduler                                                  14h
clusterrole.rbac.authorization.k8s.io/system:kubelet-api-admin                                               14h
clusterrole.rbac.authorization.k8s.io/system:node                                                            14h
clusterrole.rbac.authorization.k8s.io/system:node-bootstrapper                                               14h
clusterrole.rbac.authorization.k8s.io/system:node-problem-detector                                           14h
clusterrole.rbac.authorization.k8s.io/system:node-proxier                                                    14h
clusterrole.rbac.authorization.k8s.io/system:persistent-volume-provisioner                                   14h
clusterrole.rbac.authorization.k8s.io/system:public-info-viewer                                              14h
clusterrole.rbac.authorization.k8s.io/system:volume-scheduler                                                14h
clusterrole.rbac.authorization.k8s.io/view                                                                   14h

NAME                             STATUS   AGE
namespace/default                Active   14h
namespace/kube-node-lease        Active   14h
namespace/kube-public            Active   14h
namespace/kube-system            Active   14h
namespace/kubernetes-dashboard   Active   14h

NAME            STATUS   ROLES    AGE   VERSION   INTERNAL-IP      EXTERNAL-IP   OS-IMAGE              KERNEL-VERSION   CONTAINER-RUNTIME
node/minikube   Ready    master   14h   v1.17.3   192.168.99.108   <none>        Buildroot 2019.02.9   4.19.94          docker://19.3.6

NAMESPACE              NAME                                TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)                  AGE   SELECTOR
default                service/kubernetes                  ClusterIP   10.96.0.1        <none>        443/TCP                  14h   <none>
kube-system            service/kube-dns                    ClusterIP   10.96.0.10       <none>        53/UDP,53/TCP,9153/TCP   14h   k8s-app=kube-dns
kubernetes-dashboard   service/dashboard-metrics-scraper   ClusterIP   10.101.231.248   <none>        8000/TCP                 14h   k8s-app=dashboard-metrics-scraper
kubernetes-dashboard   service/kubernetes-dashboard        ClusterIP   10.107.18.202    <none>        80/TCP                   14h   k8s-app=kubernetes-dashboard

NAMESPACE              NAME                                           DATA   AGE
kube-public            configmap/cluster-info                         2      14h
kube-system            configmap/coredns                              2      14h
kube-system            configmap/extension-apiserver-authentication   6      14h
kube-system            configmap/kube-proxy                           2      14h
kube-system            configmap/kubeadm-config                       2      14h
kube-system            configmap/kubelet-config-1.17                  1      14h
kubernetes-dashboard   configmap/kubernetes-dashboard-settings        0      14h

NAMESPACE              NAME                                                    TYPE                                  DATA   AGE
default                secret/default-token-tdxmp                              kubernetes.io/service-account-token   3      14h
kube-node-lease        secret/default-token-7b2gf                              kubernetes.io/service-account-token   3      14h
kube-public            secret/default-token-d2v7g                              kubernetes.io/service-account-token   3      14h
kube-system            secret/attachdetach-controller-token-b795k              kubernetes.io/service-account-token   3      14h
kube-system            secret/bootstrap-signer-token-98w44                     kubernetes.io/service-account-token   3      14h
kube-system            secret/bootstrap-token-470kfg                           bootstrap.kubernetes.io/token         6      14h
kube-system            secret/certificate-controller-token-wzpv9               kubernetes.io/service-account-token   3      14h
kube-system            secret/clusterrole-aggregation-controller-token-twtg6   kubernetes.io/service-account-token   3      14h
kube-system            secret/coredns-token-rmj8f                              kubernetes.io/service-account-token   3      14h
kube-system            secret/cronjob-controller-token-9mkl5                   kubernetes.io/service-account-token   3      14h
kube-system            secret/daemon-set-controller-token-kvdgl                kubernetes.io/service-account-token   3      14h
kube-system            secret/default-token-7xbj8                              kubernetes.io/service-account-token   3      14h
kube-system            secret/deployment-controller-token-jgcjh                kubernetes.io/service-account-token   3      14h
kube-system            secret/disruption-controller-token-7h6jr                kubernetes.io/service-account-token   3      14h
kube-system            secret/endpoint-controller-token-9ccvw                  kubernetes.io/service-account-token   3      14h
kube-system            secret/expand-controller-token-rvsvp                    kubernetes.io/service-account-token   3      14h
kube-system            secret/generic-garbage-collector-token-xls6w            kubernetes.io/service-account-token   3      14h
kube-system            secret/horizontal-pod-autoscaler-token-65rtj            kubernetes.io/service-account-token   3      14h
kube-system            secret/job-controller-token-fhwpx                       kubernetes.io/service-account-token   3      14h
kube-system            secret/kube-proxy-token-nsfjm                           kubernetes.io/service-account-token   3      14h
kube-system            secret/namespace-controller-token-w24c7                 kubernetes.io/service-account-token   3      14h
kube-system            secret/node-controller-token-m2fhb                      kubernetes.io/service-account-token   3      14h
kube-system            secret/persistent-volume-binder-token-ktn4z             kubernetes.io/service-account-token   3      14h
kube-system            secret/pod-garbage-collector-token-rg4tb                kubernetes.io/service-account-token   3      14h
kube-system            secret/pv-protection-controller-token-66mgs             kubernetes.io/service-account-token   3      14h
kube-system            secret/pvc-protection-controller-token-j5mkb            kubernetes.io/service-account-token   3      14h
kube-system            secret/replicaset-controller-token-r2mvh                kubernetes.io/service-account-token   3      14h
kube-system            secret/replication-controller-token-k5dxk               kubernetes.io/service-account-token   3      14h
kube-system            secret/resourcequota-controller-token-b9xv2             kubernetes.io/service-account-token   3      14h
kube-system            secret/service-account-controller-token-xrkr7           kubernetes.io/service-account-token   3      14h
kube-system            secret/service-controller-token-x7xkc                   kubernetes.io/service-account-token   3      14h
kube-system            secret/statefulset-controller-token-tqv9h               kubernetes.io/service-account-token   3      14h
kube-system            secret/storage-provisioner-token-xgbtl                  kubernetes.io/service-account-token   3      14h
kube-system            secret/token-cleaner-token-jgkds                        kubernetes.io/service-account-token   3      14h
kube-system            secret/ttl-controller-token-fr8d8                       kubernetes.io/service-account-token   3      14h
kubernetes-dashboard   secret/default-token-rpzd2                              kubernetes.io/service-account-token   3      14h
kubernetes-dashboard   secret/kubernetes-dashboard-certs                       Opaque                                0      14h
kubernetes-dashboard   secret/kubernetes-dashboard-csrf                        Opaque                                1      14h
kubernetes-dashboard   secret/kubernetes-dashboard-key-holder                  Opaque                                2      14h
kubernetes-dashboard   secret/kubernetes-dashboard-token-7js9v                 kubernetes.io/service-account-token   3      14h

NAMESPACE   NAME                                             PROVISIONER                RECLAIMPOLICY   VOLUMEBINDINGMODE   ALLOWVOLUMEEXPANSION   AGE
            storageclass.storage.k8s.io/standard (default)   k8s.io/minikube-hostpath   Delete          Immediate           false                  14h

NAMESPACE              NAME                                        READY   UP-TO-DATE   AVAILABLE   AGE   CONTAINERS                  IMAGES                                SELECTOR
kube-system            deployment.apps/coredns                     2/2     2            2           14h   coredns                     k8s.gcr.io/coredns:1.6.5              k8s-app=kube-dns
kubernetes-dashboard   deployment.apps/dashboard-metrics-scraper   1/1     1            1           14h   dashboard-metrics-scraper   kubernetesui/metrics-scraper:v1.0.2   k8s-app=dashboard-metrics-scraper
kubernetes-dashboard   deployment.apps/kubernetes-dashboard        1/1     1            1           14h   kubernetes-dashboard        kubernetesui/dashboard:v2.0.0-beta8   k8s-app=kubernetes-dashboard

NAMESPACE              NAME                                                   DESIRED   CURRENT   READY   AGE    CONTAINERS                  IMAGES                                                              SELECTOR
kube-system            replicaset.apps/coredns-6955765f44                     2         2         2       173m   coredns                     k8s.gcr.io/coredns:1.6.5                                            k8s-app=kube-dns,pod-template-hash=6955765f44
kube-system            replicaset.apps/coredns-7f9c544f75                     0         0         0       14h    coredns                     registry.cn-hangzhou.aliyuncs.com/google_containers/coredns:1.6.5   k8s-app=kube-dns,pod-template-hash=7f9c544f75
kubernetes-dashboard   replicaset.apps/dashboard-metrics-scraper-7b64584c5c   1         1         1       14h    dashboard-metrics-scraper   kubernetesui/metrics-scraper:v1.0.2                                 k8s-app=dashboard-metrics-scraper,pod-template-hash=7b64584c5c
kubernetes-dashboard   replicaset.apps/kubernetes-dashboard-79d9cd965         1         1         1       14h    kubernetes-dashboard        kubernetesui/dashboard:v2.0.0-beta8                                 k8s-app=kubernetes-dashboard,pod-template-hash=79d9cd965

NAMESPACE     NAME                        DESIRED   CURRENT   READY   UP-TO-DATE   AVAILABLE   NODE SELECTOR                 AGE   CONTAINERS   IMAGES                          SELECTOR
kube-system   daemonset.apps/kube-proxy   1         1         1       1            1           beta.kubernetes.io/os=linux   14h   kube-proxy   k8s.gcr.io/kube-proxy:v1.17.3   k8s-app=kube-proxy

NAMESPACE              NAME                                             READY   STATUS    RESTARTS   AGE    IP               NODE       NOMINATED NODE   READINESS GATES
kube-system            pod/coredns-6955765f44-ds4dp                     1/1     Running   3          173m   172.17.0.3       minikube   <none>           <none>
kube-system            pod/coredns-6955765f44-x7vdb                     1/1     Running   3          173m   172.17.0.5       minikube   <none>           <none>
kube-system            pod/etcd-minikube                                1/1     Running   3          174m   192.168.99.108   minikube   <none>           <none>
kube-system            pod/kube-apiserver-minikube                      1/1     Running   3          174m   192.168.99.108   minikube   <none>           <none>
kube-system            pod/kube-controller-manager-minikube             1/1     Running   3          174m   192.168.99.108   minikube   <none>           <none>
kube-system            pod/kube-proxy-hnqtg                             1/1     Running   3          173m   192.168.99.108   minikube   <none>           <none>
kube-system            pod/kube-scheduler-minikube                      1/1     Running   3          174m   192.168.99.108   minikube   <none>           <none>
kube-system            pod/storage-provisioner                          1/1     Running   12         14h    192.168.99.108   minikube   <none>           <none>
kubernetes-dashboard   pod/dashboard-metrics-scraper-7b64584c5c-x8nzz   1/1     Running   7          14h    172.17.0.4       minikube   <none>           <none>
kubernetes-dashboard   pod/kubernetes-dashboard-79d9cd965-s77vs         1/1     Running   12         14h    172.17.0.2       minikube   <none>           <none>

```
- 