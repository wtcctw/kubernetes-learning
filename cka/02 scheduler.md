# kubernetes的调度


- 打标签
```
kubectl label xxx key=value
kubectl label xxx key-
```


- nodeSelector, 将pod直接调度到某个node
```
kubectl explain pod.spec.nodeSelector

apiVersion: v1 
kind: Pod
metadata:
  name: my-pod
spec:
  containers:
  - name: nginx
    image: nginx:1.7.9
    ports:
      - containerPort: 80
        protocol: TCP
  nodeSelector:
    app: nginx
```


- nodeAffinity
```
apiVersion: v1 
kind: Pod
metadata:
  name: my-pod
spec:
  containers:
  - name: nginx
    image: nginx:1.7.9
    ports:
      - containerPort: 80
        protocol: TCP
  affinity: 
    nodeAffinity:
      requiredDuringSchedulingIgnoredDuringExecution: 
        nodeSelectorTerms:
        - matchExpressions:
          - key: app 
            operator: In 
            values:
            - nginx
```



- podAffinity
```
apiVersion: v1 
kind: Pod
metadata:
  name: my-pod
spec:
  containers:
  - name: nginx
    image: nginx:1.7.9
    ports:
      - containerPort: 80
        protocol: TCP
  affinity: 
    podAffinity:
      requiredDuringSchedulingIgnoredDuringExecution: 
      - labelSelector:
          matchExpressions:
          - key: app 
            operator: In 
            values:
            - nginx
        topologyKey: kubernetes.io/hostname

```


- pod-anti-affinity
```
apiVersion: v1 
kind: Pod
metadata:
  name: my-pod
spec:
  containers:
  - name: nginx
    image: nginx:1.7.9
    ports:
      - containerPort: 80
        protocol: TCP
  affinity: 
    podAntiAffinity:
      requiredDuringSchedulingIgnoredDuringExecution: 
      - labelSelector:
          matchExpressions:
          - key: app 
            operator: In 
            values:
            - nginx
        topologyKey: kubernetes.io/hostname
```


- taint
```
kubectl taint nodes node1 key=value:NoSchedule
kubectl taint nodes node1 key:NoSchedule-
```

- toleration
```
```


