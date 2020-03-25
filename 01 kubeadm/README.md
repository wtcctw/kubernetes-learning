# Install Kubernetes v1.17.3 & Calico 3.11 using kubeadm

- 更新CentOS 7
    ```
    mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.bak 
    vi /etc/yum.repos.d/CentOS-Base.repo (用[aliyun]Centos-7.repo，或者[kaiyuanshe]Centos-7.repo内容替代，原因：http -> https)
    yum clean all && yum makecache
    yum update
    reboot
    ```

- 安装docker-ce 19.03
    ```
    yum install -y yum-utils device-mapper-persistent-data lvm2
    yum-config-manager --add-repo https://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
    yum makecache
    yum -y install docker-ce
    systemctl enable docker && systemctl start docker
    docker info
    ```

- 配置Kubernetes阿里云yum源
    ```
    cat <<EOF > /etc/yum.repos.d/kubernetes.repo
    [kubernetes]
    name=Kubernetes
    baseurl=https://mirrors.aliyun.com/kubernetes/yum/repos/kubernetes-el7-x86_64/
    enabled=1
    gpgcheck=1
    repo_gpgcheck=1
    gpgkey=https://mirrors.aliyun.com/kubernetes/yum/doc/yum-key.gpg https://mirrors.aliyun.com/kubernetes/yum/doc/rpm-package-key.gpg
    EOF
    yum makecache
    yum install -y kubelet kubeadm kubectl --disableexcludes=kubernetes
    systemctl enable kubelet && systemctl start kubelet
    ```
  
- 配置系统
    ```
    systemctl stop firewalld && systemctl disable firewalld
    
    # 临时禁用
    setenforce 0
    # 永久禁用 
    vi /etc/selinux/config    # 或者修改/etc/sysconfig/selinux
    SELINUX=disabled
  
    # 临时关闭
    swapoff -a
    # 永久关闭
    vi /etc/fstab  注释掉 SWAP 的自动挂载
  
    # 修改k8s.conf
    cat <<EOF >  /etc/sysctl.d/k8s.conf
    net.bridge.bridge-nf-call-ip6tables = 1
    net.bridge.bridge-nf-call-iptables = 1
    EOF
    sysctl --system
  
    #ip_forward
    # 临时
    echo 1 > /proc/sys/net/ipv4/ip_forward
    # 永久
    vi /etc/sysctl.conf  net.ipv4.ip_forward = 1
    ```

- kubeadm初始化集群
    ```
    kubeadm init --kubernetes-version 1.17.3 --image-repository registry.cn-hangzhou.aliyuncs.com/google_containers
    如果不能拉取镜像，那就只能先找个有镜像的docker，做docker save/load 操作
    根据kubeadm init最后的提示，进行操作
    ```

- 安装calico 3.11
    ```
    kubectl apply -f https://docs.projectcalico.org/v3.11/manifests/calico.yaml
    如果不能拉取镜像，那就只能先找个有镜像的docker，做docker save/load 操作
    ```

- kubeadm工作节点加入
    ```
    kubeadm join xxx
    注意kubeadm以及calico的镜像，都是需要的！
    ```

- 问题：NodePort不工作
```
iptables -P FORWARD ACCEPT  (docker在某个版本开始默认是DROP)
```

- 问题：NodePort Range
```
vim /etc/kubernetes/manifests/kube-apiserver.yaml 增加 --service-node-port-range=1-65535
```

- 优化：kubectl completion -h
