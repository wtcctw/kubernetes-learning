# Redis cluster 

- PV
```
# kubectl apply -f pv${num}.yaml
NAME   CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS   CLAIM                            STORAGECLASS   REASON   AGE     VOLUMEMODE
pv0    100Mi      RWO            Retain           Bound    default/redis-data-redis-app-1   manual                  3h18m   Filesystem
pv1    100Mi      RWO            Retain           Bound    default/redis-data-redis-app-0   manual                  3h18m   Filesystem
pv2    100Mi      RWO            Retain           Bound    default/redis-data-redis-app-2   manual                  3h18m   Filesystem
pv3    100Mi      RWO            Retain           Bound    default/redis-data-redis-app-5   manual                  3h18m   Filesystem
pv4    100Mi      RWO            Retain           Bound    default/redis-data-redis-app-3   manual                  3h18m   Filesystem
pv5    100Mi      RWO            Retain           Bound    default/redis-data-redis-app-4   manual                  3h18m   Filesystem
```

- ConfigMap
```
# kubectl create configmap redis-conf --from-file redis.conf
[root@ivyduan-gz-web-qnjgb redis-cluster-practice]# kubectl describe cm redis-conf
Name:         redis-conf
Namespace:    default
Labels:       <none>
Annotations:  <none>

Data
====
redis.conf:
----
#appendonly yes
cluster-enabled yes
cluster-config-file /var/lib/redis/nodes.conf
cluster-node-timeout 5000
#dir /var/lib/redis
port 6379
#loglevel debug

```


- Headless Service
```
# kubectl apply -f redis-cluster-headless.yaml
NAME            TYPE        CLUSTER-IP    EXTERNAL-IP   PORT(S)          AGE
redis-service   ClusterIP   None          <none>        6379/TCP         23h
```
> 注意点： ClusterIP为None，因为是一个Headless


- StatefulSet
```
# kubectl apply -f redis-cluster-stateful.yaml

查看

NAME                         READY   AGE     CONTAINERS   IMAGES
statefulset.apps/redis-app   6/6     3h10m   redis        registry.cn-qingdao.aliyuncs.com/gold-faas/gold-redis:1.0

NAME                                     READY   STATUS    RESTARTS   AGE     IP               NODE                               NOMINATED NODE   READINESS GATES
pod/redis-app-0                          1/1     Running   0          3h10m   192.168.107.33   xx          <none>           <none>
pod/redis-app-1                          1/1     Running   0          3h10m   192.168.18.87    xx   <none>           <none>
pod/redis-app-2                          1/1     Running   0          3h10m   192.168.48.142   xx            <none>           <none>
pod/redis-app-3                          1/1     Running   0          3h10m   192.168.107.34   xx         <none>           <none>
pod/redis-app-4                          1/1     Running   0          3h10m   192.168.18.88    xx   <none>           <none>
pod/redis-app-5                          1/1     Running   0          3h10m   192.168.48.143   xx            <none>           <none>


# kubectl get pvc
NAME                     STATUS   VOLUME   CAPACITY   ACCESS MODES   STORAGECLASS   AGE
redis-data-redis-app-0   Bound    pv1      100Mi      RWO            manual         3h12m
redis-data-redis-app-1   Bound    pv0      100Mi      RWO            manual         3h12m
redis-data-redis-app-2   Bound    pv2      100Mi      RWO            manual         3h12m
redis-data-redis-app-3   Bound    pv4      100Mi      RWO            manual         3h12m
redis-data-redis-app-4   Bound    pv5      100Mi      RWO            manual         3h12m
redis-data-redis-app-5   Bound    pv3      100Mi      RWO            manual         3h12m
```


- 创建redis cluster
```
登录到任意一台pod上
# kubectl exec -it redis-app-${num} -- /bin/bash
# redis-cli
# redis-cli --cluster create [ip:port] --cluster-replicas 1
```
> 注意：失败了，handshake后并没有成功，原因不明！可能就是iptables Drop的原因！

- 创建集群可访问，外部不能访问的Service


