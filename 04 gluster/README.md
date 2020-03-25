# Gluster 


#### 安装GlusterFS集群并测试使用
- 更新yum源
```
# yum install centos-release-gluster
```

- 最好准备独立的磁盘和分区
```
# mkfs.xfs -i size=512 /dev/sdb1
# mkdir -p /bricks/brick1
# vi /etc/fstab
```

- 安装
```
# yum install glusterfs-server
# systemctl enable glusterd
# systemctl start glusterd
# systemctl status glusterd
```

- 查看是否成功
```
# gluster peer probe 10.199.222.81
# gluster peer probe 10.199.222.78
# gluster peer probe 10.199.222.80
```

- 配置
```
# mkdir -p /gluster/bricks/
# gluster volume create gv0 replica 3 \
10.199.222.81:/gluster/bricks/gv0 \
10.199.222.78:/gluster/bricks/gv0 \
10.199.222.80:/gluster/bricks/gv0
# gluster volume start gv0
# gluster volume info
```

- 客户端
```
# yum install -y glusterfs glusterfs-fuse
# mount -t glusterfs 10.199.222.81:/gv0 /mnt
```

#### 在Kubernetes上使用Gluster

- 创建endpoint
```
# kubectl create -f  glusterfs-endpoints.json
# kubectl get ep
```

- 创建service
```
# kubectl create -f  glusterfs-service.json
# kubectl get svc
```

- 创建pv
```
# kubectl create -f glusterfs-test-pv.yaml
```

- 创建pvc
```
# kubectl create -f glusterfs-pvc.yaml 
```

- 用centos 7 Deployment做个试验
```
# kubectl apply -f centos7-deployment-with-pvc.yaml
```
> 注意：pv要在gluster上创建并启动！在k8s任意节点上都要安装了gluster client

