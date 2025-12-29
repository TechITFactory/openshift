# Contributing to OpenShift End-to-End Platform Operations

Thank you for your interest in contributing! This project thrives on community contributions and we appreciate your time and expertise.

## 🌟 Ways to Contribute

### Content Contributions
- **Fix Errors**: Correct technical inaccuracies, typos, or broken links
- **Improve Clarity**: Enhance explanations, add examples, or clarify concepts
- **Add Labs**: Create new hands-on exercises
- **Update Content**: Keep material current with latest OpenShift versions
- **Translate**: Help make content accessible in other languages

### Technical Contributions
- **Scripts**: Improve automation tools
- **CI/CD**: Enhance workflows and testing
- **Documentation**: Improve setup guides or tooling docs

### Community Contributions
- **Answer Questions**: Help others in discussions
- **Review PRs**: Provide feedback on proposed changes
- **Report Issues**: Document bugs or suggest improvements
- **Share Feedback**: Tell us what works and what doesn't

## 📋 Prerequisites for Contributors

Before contributing, ensure you have:

1. **Git Knowledge**: Familiarity with Git workflows (fork, branch, commit, PR)
2. **Markdown Skills**: Ability to write and format markdown
3. **OpenShift Experience**: Practical knowledge of the topics you're contributing to
4. **Lab Environment**: Access to test your content changes

## 🔄 Contribution Workflow

### 1. Find or Create an Issue

- **Existing Issues**: Check [Issues](../../issues) for open tasks
- **New Ideas**: Create an issue describing your proposed contribution
- **Discuss First**: For major changes, discuss in an issue before working

### 2. Fork and Clone

```bash
# Fork the repository on GitHub, then:
git clone https://github.com/YOUR-USERNAME/openshift.git
cd openshift
git remote add upstream https://github.com/TechITFactory/openshift.git
```

### 3. Create a Branch

```bash
# Create a descriptive branch name
git checkout -b feature/add-storage-module
# or
git checkout -b fix/correct-networking-lab
```

### 4. Make Your Changes

Follow these guidelines:

#### Content Standards
- **Follow the Style Guide**: See [docs/style-guide.md](docs/style-guide.md)
- **Use Templates**: Match the structure of existing modules
- **Include Examples**: Provide code snippets and command examples
- **Add Context**: Explain the "why" not just the "how"
- **Test Commands**: Verify all commands work in a lab environment

#### Writing Style
- **Clear and Concise**: Use simple language and short sentences
- **Active Voice**: Prefer "Create a pod" over "A pod is created"
- **Consistent Terminology**: Use OpenShift/Kubernetes standard terms
- **Practical Focus**: Emphasize hands-on operational tasks

#### Technical Accuracy
- **Version Specific**: Note if content is version-specific
- **Tested**: All commands and procedures must be tested
- **Best Practices**: Follow OpenShift and Kubernetes best practices
- **Security Conscious**: Never include credentials or sensitive data

### 5. Commit Your Changes

```bash
# Stage your changes
git add .

# Write a clear commit message
git commit -m "Add persistent storage lab with NFS example

- Create storage class configuration
- Add PVC and PV examples
- Include troubleshooting section
- Test on OpenShift 4.14"
```

#### Commit Message Guidelines
- **First Line**: Brief summary (50 chars or less)
- **Blank Line**: Separate summary from body
- **Body**: Detailed explanation of what and why (not how)
- **References**: Link to issues (e.g., "Fixes #123")

### 6. Test Your Changes

Run local checks before pushing:

```bash
# Check markdown formatting
./scripts/check-markdown.sh

# Validate links
./scripts/check-links.sh

# Generate TOC if needed
./scripts/generate-toc.sh
```

#### Manual Testing
- **Proofread**: Check for typos and clarity
- **Test Commands**: Run all commands in your lab
- **Verify Links**: Click all links to ensure they work
- **Check Formatting**: Preview markdown rendering

### 7. Push and Create Pull Request

```bash
# Push to your fork
git push origin feature/add-storage-module
```

Then on GitHub:
1. Navigate to your fork
2. Click "New Pull Request"
3. Fill out the PR template completely
4. Request reviews if needed

#### Pull Request Guidelines

**Title**: Clear and descriptive
```
Add persistent storage module with hands-on lab
```

**Description**: Include:
- **What**: Summary of changes
- **Why**: Motivation and context
- **How**: Brief explanation of approach
- **Testing**: How you tested the changes
- **Related Issues**: Link to issue numbers

**Example PR Description**:
```markdown
## What
Adds a comprehensive persistent storage module to Phase 4.

## Why
Addresses issue #42 - students need hands-on practice with storage operations.

## Changes
- Created docs/phase-04-storage/01-persistent-storage.md
- Added lab exercises with NFS and Ceph examples
- Included troubleshooting guide
- Added diagrams for storage architecture

## Testing
- Tested all commands on OpenShift 4.14 cluster
- Verified NFS provisioner setup
- Validated dynamic provisioning workflows
- Checked all links and formatting

Closes #42
```

### 8. Respond to Feedback

- **Be Responsive**: Reply to review comments promptly
- **Be Open**: Accept constructive criticism gracefully
- **Explain Decisions**: Justify your choices if needed
- **Make Changes**: Update your PR based on feedback

```bash
# Make requested changes
git add .
git commit -m "Address review feedback: clarify NFS setup steps"
git push origin feature/add-storage-module
```

## 📝 Content Guidelines

### Module Structure

