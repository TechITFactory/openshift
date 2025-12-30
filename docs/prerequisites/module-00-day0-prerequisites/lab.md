# Lab: Validate Day-0 Prerequisites

## Overview

Use this lab to confirm DNS, load balancer reachability, time sync, and certificate trust before running
`openshift-install`. Commands are copy-paste friendly and rely on standard utilities.

## Estimated Time

20–30 minutes.

## Requirements

- Workstation with `dig`, `nc`, `curl`, `chronyc`, `podman` (or `docker`), and `oc`.
- Network access to the same subnets/VIPs your installer host will use.
- Credentials for any internal registry (if mirroring).

## Set Variables

```bash
export CLUSTER_NAME="CLUSTER_NAME"
export DOMAIN="DOMAIN"
export API_VIP="api.${CLUSTER_NAME}.${DOMAIN}"
export APPS_VIP="apps.${CLUSTER_NAME}.${DOMAIN}"
```

> **Note:** Replace `CLUSTER_NAME` and `DOMAIN` with your values (for example, `ocp4` and `example.com`).

## Step 1: Verify DNS

```bash
dig +short api.${CLUSTER_NAME}.${DOMAIN}
dig +short api-int.${CLUSTER_NAME}.${DOMAIN}
dig +short console-openshift-console.apps.${CLUSTER_NAME}.${DOMAIN}
```

Check that `api-int` returns control plane node IPs and the `*.apps` host returns the ingress VIP.

## Step 2: Validate Load Balancer Ports

```bash
for port in 6443 22623; do
  nc -zv ${API_VIP} ${port}
done

for port in 443 80; do
  nc -zv ${APPS_VIP} ${port}
done
```

If TLS interception is in place, confirm the router health endpoint:

```bash
curl -k https://${APPS_VIP}/.well-known/health
```

## Step 3: Check Time Synchronization

```bash
chronyc tracking
chronyc sources -v
```

Verify sources show `^*` or `^+` and the reported offset is within a few milliseconds.

## Step 4: Validate Certificates and Trust

If using a custom CA, ensure the bundle is available:

```bash
ls -l ~/install-config/ca-bundle.pem
sha256sum ~/install-config/ca-bundle.pem
```

Test trust toward an internal endpoint (registry or proxy):

```bash
openssl s_client -connect registry.${DOMAIN}:443 -CAfile ~/install-config/ca-bundle.pem -verify_return_error </dev/null
```

## Step 5: Dry-Run Mirror Planning (Disconnected)

```bash
export LOCAL_REGISTRY="mirror.${DOMAIN}:5000"
export OCP_RELEASE="4.14.0"
export LOCAL_REPO="ocp4/openshift4"

oc adm release info quay.io/openshift-release-dev/ocp-release:${OCP_RELEASE}-x86_64
oc adm release mirror -a ~/pull-secret.json \
  --from=quay.io/openshift-release-dev/ocp-release:${OCP_RELEASE}-x86_64 \
  --to=${LOCAL_REGISTRY}/${LOCAL_REPO} \
  --apply-release-image-signature --dry-run
```

Review the generated `imageContentSources` output for use in `install-config.yaml`.

## Verification

- DNS commands return expected VIPs/node IPs; no `SERVFAIL` or empty results.
- `nc -zv` reports `succeeded` for 6443/22623 (API) and 443/80 (ingress).
- `chronyc tracking` shows a valid reference ID and small offset (typically <100 ms).
- `openssl s_client` ends with `Verify return code: 0 (ok)` when using your CA bundle.
- Mirror dry-run lists image sources without errors.

## Cleanup

```bash
unset CLUSTER_NAME DOMAIN API_VIP APPS_VIP LOCAL_REGISTRY OCP_RELEASE LOCAL_REPO
```

Remove any temporary CA bundles or pull secrets from shared filesystems after validation.
