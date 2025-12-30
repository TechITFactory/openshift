# Lab: Install Simulation (Manifests & Ignition Only)

## Goal

Validate an `install-config.yaml`, generate manifests and ignition configs, and inspect the installer workflow without creating any cloud resources.

## Prerequisites

- `openshift-install` binary for the target version.
- Pull secret from cloud.redhat.com and an SSH public key.
- Local workspace with ~500 MB free disk.

> **Caution:** These commands do **not** provision infrastructure; they only write files locally so they are safe to run on a laptop.

## Steps

1. **Create a working directory**

   ```bash
   mkdir -p ~/ocp-install-sim && cd ~/ocp-install-sim
   ```

2. **Author `install-config.yaml` (replace placeholders)**

   ```yaml
   apiVersion: v1
   baseDomain: <your-basedomain>
   metadata:
     name: <cluster-name>
   platform:
     aws:
       region: <aws-region>
       # Optional: precreate subnets for tighter control
       # subnets:
       #   - <subnet-id-1>
   controlPlane:
     name: master
     replicas: 3
   compute:
   - name: worker
     replicas: 3
   networking:
     networkType: OVNKubernetes
     machineNetwork:
     - cidr: 10.0.0.0/16
     clusterNetwork:
     - cidr: 10.128.0.0/14
       hostPrefix: 23
     serviceNetwork:
     - 172.30.0.0/16
   pullSecret: '<REPLACE_WITH_PULL_SECRET_JSON>'
   sshKey: 'ssh-rsa AAAA...'
   ```

   - Keep CIDRs non-overlapping with your VPN or on-prem ranges.
   - For UPI-style control, precreate subnets and load balancers, then point the installer to them.

3. **Validate and create manifests**

   ```bash
   openshift-install create manifests --dir . --log-level=info
   ```

   - The installer fails fast if required fields are missing or CIDRs overlap.
   - Inspect generated files such as `manifests/cluster-scheduler-02-config.yaml` and `openshift/99_openshift-cluster-api_master-machines-*.yaml` to see how MachineSets are rendered (IPI).

4. **Generate ignition configs**

   ```bash
   openshift-install create ignition-configs --dir . --log-level=info
   ```

   - Produces `bootstrap.ign`, `master.ign`, and `worker.ign` plus `auth/kubeconfig` and `auth/kubeadmin-password`.
   - No nodes are created; these files would be consumed by your IPI (auto) or UPI (manually provisioned) hosts.

5. **Verification checklist**
   - `install-config.yaml` is preserved and `metadata.json` exists.
   - `manifests/` and `openshift/` directories are populated; no `ERROR` entries in `.openshift_install.log`.
   - Ignition files (`bootstrap.ign`, `master.ign`, `worker.ign`) exist and are non-empty.
   - `auth/kubeconfig` and `auth/kubeadmin-password` are present for later cluster access.

## Common validation errors and quick fixes

- **Invalid pullSecret format:** Ensure the entire JSON string (including braces) is quoted.
- **CIDR overlaps or too small:** Adjust `machineNetwork`, `clusterNetwork`, or `serviceNetwork` to non-overlapping ranges.
- **Unsupported baseDomain/region combo:** Match `baseDomain` to a public or private zone resolvable within your platform and select a region where it exists.
- **SSH key missing or malformed:** Provide a single-line public key without trailing comments.
- **Platform mismatch:** If targeting vSphere or bare metal, switch `platform.aws` to the correct platform block and include required fields (VIPs, API/LB addresses).

## Cleanup

Remove the simulation directory when finished:

```bash
rm -rf ~/ocp-install-sim
```
