# OpenShift End-to-End Platform Operations

A comprehensive, hands-on course covering OpenShift platform operations from architecture to advanced management.

## 🎯 Course Overview

This repository contains a complete end-to-end training curriculum for OpenShift platform operations. The course takes students from foundational architecture concepts through advanced operational scenarios, with hands-on labs at every stage.

## 👥 Target Audience

This course is designed for:

- **Platform Engineers** looking to master OpenShift operations
- **System Administrators** transitioning to container platforms
- **DevOps Engineers** needing deep OpenShift operational knowledge
- **Site Reliability Engineers (SREs)** working with OpenShift environments
- **Cloud Architects** designing OpenShift-based solutions

## 📋 Prerequisites

Before starting this course, students should have:

- **Linux Systems Administration**: Comfortable with command-line operations, file systems, and basic troubleshooting
- **Container Fundamentals**: Understanding of containers, images, and basic Docker/Podman usage
- **Networking Basics**: Knowledge of TCP/IP, DNS, load balancing, and firewalls
- **Kubernetes Fundamentals**: Basic understanding of pods, deployments, services (helpful but not required)
- **YAML Syntax**: Ability to read and write YAML configuration files

For detailed prerequisites, see [docs/prerequisites/README.md](docs/prerequisites/README.md).

## 🗺️ Course Structure

The course is organized into eight phases, each building on the previous:

### Phase 1: Architecture & Installation
Understanding OpenShift architecture and performing installations in various scenarios.

### Phase 2: Core Operations
Day-to-day operational tasks including cluster management, node operations, and maintenance.

### Phase 3: Networking
Deep dive into OpenShift networking including SDN, ingress, egress, and network policies.

### Phase 4: Storage
Persistent storage management, storage classes, dynamic provisioning, and data protection.

### Phase 5: Security
Platform security including RBAC, SCC, secrets management, compliance, and hardening.

### Phase 6: Observability
Monitoring, logging, alerting, and troubleshooting with integrated and external tools.

### Phase 7: Application Management
GitOps, pipelines, image management, and application lifecycle operations.

### Phase 8: Plus Layer (Advanced)
Advanced topics including multi-cluster, backup/disaster recovery, performance tuning, and automation.

For a detailed module breakdown, see [docs/course-map.md](docs/course-map.md).

## 🔬 Lab Environment Options

Students can use any of the following environments:

### Option 1: CodeReady Containers (CRC)
- **Best for**: Individual learning, laptop-based practice
- **Requirements**: 16GB RAM minimum, 4 CPU cores, 35GB disk space
- **Setup**: See [labs/lab-environment/crc-setup.md](labs/lab-environment/)

### Option 2: Single Node OpenShift (SNO)
- **Best for**: Edge scenarios, resource-constrained environments
- **Requirements**: Single physical/virtual machine with adequate resources
- **Setup**: See [labs/lab-environment/sno-setup.md](labs/lab-environment/)

### Option 3: Full Lab Cluster
- **Best for**: Team training, production-like scenarios
- **Requirements**: Multi-node cluster (bare metal, VM, or cloud)
- **Setup**: See [labs/lab-environment/cluster-setup.md](labs/lab-environment/)

### Option 4: Cloud-based Lab
- **Best for**: Quick setup, no local resources needed
- **Providers**: AWS, Azure, GCP with OpenShift installer
- **Setup**: See [labs/lab-environment/cloud-setup.md](labs/lab-environment/)

## 📚 How to Use This Repository

### For Self-Paced Learning

1. **Review Prerequisites**: Start with [docs/prerequisites/](docs/prerequisites/)
2. **Setup Lab Environment**: Choose and configure your lab option
3. **Follow the Course Map**: Progress through phases sequentially
4. **Complete Hands-on Labs**: Each module includes practical exercises
5. **Build Your Capstone**: Apply all learnings in the final project

### For Instructors

1. **Review Style Guide**: Understand content structure in [docs/style-guide.md](docs/style-guide.md)
2. **Customize Content**: Adapt modules to your audience's needs
3. **Prepare Lab Environment**: Setup infrastructure before class
4. **Follow Module Templates**: Use standard formats for consistency
5. **Contribute Back**: Share improvements via pull requests

### For Contributors

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines on:
- Content standards and formatting
- Submitting improvements
- Testing procedures
- Review process

## 🧪 Capstone Project

The course culminates in a comprehensive capstone project that integrates all phases:

- Deploy a multi-tier application
- Implement security controls
- Configure monitoring and alerting
- Setup backup and disaster recovery
- Implement GitOps workflows
- Document operational procedures

Details: [capstone/README.md](capstone/)

## 🛠️ Repository Tools

The repository includes automation scripts in the `scripts/` directory:

- `check-markdown.sh`: Validate markdown formatting
- `check-links.sh`: Verify all internal and external links
- `generate-toc.sh`: Create table of contents for documents

CI/CD workflows automatically run these checks on pull requests.

## 🤝 Contributing

We welcome contributions! This is a community-driven project and your expertise helps make it better.

- **Found an Error?** Open an issue with details
- **Have an Improvement?** Submit a pull request
- **Want to Add Content?** Follow the style guide and module template
- **Have Questions?** Start a discussion

Read our [CONTRIBUTING.md](CONTRIBUTING.md) for detailed guidelines.

## 🔒 Security

Security is critical in platform operations. This course includes:
- Security-focused modules and best practices
- Regular content reviews for security updates
- Vulnerability disclosure process

See [SECURITY.md](SECURITY.md) for security policies and reporting procedures.

## 📜 Code of Conduct

This project follows a Code of Conduct to ensure a welcoming environment for all contributors.

See [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) for details.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## ⚠️ Disclaimers

- **Educational Purpose**: This content is for training and educational purposes
- **Not Official**: This is a community project, not officially endorsed by Red Hat
- **Lab Environments**: Use dedicated lab environments, never production systems
- **Version Specific**: Content targets OpenShift 4.x - verify compatibility with your version
- **No Warranty**: Provided "as is" without warranties of any kind

## 🔗 Additional Resources

- [OpenShift Documentation](https://docs.openshift.com/)
- [Red Hat Training](https://www.redhat.com/en/services/training-and-certification)
- [OpenShift Blog](https://www.openshift.com/blog)
- [Kubernetes Documentation](https://kubernetes.io/docs/)

## 🙏 Acknowledgments

This course is built on the collective knowledge of the OpenShift community, including:
- Red Hat documentation and training materials
- Community blog posts and tutorials
- Real-world operational experiences
- Contributor expertise and feedback

---

**Ready to begin?** Start with [docs/course-map.md](docs/course-map.md) to see the complete curriculum.
