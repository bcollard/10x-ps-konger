# Klimax Fleets

## What is a Fleet

A Fleet is a whole cluster topology.

Declared once in a YAML manifest.

Share labs with your colleagues.


## The manifest

```yaml
apiVersion: klimax.dev/v1alpha1
kind: Fleet
spec:
  clusters:
    - name: ops
      labels:
        zone: eu-central-1
        role: o11y
    - name: acme-west
      labels:
        zone: eu-west-1
    - name: acme-east
      labels:
        zone: eu-east-2
```

## Workflow

```shell
klimax fleet create -f fleet.yaml
```

