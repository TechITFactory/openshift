# OpenShift End-to-End Platform Operations

A structured, hands-on curriculum for mastering Red Hat OpenShift Container Platform operations—from initial architecture choices through day-2+ platform management.

## Overview

- **Audience:** Platform/SRE/DevOps engineers, system administrators, and architects working with or moving to OpenShift.
- **What’s inside:** A phase-by-phase learning path, labs, capstone, diagrams, and reference appendices.
- **How to navigate:** Start with [docs/prerequisites](docs/prerequisites/), follow the [course map](docs/course-map.md), complete labs under `labs/`, and align all contributions with the [style guide](docs/style-guide.md).

## Prerequisites (quick view)

- **Access:** CRC, Single Node OpenShift (SNO), or a multi-node lab cluster.
- **System:** 16GB RAM minimum (32GB recommended for CRC), 100GB disk, 4+ cores.
- **Tools:** `oc` CLI (required), `kubectl` (optional), Git, SSH client, editor/IDE.
- Details live in [docs/prerequisites](docs/prerequisites/).

## Repository Structure

```text
openshift-end-to-end-platform-ops/
├── README.md
├── LICENSE
├── CONTRIBUTING.md
├── CODE_OF_CONDUCT.md
├── SECURITY.md
├── docs/
│   ├── course-map.md
│   ├── style-guide.md
│   ├── prerequisites/
│   ├── phase-01-architecture-install/
│   ├── phase-02-core-ops/
│   ├── phase-03-networking/
│   ├── phase-04-storage/
│   ├── phase-05-security/
│   ├── phase-06-observability/
│   ├── phase-07-app-management/
│   ├── phase-08-plus-layer/
│   └── appendices/
├── labs/
│   └── lab-environment/
├── capstone/
├── diagrams/
├── scripts/
├── assets/
└── .github/workflows/
```

## Learning Path

Eight phases build progressively across architecture, core ops, networking, storage, security, observability, application management, and advanced “plus layer” topics. The full outline with module-level links lives in [docs/course-map.md](docs/course-map.md).

## Lab Environments

- **CodeReady Containers (CRC):** Fast local start; single-node; resource intensive.
- **Single Node OpenShift (SNO):** Production-like on a single node; needs robust hardware.
- **Multi-Node Lab Cluster:** Closest to production; ideal for teams and advanced modules.

Environment setup guidance is in [labs/lab-environment](labs/lab-environment/) and [docs/prerequisites](docs/prerequisites/).

## How to Use

1. Review prerequisites and choose an environment.
2. Follow the course map in order; each phase builds on the previous one.
3. Complete labs as you progress; validate outcomes and note troubleshooting steps.
4. Use appendices and diagrams for quick reference.
5. Contribute back improvements following [CONTRIBUTING.md](CONTRIBUTING.md) and the [style guide](docs/style-guide.md).

### For Instructors

- Pair each phase with its labs; timebox modules; capture Q&A in appendices.
- Use the capstone as the culminating assessment and demo.

## Quality & Automation

- **Markdown lint:** `scripts/check-markdown.sh`
- **Link check:** `scripts/check-links.sh`
- **TOC helper:** `scripts/generate-toc.sh` (optional)
- CI runs markdown linting and link checking on pushes and pull requests (`.github/workflows/`).

## Contributing & Support

- Read [CONTRIBUTING.md](CONTRIBUTING.md) for workflow, style, and testing steps.
- Adhere to the [Code of Conduct](CODE_OF_CONDUCT.md).
- Report security issues via [SECURITY.md](SECURITY.md).

## License & Disclaimer

Licensed under [MIT](LICENSE). This repository is for educational use; validate against official Red Hat guidance before production use.
