# Docker Host

## A real Docker daemon, no Docker Desktop

klimax runs an ordinary Docker daemon

```shell
docker run ...
docker compose up
```

Published ports mirror to localhost.


## Pull-through registry caches

Cached pulls for Docker Hub, quay.io, gcr.io, etc. 

Fewer rate limits, faster re-pulls.

Uses your existing pull-through registries set up for klimax clusters.


## Commands

```shell
klimax docker-context
eval $(klimax docker-env)
```

Port mirroring is off by default (avoids clashing with other Lima tools)

Turning it on requires recreating the VM and its clusters.
