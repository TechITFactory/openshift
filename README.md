# OpenShift End-to-End Platform Operations

A comprehensive, hands-on course repository for mastering Red Hat OpenShift Container Platform operations, from architecture and installation through advanced platform management.

## 📋 Table of Contents

- [Overview](#overview)
- [Target Audience](#target-audience)
- [Prerequisites](#prerequisites)
- [Repository Structure](#repository-structure)
- [Learning Phases](#learning-phases)
- [Lab Environment](#lab-environment)
- [How to Use This Repository](#how-to-use-this-repository)
- [Contributing](#contributing)
- [License](#license)

## Overview

This repository provides a structured learning path for Red Hat OpenShift platform operations. It covers the complete lifecycle of OpenShift cluster management, from initial architecture decisions through day-2 operations, with a focus on practical, real-world scenarios.

The course is designed to be self-paced, with each phase building upon previous knowledge. Extensive hands-on labs reinforce theoretical concepts and best practices.

## Target Audience

This course is designed for:

- **Platform Engineers** looking to master OpenShift operations
- **Site Reliability Engineers (SREs)** managing container platforms
- **DevOps Engineers** working with OpenShift infrastructure
- **System Administrators** transitioning to container platforms
- **Solutions Architects** designing OpenShift deployments

### Expected Background

Learners should have:

- Basic understanding of Linux system administration
- Familiarity with containers and Docker/Podman
- Basic networking knowledge (TCP/IP, DNS, load balancing)
- Understanding of Kubernetes concepts (recommended but not required)

## Prerequisites

Before starting this course, ensure you have:

- **Access to OpenShift Environment**: CRC (CodeReady Containers), SNO (Single Node OpenShift), or a lab cluster
- **System Requirements**: 
  - 16GB RAM minimum (32GB recommended for CRC)
  - 100GB available disk space
  - Multi-core CPU (4+ cores recommended)
- **Tools**:
  - `oc` CLI tool installed
  - `kubectl` CLI tool (optional)
  - Git for version control
  - Text editor or IDE
  - SSH client

See [docs/prerequisites/](docs/prerequisites/) for detailed setup instructions.

## Repository Structure

```
openshift-end-to-end-platform-ops/
├── docs/                          # All documentation and learning modules
│   ├── prerequisites/             # Environment setup and prerequisites
│   ├── phase-01-architecture-install/  # Architecture and installation
│   ├── phase-02-core-ops/         # Core operations and day-1 tasks
│   ├── phase-03-networking/       # Networking configuration
│   ├── phase-04-storage/          # Storage management
│   ├── phase-05-security/         # Security and compliance
│   ├── phase-06-observability/    # Monitoring and logging
│   ├── phase-07-app-management/   # Application lifecycle
│   ├── phase-08-plus-layer/       # Advanced topics
│   ├── appendices/                # Reference materials
│   ├── course-map.md              # Complete course outline
│   └── style-guide.md             # Documentation standards
├── labs/                          # Hands-on lab exercises
│   └── lab-environment/           # Lab setup and configuration
├── capstone/                      # Final capstone project
├── diagrams/                      # Architecture and concept diagrams
├── scripts/                       # Utility scripts
├── assets/                        # Images and other media
└── .github/workflows/             # CI/CD for documentation quality
```

## Learning Phases

The course is organized into 8 progressive phases:

### Phase 1: Architecture & Installation
Understanding OpenShift architecture, deployment models, and installation methods.

### Phase 2: Core Operations
Essential day-1 operations, cluster configuration, and basic management tasks.

### Phase 3: Networking
Advanced networking concepts, SDN/OVN, routes, ingress, and network policies.

### Phase 4: Storage
Storage classes, persistent volumes, dynamic provisioning, and storage operators.

### Phase 5: Security
RBAC, security contexts, pod security policies, compliance, and hardening.

### Phase 6: Observability
Monitoring, logging, alerting, and troubleshooting with OpenShift-native tools.

### Phase 7: Application Management
Application deployment strategies, CI/CD integration, and GitOps workflows.

### Phase 8: Plus Layer
Advanced topics including bare metal, edge deployments, multi-cluster management, and disaster recovery.

For detailed module breakdown, see [docs/course-map.md](docs/course-map.md).

## Lab Environment

This course supports multiple lab environment options:

### Option 1: CodeReady Containers (CRC)
- **Best for**: Local development and learning
- **Requirements**: 16GB RAM, 100GB disk
- **Pros**: Free, runs locally, quick setup
- **Cons**: Single-node only, resource intensive

### Option 2: Single Node OpenShift (SNO)
- **Best for**: Edge deployments and constrained environments
- **Requirements**: Dedicated hardware/VM with 8+ cores, 32GB+ RAM
- **Pros**: Full OpenShift features, production-like
- **Cons**: Requires bare metal or proper VM setup

### Option 3: Multi-Node Lab Cluster
- **Best for**: Team learning and production simulation
- **Requirements**: Multiple VMs or bare metal nodes
- **Pros**: Most realistic, supports all features
- **Cons**: More complex setup, higher resource requirements

See [labs/lab-environment/](labs/lab-environment/) for detailed setup instructions for each option.

## How to Use This Repository

### Self-Paced Learning

1. **Start with Prerequisites**: Review and complete [docs/prerequisites/](docs/prerequisites/)
2. **Follow the Course Map**: Use [docs/course-map.md](docs/course-map.md) as your guide
3. **Complete Phases Sequentially**: Each phase builds on previous knowledge
4. **Hands-On Practice**: Complete all lab exercises in the `labs/` directory
5. **Reference Documentation**: Use `appendices/` for quick reference

### For Instructors

This repository can be used as a curriculum for instructor-led training:

- Each phase contains instructor notes and timing recommendations
- Labs include solutions and common troubleshooting steps
- Assessments are provided at the end of each phase

### Contributing Improvements

We welcome contributions! See [CONTRIBUTING.md](CONTRIBUTING.md) for:

- How to submit improvements
- Documentation style guide
- Lab exercise templates
- Review process

## Documentation Standards

All documentation follows the standards defined in [docs/style-guide.md](docs/style-guide.md), including:

- Module structure and required sections
- Markdown formatting conventions
- Code block and command formatting
- Screenshot and diagram guidelines

## Continuous Integration

This repository uses GitHub Actions to ensure documentation quality:

- **Markdown Linting**: Validates markdown syntax and style
- **Link Checking**: Verifies all internal and external links
- **Automated Testing**: Validates code examples and commands

## Disclaimers

- This is an **educational resource** and not official Red Hat documentation
- Lab exercises should be performed in **non-production environments only**
- While following Red Hat best practices, always refer to official Red Hat documentation for production deployments
- OpenShift versions and features may change; content is updated regularly but may not reflect the absolute latest version

## Support and Community

- **Issues**: Report problems or suggest improvements via [GitHub Issues](../../issues)
- **Discussions**: Join conversations in [GitHub Discussions](../../discussions)
- **Contributing**: See [CONTRIBUTING.md](CONTRIBUTING.md) for contribution guidelines

## Version

- **Current Version**: 1.0.0
- **OpenShift Version**: 4.14+ (content compatible with OpenShift 4.12+)
- **Last Updated**: December 2025

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

This course is built on community knowledge and Red Hat best practices. Special thanks to:

- Red Hat OpenShift documentation team
- OpenShift community contributors
- Platform engineering teams who shared real-world scenarios

---

**Ready to get started?** Head to [docs/course-map.md](docs/course-map.md) to begin your OpenShift journey!
