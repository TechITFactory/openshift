# Prerequisites

Use this checklist to prepare your workstation and lab environment before starting the course.

## Access

- One of: CodeReady Containers (CRC), Single Node OpenShift (SNO), or a multi-node lab cluster.
- Cluster admin or equivalent privileges for installation modules; project admin for most labs.

## Workstation Requirements

- 16GB RAM minimum (32GB recommended for CRC), 100GB free disk, 4+ CPU cores.
- Reliable broadband connectivity for pulling container images and dependencies.

## Tools

- `oc` CLI (required) and optional `kubectl`.
- `podman` or `docker` for building and testing images locally.
- `git`, `ssh`, `curl`, and a preferred text editor/IDE.

## Environment Prep

- Configure DNS or `/etc/hosts` entries for your lab cluster as needed.
- Ensure time synchronization (NTP/chrony) on all nodes.
- Validate outbound connectivity to required registries or mirror images locally for disconnected labs.

> **Tip:** Capture your environment details (OpenShift version, platform, network CIDRs) for reuse across labs.
