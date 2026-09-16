# Kong AMA

## Ask Claude anything about Kong

Turns Claude into a Kong product expert.

https://github.com/KongHQ-CX/kong-ama


## What it will cover

- Gateway EE and Konnect (koko)
- AI GW v3.14+, AI GW v2.x
- Mesh/Kuma
- Operator/KIC
- Konnect Identity
- DecK, kongctl, Terraform, Helm charts
- developer docs
- Event Gateway
- Portal v3
- ADRs
- and more...


## How it works

Clone ~23 Kong source repos, 
and route questions to the right one.

CLAUDE.md is the router.

Idempotent fetch scripts with sparse-checkout.


## Internals

- `fetch-github-repos.sh` ➡️ git sync script
- `CLAUDE.md` ➡️ Question-routing table to each repo
- `./repos/` ➡️ Repos clones (git-ignored)


## Using it

```shell
cd kong-ama && claude

# or, from an existing session:
/add-dir /path/to/kong-ama
```


## Update weekly

```shell
./fetch-github-repos.sh
```

Run it once per week to keep it up to date.
