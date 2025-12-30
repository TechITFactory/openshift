# Troubleshooting: Module 01

## Operators show `Degraded=True`

- Run `oc describe co <name>` to surface failing conditions.
- Inspect recent events in the operator namespace: `oc get events -n <operator-namespace> --sort-by=.lastTimestamp`.
- If pods are crashlooping, get logs from the operator deployment: `oc logs deploy/<name> -n <operator-namespace>`.
- Pause upgrades until all operators are `Degraded=False`; upgrades fail fast when any operator is unhealthy.

## MachineConfig Pools stuck progressing

- Verify each node in the pool pulled the latest rendered config:

  ```bash
  oc get node/<node> -o jsonpath='{.metadata.annotations.machineconfiguration\.openshift\.io/currentConfig}'
  ```

- Compare the pool’s `Current` and `Updated` configs:

  ```bash
  oc describe mcp <pool>
  ```

- If nodes were manually modified (SSH edits), cordon and drain, then rebuild via the Machine API or bare-metal
  provisioning to restore immutability.

## Missing `openshift-*` namespaces

- Confirm the control-plane operators are running:

  ```bash
  oc get co | grep -E "apiserver|machine|network|ingress"
  ```

- If namespaces are terminating, list finalizers and clear blockers with caution:

  ```bash
  oc get namespace <name> -o jsonpath='{.spec.finalizers}'
  ```

  Avoid deleting platform namespaces directly; fix the owning operator instead.

## RHCOS SSH access needed

- SSH is discouraged; use `oc debug node/<node>` for temporary shells that respect the MachineConfig state.
- For break-glass access, add a short-lived SSH key to the appropriate MachineConfig and let the Machine Config Operator
  roll it out uniformly, then remove it after use.
