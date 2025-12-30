# Troubleshooting: Installation Scenarios

## Quick diagnostics

- Check `.openshift_install.log` for `ERROR` or `FATAL` lines.
- Confirm DNS: `dig api.<cluster>.<baseDomain>` and `dig *.apps.<cluster>.<baseDomain>` resolve inside the target network.
- Verify load balancers and health probes reach the control plane ports (6443 for API, 22623 for ignition).

## Frequent issues and fixes

- **Bootstrap not reachable:** Security groups/NSGs or firewalls block 6443/22623. Open required ports between load balancer, control plane, and bootstrap.
- **Stuck before bootstrap-complete:** Check bootstrap node logs (`journalctl -b -u bootkube`) and ensure etcd DNS (`_etcd-server-ssl._tcp`) records exist for control plane nodes.
- **Machine API cannot create workers (IPI):** IAM/roles missing. Re-run `create manifests` to confirm MachineSet definitions, then validate cloud credentials (STS/roles on AWS, Managed Identity on Azure).
- **UPI ignition served incorrectly:** Make sure bootstrap HTTP(S) server is reachable by control plane nodes and the right ignition URLs are embedded in your boot media.
- **Invalid certificates or trust:** If using custom CAs, include `additionalTrustBundle` in `install-config.yaml` and regenerate ignition configs.
- **Proxy/disconnected installs fail:** Add `proxy:` configuration and mirror the release image; set `release-image-overrides` in the Agent/bare metal `install-config.yaml` when pointing to a mirrored release payload.

## When to switch strategies

- If cloud automation is blocked by policy, pivot to UPI but keep the same `install-config.yaml` networking and node sizing choices.
- For bare metal with recurring failures around DHCP/PXE, consider Agent-based Installer to leverage ISO provisioning and built-in preflight checks.
