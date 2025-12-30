# Quiz: Installation Scenarios

## Questions

1. When would you choose UPI over IPI in a bank or telco environment?
2. Which control plane ports must be reachable for bootstrap ignition delivery?
3. Name two platform-specific items the installer can create automatically on AWS/Azure during IPI.
4. Which `install-config.yaml` sections define cluster networking ranges?
5. What signals the installer to remove the bootstrap node?

## Answer key

1. When strict change control requires pre-created networks/DNS/LBs or cloud automation is restricted.
2. TCP 6443 (API) and 22623 (machine-config/ignition).
3. Load balancers and DNS records (plus IAM/NSGs, subnets, and instances).
4. The `networking` section (`machineNetwork`, `clusterNetwork`, `serviceNetwork`) and `networkType`.
5. Successful `bootstrap-complete` (control plane and etcd are healthy and self-hosted).
