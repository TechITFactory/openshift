# Troubleshooting Day-0 Prerequisites

## DNS and Load Balancers

- **Symptom:** `dig` returns no answer or wrong IPs for `api`/`api-int`/`*.apps`.
  - **Fix:** Update authoritative zone records; clear local caches; confirm split-horizon views match the nodes'
    resolving path.
- **Symptom:** `nc -zv api.<cluster>.<domain> 6443` fails.
  - **Fix:** Validate LB listener targets, security groups/firewall rules, and health checks. Ensure control plane
    nodes are registered and passing health probes.
- **Symptom:** Ingress ports 443/80 fail.
  - **Fix:** Confirm routers are scheduled on nodes the LB targets; check that the wildcard DNS points to the
    ingress VIP; verify the LB health probe path `.well-known/health` returns 200.

## Time Synchronization

- **Symptom:** `chronyc tracking` shows large offsets or unreachable sources.
  - **Fix:** Point nodes to reachable internal NTP servers; open UDP 123; restart chronyd and recheck with
    `chronyc sources -v`.
- **Symptom:** Certificates appear "not yet valid" during install.
  - **Fix:** Align system clocks and rerun the install; ensure BIOS/UEFI time is correct.

## Certificates and Trust

- **Symptom:** `openssl s_client` fails with `unable to get local issuer certificate`.
  - **Fix:** Add the internal CA to `additionalTrustBundle` in `install-config.yaml` and redeploy; verify the
    bundle includes full intermediate chain.
- **Symptom:** Router presents default cert instead of custom wildcard.
  - **Fix:** Recreate the secret in `openshift-ingress` and reference it via the `cluster` ingress controller
    `defaultCertificate` field.

## Disconnected / Mirror Registry

- **Symptom:** `oc adm release mirror` cannot authenticate.
  - **Fix:** Regenerate pull secret with mirror registry credentials (`podman login` then merge into the pull
    secret). Verify registry TLS trust matches your CA bundle.
- **Symptom:** Installer cannot pull payload from mirror.
  - **Fix:** Ensure `imageContentSources` entries are present in `install-config.yaml` and the mirror hosts the
    requested OpenShift release tag; validate connectivity with `oc image info ${LOCAL_REGISTRY}/...`.
