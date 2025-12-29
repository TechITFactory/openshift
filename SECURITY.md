# Security Policy

## 🔒 Our Security Commitment

Security is a fundamental aspect of platform operations. This repository is dedicated to providing secure, best-practice content for OpenShift operations.

## 🛡️ Scope

### What This Policy Covers

This security policy applies to:

1. **Repository Content**: Documentation, scripts, and configuration examples
2. **Infrastructure**: CI/CD pipelines, automation tools
3. **Lab Materials**: Example configurations and lab environments

### What This Policy Does NOT Cover

- **Production Systems**: This is a training repository; use dedicated lab environments
- **OpenShift Product**: For OpenShift product security, see [Red Hat Security](https://access.redhat.com/security)
- **Third-party Tools**: Security of external tools referenced in content

## 🚨 Reporting a Vulnerability

### When to Report

Please report security vulnerabilities if you discover:

- **Exposed Credentials**: Passwords, API keys, tokens, or certificates in repository
- **Insecure Code Examples**: Lab code that could introduce vulnerabilities if used in production
- **Malicious Content**: Scripts or configurations that could harm systems
- **Supply Chain Issues**: Compromised dependencies or scripts
- **Sensitive Data**: Personal information, internal URLs, or proprietary information

### How to Report

**DO NOT** open a public issue for security vulnerabilities.

#### Private Reporting (Preferred)

1. **Via GitHub Security Advisories** (Recommended):
   - Go to the [Security tab](../../security/advisories)
   - Click "Report a vulnerability"
   - Fill out the form with details

2. **Via Email** (Alternative):
   - Send to: [security@example.com] (replace with actual contact)
   - Subject: "Security Vulnerability in openshift-platform-ops"
   - Include details (see below)

#### What to Include

Your report should contain:

```markdown
**Summary**: Brief description of the vulnerability

**Location**: File path and line numbers

**Issue Type**: 
- [ ] Exposed credentials
- [ ] Insecure code example
- [ ] Malicious content
- [ ] Other: ___________

**Description**: 
Detailed explanation of the security issue

**Impact**:
What could happen if exploited?

**Reproduction Steps**:
1. Step one
2. Step two
3. ...

**Suggested Fix**:
How might this be resolved?

**Discoverer**:
Your name/handle (for credit, optional)
```

### Example Report

```markdown
**Summary**: Hard-coded password in lab script

**Location**: labs/lab-environment/setup-script.sh, line 42

**Issue Type**: Exposed credentials

**Description**: 
The setup script contains a hard-coded database password that could
be copied by users into their environments.

**Impact**:
If users deploy this in a real environment, they could be using a
publicly-known password, creating a security risk.

**Reproduction Steps**:
1. Open labs/lab-environment/setup-script.sh
2. View line 42: DB_PASSWORD="openshift123"
3. Note hard-coded credential

**Suggested Fix**:
Replace with placeholder and documentation on how to set secure passwords:
DB_PASSWORD="${DB_PASSWORD:-CHANGEME}"

**Discoverer**: @securityresearcher
```

## 📨 Response Process

### Timeline

- **Acknowledgment**: Within 48 hours of report
- **Initial Assessment**: Within 5 business days
- **Status Updates**: Every 7 days until resolved
- **Resolution**: Varies by severity (see below)

### Severity Levels

#### Critical (P0) - Fix within 24 hours
- Exposed production credentials
- Malicious code that could harm systems
- Active exploitation in the wild

#### High (P1) - Fix within 7 days
- Exposed test credentials that could be repurposed
- Code examples with serious security flaws
- Sensitive data exposure

#### Medium (P2) - Fix within 30 days
- Code examples lacking security best practices
- Outdated security recommendations
- Missing security context/warnings

#### Low (P3) - Fix within 90 days
- Documentation improvements
- Additional security guidance
- Non-critical best practice updates

### Resolution Steps

1. **Triage**: Assess severity and impact
2. **Acknowledge**: Confirm receipt to reporter
3. **Investigation**: Verify and understand issue
4. **Fix Development**: Create and test resolution
5. **Private Review**: Review fix with reporter
6. **Deployment**: Merge fix to repository
7. **Disclosure**: Public announcement (if warranted)
8. **Credit**: Recognize reporter (with permission)

## 🔐 Security Best Practices in Content

All content in this repository should follow these principles:

### Never Include

- ❌ Real passwords, API keys, tokens, or certificates
- ❌ Production URLs, IP addresses, or infrastructure details
- ❌ Personal information or user data
- ❌ Proprietary or confidential information
- ❌ Code with known vulnerabilities

### Always Include

- ✅ Placeholder credentials (e.g., `CHANGEME`, `YOUR_PASSWORD_HERE`)
- ✅ Security warnings for sensitive operations
- ✅ Best practice recommendations
- ✅ References to official security documentation
- ✅ Instructions to use secure alternatives

### Code Example Standards

```yaml
# ❌ BAD: Hard-coded credentials
apiVersion: v1
kind: Secret
metadata:
  name: db-secret
stringData:
  password: "admin123"
```

```yaml
# ✅ GOOD: Placeholder with instructions
apiVersion: v1
kind: Secret
metadata:
  name: db-secret
stringData:
  # IMPORTANT: Replace with a strong password
  # Generate with: openssl rand -base64 32
  password: "REPLACE_WITH_SECURE_PASSWORD"
```

```bash
# ❌ BAD: Direct credential in command
oc login https://api.cluster.example.com:6443 --token=sha256~abc123xyz789

# ✅ GOOD: Environment variable or prompt
oc login https://api.cluster.example.com:6443 --token="${OCP_TOKEN}"
# Or prompt user:
oc login https://api.cluster.example.com:6443
```

### Security Context in Documentation

Always provide security context:

```markdown
## Setting Up Authentication

⚠️ **Security Note**: This lab uses basic authentication for simplicity. 
In production environments:
- Use certificate-based authentication
- Implement least-privilege access
- Rotate credentials regularly
- Enable audit logging

### Lab Setup (Non-Production Only)
...
```

## 🛠️ Security Tools and Checks

### Automated Scanning

This repository uses automated security scanning:

- **Dependency Scanning**: GitHub Dependabot
- **Secret Scanning**: GitHub Secret Scanning
- **Code Scanning**: CodeQL (for scripts)
- **Link Checking**: Validates URLs haven't been compromised

### Manual Reviews

Security-focused reviews occur:
- Before merging significant changes
- Quarterly security audits
- When new security tools become available
- After security incidents are reported

## 📚 Security Resources

### OpenShift Security

- [OpenShift Security Guide](https://docs.openshift.com/container-platform/latest/security/index.html)
- [Red Hat Security Advisories](https://access.redhat.com/security/security-updates/)
- [OpenShift Hardening Guide](https://docs.openshift.com/container-platform/latest/security/hardening.html)

### Kubernetes Security

- [Kubernetes Security](https://kubernetes.io/docs/concepts/security/)
- [CIS Kubernetes Benchmark](https://www.cisecurity.org/benchmark/kubernetes)
- [NIST Application Container Security Guide](https://www.nist.gov/publications/application-container-security-guide)

### General Security

- [OWASP Top Ten](https://owasp.org/www-project-top-ten/)
- [CWE Top 25](https://cwe.mitre.org/top25/)
- [CVE Database](https://cve.mitre.org/)

## 🏅 Security Hall of Fame

We recognize security researchers who help us improve (with their permission):

<!-- Security contributors will be listed here -->
*Be the first to help us improve security!*

## ⚖️ Disclosure Policy

### Coordinated Disclosure

We follow responsible disclosure practices:

1. **Private Report**: Reporter contacts us privately
2. **Acknowledgment**: We confirm receipt
3. **Investigation**: We verify and develop fix
4. **Resolution**: We deploy the fix
5. **Public Disclosure**: We announce after fix is deployed (typically 90 days)

### Public Disclosure

For significant vulnerabilities, we will:
- Publish a security advisory
- Credit the discoverer (with permission)
- Describe the issue and fix
- Provide remediation guidance
- Update affected documentation

## 📋 Security Checklist for Contributors

When contributing, ensure:

- [ ] No credentials, tokens, or keys in code
- [ ] No production URLs or infrastructure details
- [ ] Placeholders used for sensitive values
- [ ] Security warnings included where appropriate
- [ ] Best practices followed in examples
- [ ] Secure alternatives documented
- [ ] Lab vs production context clearly marked
- [ ] External links verified as safe and reputable
- [ ] Scripts reviewed for security implications
- [ ] Dependencies are from trusted sources

## 🔄 Policy Updates

This security policy is reviewed and updated:
- Quarterly, at minimum
- After security incidents
- When security standards change
- Based on community feedback

**Last Updated**: 2025-01-01  
**Version**: 1.0

## ❓ Questions?

For non-security questions, use:
- [GitHub Issues](../../issues) - General issues
- [GitHub Discussions](../../discussions) - Questions and ideas
- [CONTRIBUTING.md](CONTRIBUTING.md) - Contribution guidelines

For security concerns, follow the reporting process above.

---

**Security is everyone's responsibility. Thank you for helping keep this project and our community safe! 🔒**
