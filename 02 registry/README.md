# 国内可使用的公共镜像加速

#### Azure
- docker-hub, gcr
```
原：docker pull <imagename>:<version>
改：docker pull dockerhub.azk8s.cn/library/<imagename>:<version>

原1：docker pull gcr.io/google-containers/<imagename>:<version>
原2：docker pull k8s.gcr.io/<imagename>:<version>
改：docker pull gcr.azk8s.cn/google_containers/<imagename>:<version>

```


#### 阿里云
- gcr
```
原1：docker pull gcr.io/google-containers/<imagename>:<version>
原2：docker pull k8s.gcr.io/<imagename>:<version
改：docker pull registry.cn-hangzhou.aliyuncs.com/google_containers/<imagename>:<version>
```



#### 中科大
- docker-hub
```
原：docker pull <imagename>:<version>
改：docker pull docker.mirrors.ustc.edu.cn/library/<imagename>:<version>
```