Every module should follow this structure (see [docs/style-guide.md](docs/style-guide.md)):

1. **Overview**: What and why
2. **Prerequisites**: Required knowledge/setup
3. **Concepts**: Theory and architecture
4. **Procedures**: Step-by-step tasks
5. **Labs**: Hands-on exercises
6. **Troubleshooting**: Common issues
7. **References**: Additional resources

### Lab Exercise Guidelines

Good labs should:
- **Have Clear Objectives**: State what students will learn
- **Be Self-Contained**: Include all necessary information
- **Progress Logically**: Build from simple to complex
- **Include Verification**: Show how to confirm success
- **Provide Solutions**: Offer answer keys or solution guides

### Code Examples

```yaml
# Good: Includes comments and context
# Storage Class for NFS Dynamic Provisioning
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: nfs-storage
  annotations:
    storageclass.kubernetes.io/is-default-class: "true"
provisioner: nfs.csi.k8s.io
parameters:
  server: nfs-server.example.com
  share: /exports/openshift
```

```bash
# Good: Show expected output
$ oc get storageclass
NAME                    PROVISIONER
nfs-storage (default)   nfs.csi.k8s.io
```

## 🧪 Testing Requirements

### Before Submitting

- [ ] All commands tested in lab environment
- [ ] Markdown formatting validated
- [ ] Links checked and working
- [ ] Images/diagrams included and referenced
- [ ] Code examples syntax-checked
- [ ] Spelling and grammar checked
- [ ] Follows style guide

### CI/CD Checks

Pull requests automatically run:
- **Markdown Linting**: Ensures consistent formatting
- **Link Checking**: Validates all URLs
- **Spell Checking**: Catches common typos

Fix any CI failures before requesting review.

## 🔍 Review Process

### What Reviewers Look For

1. **Technical Accuracy**: Is the content correct?
2. **Clarity**: Is it easy to understand?
3. **Completeness**: Does it cover the topic adequately?
4. **Consistency**: Does it match project style?
5. **Testability**: Can steps be followed successfully?

### Timeline

- **Initial Review**: Within 3-5 business days
- **Follow-up**: 1-2 days after updates
- **Merge**: After approval and passing CI checks

### Reviewer Responsibilities

Reviewers will:
- Provide constructive feedback
- Test content in their own lab
- Suggest improvements
- Approve or request changes

## 🏆 Recognition

We value our contributors! Contributors are:
- Credited in commit history
- Recognized in release notes
- Added to contributor lists (with permission)
- Building their professional portfolio

## 💬 Communication

### Ask Questions

Don't hesitate to ask:
- **GitHub Issues**: For specific problems or proposals
- **Pull Requests**: For feedback on your changes
- **Discussions**: For general questions or ideas

### Be Respectful

- Follow our [Code of Conduct](CODE_OF_CONDUCT.md)
- Be patient and courteous
- Assume good intentions
- Help create a welcoming community

## 📚 Resources for Contributors

### Documentation Standards
- [docs/style-guide.md](docs/style-guide.md) - Content standards
- [docs/course-map.md](docs/course-map.md) - Course structure

### Tools
- [Markdown Guide](https://www.markdownguide.org/)
- [OpenShift Docs](https://docs.openshift.com/)
- [Kubernetes Docs](https://kubernetes.io/docs/)

### Learning Resources
- Set up a lab environment (see README.md)
- Review existing modules for examples
- Check issues labeled "good first issue"

## 🐛 Reporting Bugs

Found an issue? Help us fix it:

### Good Bug Reports Include

1. **Clear Title**: Summarize the problem
2. **Description**: What's wrong?
3. **Location**: Which file/section?
4. **Expected vs Actual**: What should happen vs what does happen
5. **Steps to Reproduce**: How to see the problem
6. **Environment**: OpenShift version, platform, etc.
7. **Screenshots**: If applicable

### Example Bug Report

```markdown
**Title**: Storage lab NFS commands fail on OpenShift 4.14

**Description**:
The NFS storage class creation commands in docs/phase-04-storage/01-persistent-storage.md
fail with provisioner not found error.

**Location**: 
docs/phase-04-storage/01-persistent-storage.md, line 45-60

**Expected**:
Storage class should be created successfully

**Actual**:
Error: provisioner nfs.csi.k8s.io not found

**Reproduce**:
1. Follow setup steps in section 2.1
2. Run command: oc apply -f storage-class.yaml
3. Observe error message

**Environment**:
- OpenShift 4.14.3
- Bare metal installation
- RHEL 9 nodes

**Fix**:
Provisioner name should be updated to "nfs.csi.openshift.io" for OpenShift 4.14+
```

## 🎯 Good First Issues

New to contributing? Look for:
- Issues labeled `good first issue`
- Typo fixes
- Broken link repairs
- Documentation clarifications
- Simple lab improvements

## 📋 Contributor Checklist

Before submitting your PR:

- [ ] Created issue or found existing one
- [ ] Forked and cloned repository
- [ ] Created feature branch
- [ ] Made changes following style guide
- [ ] Tested all commands/procedures
- [ ] Ran markdown linter
- [ ] Checked all links
- [ ] Wrote clear commit messages
- [ ] Created descriptive PR
- [ ] Requested review if needed

## ❓ Questions?

If something is unclear:
1. Check existing documentation
2. Search closed issues
3. Ask in discussions
4. Create a new issue

Thank you for contributing to OpenShift End-to-End Platform Operations! Your expertise and effort help the entire community learn and grow.

---

**Happy Contributing! 🚀**
