# Demo 1

## What you will see

Claude Code + klimax in action

"Spin up two clusters and expose nginx on each as a Service of type LoadBalancer"

## The prompt

```text
Create two clusters "demo-west" and "demo-east",
then deploy nginx on each, as a Service type LB
```

## What happens under the hood

```shell
klimax cluster create demo-west
klimax cluster create demo-east

kubectl --context demo-west create deployment nginx --image=nginx
kubectl --context demo-west expose deployment nginx --type=LoadBalancer --port=80

kubectl --context demo-east create deployment nginx --image=nginx
kubectl --context demo-east expose deployment nginx --type=LoadBalancer --port=80
```

## Payoff

Each Service gets a real, routable IP.

curl them directly

No port-forward, no conflicts. 
