# Lab: Inspect OpenShift 4 Architecture

## Overview

Estimated time: 20–30 minutes. Use this lab to map control-plane and data-plane services, read operator health, and
verify MachineConfig-driven immutability.

## Prerequisites

- `oc` CLI logged in as a cluster-admin or user with read access to cluster-scoped resources.
- Access to an OpenShift 4 cluster (lab, sandbox, or SNO).

## Steps

1. Check the release payload and upgrade controller:

   ```bash
   oc get clusterversion
   ```

2. Review operator health:

   ```bash
   oc get co
   ```

   | Status       | Meaning                                                                   |
   | ------------ | ------------------------------------------------------------------------- |
   | Available    | Operand is ready and serving traffic.                                     |
   | Progressing  | Changes are rolling out or resources are reconciling.                     |
   | Degraded     | The operator cannot reach desired state; investigate before continuing.   |

3. Inspect node roles and scheduling targets:

   ```bash
   oc get nodes
   ```

4. Confirm MachineConfig Pools (MCPs) that define immutable config for each node role:

   ```bash
   oc get mcp
   ```

5. List platform namespaces to see where control-plane services live:

   ```bash
   oc get ns | grep openshift
   ```

## Verification

- All Cluster Operators should show `Available=True` and `Degraded=False`.
- Nodes should be `Ready` with expected roles (`master`/`worker` or `control-plane`/`worker`).
- MCPs should report `UPDATED=True` and no `DEGRADED` state.
- `openshift-*` namespaces should include API, ingress, machine, and monitoring operators.

## Troubleshooting

- If any operator is `Degraded`, describe it for detail:

  ```bash
  oc describe co <name>
  ```

- For MCP issues, check rendered configs:

  ```bash
  oc get mc
  oc describe mcp <pool>
  ```

- See [troubleshooting.md](./troubleshooting.md) for deeper scenarios.

## Cleanup

No changes were applied in this lab. Close your terminal session or log out of `oc`:

```bash
oc logout
```
