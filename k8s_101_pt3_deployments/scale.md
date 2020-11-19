One thing that you can do is scale the number of pods across your cluster for high availability. In your `**hello-k8s.deployment.yml**` file look for replicas and increase it to **4**

Once you've done that apply the change
```
kubectl apply -f /root/k8s-katacoda-workshop/hello-k8s.deployment.yml
```{{execute}}

Now watch the change
```
kubectl get pods 
```{{execute}}


```
export PORT=$(kubectl get svc hello-k8s -o go-template='{{range.spec.ports}}{{if .nodePort}}{{.nodePort}}{{"\n"}}{{end}}{{end}}')
echo "https://[[HOST_SUBDOMAIN]]-${PORT}-[[KATACODA_HOST]].environments.katacoda.com/"
```{{execute}}

