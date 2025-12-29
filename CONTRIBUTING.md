# Contributing to OpenShift End-to-End Platform Operations

Thank you for your interest in contributing to this project! This document provides guidelines and instructions for contributing.

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [How Can I Contribute?](#how-can-i-contribute)
- [Getting Started](#getting-started)
- [Contribution Workflow](#contribution-workflow)
- [Documentation Standards](#documentation-standards)
- [Lab Exercise Guidelines](#lab-exercise-guidelines)
- [Review Process](#review-process)

## Code of Conduct

This project adheres to a Code of Conduct that all contributors are expected to follow. Please read [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) before contributing.

## How Can I Contribute?

### Reporting Issues

Before creating an issue:

- **Search existing issues** to avoid duplicates
- **Use issue templates** when available
- **Provide clear details**: What you expected vs. what happened
- **Include context**: OpenShift version, environment details, steps to reproduce

### Suggesting Enhancements

Enhancement suggestions are welcome! Please:

- **Explain the use case** and why it's valuable
- **Provide examples** of how it would work
- **Consider backwards compatibility** with existing content

### Contributing Content

We welcome contributions of:

- New learning modules or sections
- Lab exercises and scenarios
- Diagrams and illustrations
- Scripts and automation tools
- Documentation improvements
- Typo and error corrections

## Getting Started

1. **Fork the repository** to your GitHub account
2. **Clone your fork** locally:
   ```bash
   git clone https://github.com/YOUR_USERNAME/openshift.git
   cd openshift
   ```
3. **Create a branch** for your contribution:
   ```bash
   git checkout -b feature/your-contribution-name
   ```

## Contribution Workflow

### 1. Make Your Changes

Follow these guidelines:

- **One logical change per PR**: Keep pull requests focused
- **Follow style guide**: See [docs/style-guide.md](docs/style-guide.md)
- **Test your changes**: Verify commands, links, and formatting
- **Update relevant files**: README, course-map, etc.

### 2. Commit Your Changes

Use clear, descriptive commit messages:

```bash
git add .
git commit -m "Add networking troubleshooting lab exercise"
```

**Commit message format:**
```
<type>: <subject>

<body (optional)>

<footer (optional)>
```

**Types:**
- `docs`: Documentation changes
- `lab`: New or modified lab exercises
- `fix`: Bug fixes
- `feat`: New features
- `refactor`: Code/content restructuring
- `test`: Adding or modifying tests
- `chore`: Maintenance tasks

**Examples:**
```
docs: Add ingress controller configuration guide

lab: Create persistent volume lab for Phase 4

fix: Correct kubectl command in storage module
```

### 3. Push and Create Pull Request

```bash
git push origin feature/your-contribution-name
```

Then create a Pull Request on GitHub with:

- **Clear title** describing the change
- **Description** of what changed and why
- **References** to related issues (if any)
- **Testing notes** if applicable

### 4. Respond to Feedback

- Address reviewer comments promptly
- Make requested changes in new commits
- Update your PR when ready for re-review

## Documentation Standards

All documentation must follow our [style guide](docs/style-guide.md). Key points:

### Markdown Formatting

- Use ATX-style headers (`#`, `##`, `###`)
- Include a blank line before and after headers
- Use fenced code blocks with language identifiers
- Limit lines to 120 characters when possible

### Module Structure

Each learning module should include:

1. **Overview**: Brief introduction to the topic
2. **Learning Objectives**: Clear, measurable outcomes
3. **Prerequisites**: Required knowledge or completed modules
4. **Content**: Main teaching content with examples
5. **Hands-On Lab**: Practical exercises
6. **Validation**: How to verify learning outcomes
7. **Troubleshooting**: Common issues and solutions
8. **Additional Resources**: Links to further reading

### Command Examples

Format commands consistently:

```bash
# Show command prompt for user context
$ oc get nodes

# For commands requiring elevated privileges
$ sudo systemctl restart kubelet

# For multi-line commands, use backslash
$ oc create configmap my-config \
  --from-file=config.yaml \
  --namespace=my-namespace
```

### Screenshots and Diagrams

- Use PNG format for screenshots
- Include alt text for accessibility
- Store in `assets/` directory
- Keep file sizes reasonable (< 500KB)
- Use consistent naming: `phase-XX-description.png`

## Lab Exercise Guidelines

### Structure

Each lab should include:

1. **Objective**: What the lab teaches
2. **Prerequisites**: Required setup or previous labs
3. **Estimated Time**: How long it takes
4. **Environment**: CRC, SNO, or multi-node requirements
5. **Instructions**: Step-by-step guidance
6. **Validation**: How to verify success
7. **Cleanup**: Steps to reset the environment
8. **Troubleshooting**: Common issues

### Best Practices

- **Test thoroughly** in all supported environments
- **Provide expected outputs** for validation steps
- **Include troubleshooting tips** for common issues
- **Consider different skill levels** - add "Challenge" sections
- **Make labs idempotent** - can be run multiple times

### Example Lab Template

```markdown
# Lab X.Y: Topic Name

## Objective
Brief description of what students will learn.

## Prerequisites
- Module X completed
- Access to OpenShift cluster
- Specific tools or permissions needed

## Estimated Time
XX minutes

## Environment Requirements
- [ ] CRC (minimum 16GB RAM)
- [ ] SNO (minimum 32GB RAM)
- [ ] Multi-node cluster

## Instructions

### Step 1: Initial Setup
...

### Step 2: Configuration
...

## Validation
How to verify the lab was completed successfully.

## Cleanup
Steps to return environment to clean state.

## Troubleshooting
Common issues and solutions.
```

## Scripts and Automation

When contributing scripts:

- **Add comments** explaining the purpose
- **Include usage examples** in script headers
- **Handle errors gracefully** with clear messages
- **Make scripts idempotent** where possible
- **Test on multiple platforms** (Linux, macOS)

## Review Process

### Review Criteria

Pull requests are reviewed for:

- **Accuracy**: Technical correctness
- **Completeness**: All required sections present
- **Clarity**: Easy to understand
- **Style**: Follows style guide
- **Testing**: Commands and procedures verified
- **Links**: All links work correctly

### Review Timeline

- Initial review: Within 1-2 weeks
- Follow-up reviews: Within 1 week of updates
- Complex changes may take longer

### Merging

PRs are merged when:

- At least one maintainer approves
- All CI checks pass (linting, link checking)
- All review comments are addressed
- Content is tested and verified

## Community

### Communication Channels

- **GitHub Issues**: For bugs and feature requests
- **GitHub Discussions**: For questions and ideas
- **Pull Requests**: For code/content review

### Getting Help

- Review [docs/style-guide.md](docs/style-guide.md)
- Check existing issues and PRs
- Ask in GitHub Discussions

## Recognition

Contributors are recognized in:

- Repository README (major contributions)
- Release notes
- Individual module/lab acknowledgments

## Questions?

If you have questions about contributing:

1. Check this guide and the [style guide](docs/style-guide.md)
2. Search existing issues and discussions
3. Create a new discussion in GitHub Discussions
4. Tag maintainers if urgent

Thank you for contributing to OpenShift End-to-End Platform Operations! 🚀
