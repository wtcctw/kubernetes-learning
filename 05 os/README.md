# 启动一个CentOS 7 

- 准备Deployment yaml文件
``` centos7-deployment.yaml```
> 注意点：container的command不能少，要让这个container一直跑着！

- 创建Deployment
```
kubectl apply -f centos7-deployment.yaml
```

- 查看状态
```
# kubectl get deployment,rs,pod -o wide
deployment.apps/centos-deployment
replicaset.apps/centos-deployment-6b9d45bc65
pod/centos-deployment-6b9d45bc65-prln5
```
> 注意点：看命名