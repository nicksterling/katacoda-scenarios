If you delete a pod, it's gone forever. That's not very resilient. Deployments allow us to create pod definitions and manage the lifecycle of that pod. Let's create a **hello-k8s.deployment.yml** file:

```
cat << EOF > /root/k8s-katacoda-workshop/hello-k8s.deployment.yml
apiVersion: apps/v1
kind: Deployment
metadata:
  creationTimestamp: null
  labels:
    app: hello-k8s
  name: hello-k8s
spec:
  replicas: 1
  selector:
    matchLabels:
      app: hello-k8s
  strategy: {}
  template:
    metadata:
      creationTimestamp: null
      labels:
        app: hello-k8s
    spec:
      containers:
      - image: nicksterling/hello-kubernetes:1
        name: hello-kubernetes
        ports:
        - containerPort: 8080
        resources: {}
status: {}
EOF
```{{execute}}

And apply it: 
```
kubectl apply -f /root/k8s-katacoda-workshop/hello-k8s.deployment.yml
```{{execute}}

Now let's create a *hello-k8s.service.yml* service to point to our new Deployment
```
cat << EOF > /root/k8s-katacoda-workshop/hello-k8s.service.yml
apiVersion: v1
kind: Service
metadata:
  creationTimestamp: null
  labels:
    app: hello-k8s
  name: hello-k8s
spec:
  ports:
  - port: 8080
    protocol: TCP
    targetPort: 8080
  selector:
    app: hello-k8s
  type: NodePort
EOF
```{{execute}}

And apply it
```
kubectl apply -f /root/k8s-katacoda-workshop/hello-k8s.service.yml
```{{execute}}
