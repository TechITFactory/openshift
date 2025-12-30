# Lab Environment

Guidance for standing up and maintaining learning environments.

## Options

- **CodeReady Containers (CRC):** Fast local start; single-node; resource intensive.
- **Single Node OpenShift (SNO):** Production-like on one node; needs strong hardware.
- **Multi-Node Lab Cluster:** Closest to production; best for team exercises and advanced modules.

## General Tips

- Keep lab credentials and kubeconfigs secure but handy for validation steps.
- Snapshot or back up lab environments before risky changes.
- Clean up stale projects and persistent volumes between labs to reduce drift.
