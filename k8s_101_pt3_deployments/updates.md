Kubernetes keeps track of all of the versions of a deployment. In fact you can view the history of this deployment!

```
kubectl rollout history deployment/hello-k8s
```{{execute}}

Now let's say you want to revert the current v2 of the container and go back to the last v1 deployment. Here's how you do it:

```
kubectl rollout undo deployment/hello-k8s
```{{execute}}

Here is how you can check the current status of a deployment
```
kubectl rollout status -w deployment/hello-k8s
```{{execute}}

And finally there may come a time where you want to do a rolling restart of every pod in a deployment. One option would be to one-by-one manually delete each pod and let it re-create. There's a simpler way! 

```
kubectl rollout status -w deployment/hello-k8s
```{{execute}}
