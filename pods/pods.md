A pod is the smallest unit of deployment in Kubernetes. It consists of one or more related containers that will deploy together on the same worker node. Pods will share networking and storage across all the grouped containers inside the pod.


> **NOTE**  
> A pod typically only has one container... but it can contain more than one. Examples would be a sidecar container that does some data initialization or a APM sidecar that pulls application metrics to name just a few. 


The simplest way to deploy a pod is declaratively. Run this command:
`kubectl run hello-k8s --restart=Never --image=nicksterling/hello-kubernetes:1 --port=8080`{{execute}}

Now let's see the running pod
`kubectl get pods`{{execute}}


Let's dive into the pod a little bit more and get more details
`kubectl describe pod hello-k8s`{{execute}}


## Declarative vs Imperative
Up to this point we've done everything imperatively. We've issued commands into the CLI and started up a pod. This is **not** the recommended way to work with Kubernetes. We recommend telling Kubernetes __declaratively__ using a manifest file the state of what we want and let Kubernetes figure out how to do it.

Let's remove the pod we've imperatively created. 
`kubectl delete pod hello-k8s`{{execute}}

Now let's create a manifest file called **pod.yml** and put this as the contents

```
cat << EOF > /tmp/storageos-secret.yaml
apiVersion: v1
kind: Pod
metadata:
  labels:
    run: hello-k8s
  name: hello-k8s
spec:
  containers:
  - image: nicksterling/hello-kubernetes:1
    name: hello-k8s
    ports:
    - containerPort: 8080
    resources: {}
  dnsPolicy: ClusterFirst
  restartPolicy: Never
status: {}
EOF
```{{execute}}

`foreground.sh`{{open}}

We have a pod again! Now up to this point we don't have an easy way to view this in a web browser. We need to expose that as a **service**. Let's go over that next. 