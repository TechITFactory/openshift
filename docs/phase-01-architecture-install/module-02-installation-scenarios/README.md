# Module 02: Installation Scenarios

## Overview

How you install OpenShift depends on who controls the infrastructure. Installer-Provisioned Infrastructure (IPI) is the “easy button” for greenfield or cloud-friendly teams, while User-Provisioned Infrastructure (UPI) fits regulated banks/telcos that must own every subnet, firewall rule, and load balancer. This module shows how to choose the right path, interpret `install-config.yaml`, and understand what the installer and bootstrap node actually do.

## Learning Objectives

- Differentiate IPI and UPI and match them to real-world constraints.
- Compare AWS, Azure, vSphere, and bare metal installation considerations.
- Read and customize `install-config.yaml` for common topologies.
- Explain the bootstrap node lifecycle and the installer’s workflow checkpoints.
- Simulate an install to validate configuration without creating infrastructure.

## Prerequisites

- Completion of Phase 00 Day-0 prerequisites and Phase 01 architecture overview.
- `openshift-install` binary for your target version (no cluster will be created).
- Access to a workstation that can run CLI tools and store generated manifests/ignition files.

## Content

### IPI vs UPI in practice

- **IPI (“easy mode”):** Installer creates load balancers, DNS records, IAM, and instances. Best for fast starts, PoCs, and teams comfortable letting the installer manage cloud resources.
- **UPI (“bank/telco mode”):** You create networks, DNS, TLS, and load balancers yourself. Required when change control is strict, private networks are isolated, or you must integrate with existing provisioning systems.

### Platform comparison

| Platform | Provisioning fit | Load balancer/DNS | Machine management | Notes |
| --- | --- | --- | --- | --- |
| AWS | IPI or UPI | Native ELB/NLB and Route 53 via installer | Machine API manages nodes | Fastest path; private-link and STS supported in UPI-heavy shops. |
| Azure | IPI or UPI | Azure LB and DNS zones via installer | Machine API manages nodes | Watch outbound control plane requirements and NSG rules. |
| vSphere | IPI or UPI | Needs NSX or external LB/DNS; often pre-created | Machine API supported with provider | Common in enterprises; storage and DHCP/IPAM readiness gate success. |
| Bare metal | Primarily UPI (IPI via Assisted/Agent-based) | External LB/DNS mandatory | Manual or Agent-based | Suits edge or regulated environments; plan for BMC access and PXE/ISO workflows. |

### `install-config.yaml` deep dive (key fields)

- **metadata**: `name`, `baseDomain`.
- **platform**: `aws|azure|vsphere|baremetal` blocks with region/clusterNetwork/machineNetwork specifics.
- **controlPlane/compute**: `replicas`, `name`, `architecture`, and `platform` overrides.
- **networking**: `networkType` (OVNKubernetes), `machineNetwork`, `clusterNetwork`, `serviceNetwork`.
- **pullSecret** and **sshKey**: mandatory for registry access and node login.
- **proxy/fips/additionalTrustBundle**: for disconnected or compliance-driven installs.

Example (trimmed) for IPI on AWS:

```yaml
apiVersion: v1
baseDomain: example.com
metadata:
  name: demo
platform:
  aws:
    region: us-east-1
    subnets: []        # optional: pre-created subnet IDs for UPI-like control
networking:
  networkType: OVNKubernetes
  clusterNetwork:
  - cidr: 10.128.0.0/14
    hostPrefix: 23
  serviceNetwork:
  - 172.30.0.0/16
compute:
- name: worker
  replicas: 3
controlPlane:
  name: master
  replicas: 3
pullSecret: '<REPLACE_WITH_PULL_SECRET>'
sshKey: 'ssh-rsa AAAA...'
```

> **Note:** Validate CIDRs against your existing network to avoid overlap with VPNs or on-prem ranges.

### Bootstrap node purpose and lifecycle

- Hosts the temporary control plane: runs `bootkube` to stand up the API server, etcd, and core operators.
- Serves ignition configs to other nodes and seeds etcd membership.
- Shut down once the control plane is self-hosted; it should not stay in the cluster.

### Installer workflow at a glance

1. Parse and validate `install-config.yaml`; create a copy in `.openshift_install.log`.
2. Generate manifests (`create manifests`) including MachineSets (IPI) and cluster configs.
3. Generate ignition configs (`create ignition-configs`) for bootstrap, control plane, and worker nodes.
4. For IPI: provision infrastructure (VPC/VNet, subnets, LBs, DNS, security groups) and launch bootstrap/control-plane machines.
5. Wait for `bootstrap-complete`: etcd healthy, control plane responding.
6. Remove bootstrap, scale workers, and wait for `install-complete` (cluster operators available, kubeconfig/admin kubeadmin password generated).

## Hands-On Lab

- **Title:** Install simulation (manifests and ignition only).
- **Duration:** ~30–45 minutes.
- **Outcome:** Practice validating `install-config.yaml` and inspecting generated assets without creating cloud resources.
- See [lab.md](./lab.md) for the step-by-step guide.

## Validation

- Use the lab verification checklist to confirm manifests/ignition files exist and the installer reports no validation errors.
- Confirm `metadata.json`, `auth/kubeconfig`, and `auth/kubeadmin-password` are produced during the simulation.

## Troubleshooting

- Common errors and resolutions live in [troubleshooting.md](./troubleshooting.md).

## Additional Resources

- Quiz yourself with [quiz.md](./quiz.md).
- Official references are collected in [references.md](./references.md).
