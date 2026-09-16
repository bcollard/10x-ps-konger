# Klimax

## What is it?

A full-stack CLI.

Made for you, happy macbook pro owners!


## Architecture

It's opinionated. For a good reason.

- Apple VZ (Virtualization Framework)
- Ubuntu VM
- Docker daemon
- KinD (Kubernetes in Docker) clusters
- MetalLB (Load Balancer for Kubernetes)


## Architecture overview

![Architecture overview](https://raw.githubusercontent.com/bcollard/klimax/refs/heads/main/docs/KLIMAX-HLD-architecture.png)



## Networking & Routing

The VM forwards IP packets to the KinD bridge network.

One subnet per cluster. 

- Cluster 1 - 172.30.1.0/24
- Cluster 2 - 172.30.2.0/24

One IP address per Service of type LoadBalancer.


## Docs website

https://klimax.dev/docs






