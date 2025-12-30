# Knowledge Check: Day-0 Prerequisites

1. Which DNS records must exist for every OpenShift 4.x install?  
   a) `api`, `api-int`, and `*.apps`  
   b) Only `api`  
   c) Only `*.apps`

2. Which ports must the API load balancer expose?  
   a) 443/80  
   b) 6443 and 22623  
   c) 2379/2380

3. Why is NTP critical during installation?  
   a) It improves pod scheduling speed.  
   b) TLS handshakes and etcd quorum depend on synchronized clocks.  
   c) It optimizes container image pulls.

4. When should you supply an `additionalTrustBundle`?  
   a) Only on public cloud installs.  
   b) When trusting internal registries, proxies, or MITM devices.  
   c) Never; OpenShift ignores it.

5. What is the primary purpose of a mirror registry in disconnected setups?  
   a) Store audit logs.  
   b) Host mirrored OpenShift release and operator images.  
   c) Replace DNS.

## Answer Key

1. a  
2. b  
3. b  
4. b  
5. b
