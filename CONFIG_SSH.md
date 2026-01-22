# Developer Setup Guide: Iberia Engineering

This guide outlines the mandatory steps to configure your environment for contributing to Iberia-Ent projects. Follow these instructions to ensure your access, security, and commit standards are correctly aligned.

---

## 📋 Prerequisites

- **Request Access:** Ensure you have requested your user account and permissions for GitLab/GitHub.
- **Standards Review:** Familiarize yourself with the InnerSource Standards.

---

## 🔐 1. SSH Key Configuration

To interact with repositories via SSH, follow these steps:

### Generate your key
Navigate to your `.ssh` directory and run:

```bash
ssh-keygen -t ed25519 -C "your-email@example.com"
```

## Register with GitHub

Go to User Settings > SSH and GPG keys.

Click New SSH key.

Set Key type to Authentication key.

Paste your public key.

Critical: Locate the SSO configure dropdown next to your new key and select Iberia to authorize it.

Manage SSH Agent

If you need to manually add your key to the session:
eval $(ssh-agent)           # Start the agent
ssh-add ~/.ssh/id_iberia_key # Add your specific key
ssh-add -l                  # List active keys to verify


## ✍️ 2. Commit Signature Verification

All commits must be signed to be accepted.

Follow the detailed Commit Signature Verification Guide.

Verify your local configuration with:

git config --list