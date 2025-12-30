# Quiz: Module 01 Architecture

1. Which components live on the OpenShift control plane?  
   a) API Server, etcd, Scheduler, Controller Managers  
   b) User Deployments and DaemonSets  
   c) Ingress Controllers only  
   d) Registry Pods

2. Why is SSH discouraged on RHCOS nodes?  
   a) There is no SSH server available  
   b) Manual changes can break MachineConfig reconciliation on immutable hosts  
   c) SSH prevents upgrades from running  
   d) Logs cannot be collected over SSH

3. What does a Cluster Operator status of `Progressing=True` indicate?  
   a) Operator is unhealthy  
   b) Operator is rolling out changes or reconciling resources  
   c) Cluster is offline  
   d) Operator is idle

4. Which namespaces house platform components rather than user workloads?  
   a) `default` and `kube-system`  
   b) `openshift-*` namespaces  
   c) `my-project`  
   d) `user-apps`

5. What is the recommended way to get a root shell for diagnostics on a node?  
   a) `ssh core@node`  
   b) `oc debug node/<node>` to open a temporary pod-based shell  
   c) Install a package manager and log in locally  
   d) Shut down the node and mount its disk

## Answer Key

1. a  
2. b  
3. b  
4. b  
5. b
