# Hadoop 2.7.3 在k8s部署

#### 首先你要做一个docker image
- 参见hadoop-image
- 注意点
    * hdfs:nn的core-site.xml 是 0.0.0.0
    * hdfs:dn的core-site.xml 是 nn-service
    * yarn:rm的yarn-site.xml 是 0.0.0.0
    * yarn:nm的yarn-site.xml 是 rm-service
    > 这些配置文件应该考虑用configmap！！！

#### 然后你需要给node打上标签，以便后续用DaemonSet
- nn,dn,rm,nm,jh
```
kubectl label nodes xx hdfs.nn=true hdfs.dn=true yarn.rm=true yarn.nm=true yarn.jh=true
node/xx labeled

kubectl label nodes xx hdfs.dn=true yarn.nm=true 

kubectl label nodes xx hdfs.dn=true yarn.nm=true
```

#### yaml
