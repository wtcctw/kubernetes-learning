# Redis

- 准备Deployment yaml文件
``` redis-deployment.yaml```

- 创建Deployment
```
kubectl apply -f redis-deployment.yaml
```

- 查看状态
```
# kubectl get deployment,rs,pod -o wide
deployment.apps/redis-master
replicaset.apps/redis-master-79c8884b77
pod/redis-master-79c8884b77-vsr5g
```
> 注意点：看命名

- 准备Service yaml文件
``` redis-service.yaml```

- 创建Service（NodePort），使其可以通过node的ip接收外部访问
```
# kubectl apply -f redis-service.yaml
```

- 查看状态
```
# kubectl get svc,deploy,rs,pod -o wide

service/redis-master    NodePort    10.99.93.88   <none>        6379:32099/TCP   19h   app=redis,role=master,tier=backend
deployment.apps/redis-master
replicaset.apps/redis-master-79c8884b77
pod/redis-master-79c8884b77-vsr5g
```
> 注意点： 看service的Type是NodePort，并且其开放的端口范围