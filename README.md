# 🔐 Enterprise Kubernetes Zero-Trust Security Hardening Platform

[![Kubernetes](https://img.shields.io/badge/Kubernetes-1.33-326CE5?style=for-the-badge\&logo=kubernetes\&logoColor=white)](https://kubernetes.io/)
[![Amazon EKS](https://img.shields.io/badge/Amazon-EKS-FF9900?style=for-the-badge\&logo=amazon-aws\&logoColor=white)](https://aws.amazon.com/eks/)
[![AWS](https://img.shields.io/badge/AWS-Cloud-232F3E?style=for-the-badge\&logo=amazon-aws\&logoColor=white)](https://aws.amazon.com/)
[![Terraform](https://img.shields.io/badge/Terraform-IaC-7B42BC?style=for-the-badge\&logo=terraform\&logoColor=white)](https://www.terraform.io/)
[![Cilium](https://img.shields.io/badge/Cilium-eBPF-F8C517?style=for-the-badge\&logo=cilium\&logoColor=black)](https://cilium.io/)
[![Kyverno](https://img.shields.io/badge/Kyverno-Policy%20Engine-5A67D8?style=for-the-badge)](https://kyverno.io/)
[![Falco](https://img.shields.io/badge/Falco-Runtime%20Security-00A98F?style=for-the-badge)](https://falco.org/)
[![Trivy](https://img.shields.io/badge/Trivy-Container%20Security-1904DA?style=for-the-badge)](https://trivy.dev/)
[![Cosign](https://img.shields.io/badge/Cosign-Image%20Signing-5C4EE5?style=for-the-badge)](https://www.sigstore.dev/)
[![Vault](https://img.shields.io/badge/HashiCorp-Vault-FFCF25?style=for-the-badge\&logo=vault\&logoColor=black)](https://www.vaultproject.io/)
[![Prometheus](https://img.shields.io/badge/Prometheus-Monitoring-E6522C?style=for-the-badge\&logo=prometheus\&logoColor=white)](https://prometheus.io/)
[![GitHub Actions](https://img.shields.io/badge/GitHub-Actions-2088FF?style=for-the-badge\&logo=github-actions\&logoColor=white)](https://github.com/features/actions)

---

## 📌 Project Overview

**Kubernetes Zero-Trust Security Hardening Platform** is a production-style Kubernetes security engineering project designed to demonstrate how a modern Amazon EKS environment can be hardened using multiple layers of preventive, detective, and runtime security controls.

The platform implements a **defense-in-depth Zero-Trust security model** across:

* ☸️ Kubernetes workload security
* 🔐 Admission control and policy enforcement
* 🛡️ Cilium eBPF network security
* 🚫 Default-deny network segmentation
* 🔎 Falco runtime threat detection
* 📦 Container image vulnerability scanning
* ✍️ Cosign container image signing
* 🧬 Trusted image registry enforcement
* 🔒 Non-root container enforcement
* 🚨 Privileged container prevention
* 📏 Kubernetes resource-limit enforcement
* 🔑 Vault-based secrets architecture
* 📊 Prometheus monitoring
* 🚨 Alertmanager security alerting
* 🧪 Automated security validation
* 🏗️ Terraform-based AWS infrastructure
* 🚀 GitHub Actions security validation

The project is structured to represent how security controls can be integrated into a real-world **DevSecOps / Cloud Security / Platform Engineering** environment.

---

# 🎯 Security Objectives

The primary objective is to ensure that Kubernetes workloads are:

1. **Trusted before deployment**
2. **Restricted during admission**
3. **Isolated at the network layer**
4. **Protected from privilege escalation**
5. **Scanned for known vulnerabilities**
6. **Verified for trusted image sources**
7. **Signed and verified using Cosign**
8. **Monitored during runtime**
9. **Protected through centralized secret-management patterns**
10. **Continuously validated through automation**

---

# 🏗️ High-Level Architecture

```text
                         ┌─────────────────────────┐
                         │       DEVELOPER         │
                         └────────────┬────────────┘
                                      │
                                      ▼
                         ┌─────────────────────────┐
                         │      GITHUB REPOSITORY   │
                         │  Kubernetes + Terraform  │
                         └────────────┬────────────┘
                                      │
                                      ▼
                         ┌─────────────────────────┐
                         │     GITHUB ACTIONS       │
                         │   Security Validation    │
                         └────────────┬────────────┘
                                      │
             ┌────────────────────────┼────────────────────────┐
             │                        │                        │
             ▼                        ▼                        ▼
        ┌──────────┐            ┌──────────┐            ┌──────────┐
        │  Trivy   │            │  Cosign  │            │ Kyverno  │
        │ Scanning │            │ Signing  │            │ Policies │
        └──────────┘            └──────────┘            └──────────┘
             │                        │                        │
             └────────────────────────┼────────────────────────┘
                                      │
                                      ▼
                         ┌─────────────────────────┐
                         │       AMAZON EKS        │
                         │    Kubernetes Cluster   │
                         └────────────┬────────────┘
                                      │
              ┌───────────────────────┼────────────────────────┐
              │                       │                        │
              ▼                       ▼                        ▼
       ┌─────────────┐         ┌─────────────┐          ┌─────────────┐
       │   Cilium    │         │   Kyverno   │          │    Vault    │
       │ eBPF / L7   │         │ Admission   │          │   Secrets   │
       │ Networking  │         │  Security   │          │ Management  │
       └─────────────┘         └─────────────┘          └─────────────┘
              │                       │                        │
              ▼                       ▼                        │
       ┌─────────────┐         ┌─────────────┐                 │
       │  Network    │         │ Kubernetes  │                 │
       │  Policies   │         │ Workloads   │                 │
       └─────────────┘         └──────┬──────┘                 │
                                      │                        │
                                      ▼                        │
                               ┌─────────────┐                 │
                               │    Falco    │◄────────────────┘
                               │   Runtime   │
                               │   Threat    │
                               │  Detection  │
                               └──────┬──────┘
                                      │
                                      ▼
                            ┌──────────────────┐
                            │   Prometheus     │
                            │   + Alertmanager │
                            └──────────────────┘
```

---

# 🛡️ Zero-Trust Security Model

The platform follows a layered security approach:

```text
                 ZERO-TRUST KUBERNETES MODEL

                         ┌──────────────┐
                         │  Identity    │
                         │ & Workload   │
                         │   Context    │
                         └──────┬───────┘
                                │
                                ▼
                         ┌──────────────┐
                         │   Admission  │
                         │    Control   │
                         │   Kyverno    │
                         └──────┬───────┘
                                │
                                ▼
                         ┌──────────────┐
                         │ Image Trust  │
                         │ Trivy/Cosign │
                         └──────┬───────┘
                                │
                                ▼
                         ┌──────────────┐
                         │   Network    │
                         │  Isolation   │
                         │   Cilium     │
                         └──────┬───────┘
                                │
                                ▼
                         ┌──────────────┐
                         │   Runtime    │
                         │  Detection   │
                         │    Falco     │
                         └──────┬───────┘
                                │
                                ▼
                         ┌──────────────┐
                         │ Observability│
                         │ Prometheus + │
                         │ Alertmanager │
                         └──────────────┘
```

---

# 🧩 Security Layers

| Layer                  | Technology            | Purpose                            |
| ---------------------- | --------------------- | ---------------------------------- |
| Cloud Infrastructure   | AWS                   | Secure cloud foundation            |
| Infrastructure as Code | Terraform             | Reproducible AWS infrastructure    |
| Kubernetes Platform    | Amazon EKS            | Managed Kubernetes                 |
| Admission Security     | Kyverno               | Prevent insecure workloads         |
| Network Security       | Cilium                | eBPF-based network enforcement     |
| Runtime Security       | Falco                 | Detect suspicious runtime behavior |
| Image Scanning         | Trivy                 | Detect container vulnerabilities   |
| Image Signing          | Cosign                | Establish container image trust    |
| Secret Management      | HashiCorp Vault       | Centralized secrets architecture   |
| Monitoring             | Prometheus            | Security/platform metrics          |
| Alerting               | Alertmanager          | Security alert routing             |
| Automation             | GitHub Actions        | Continuous validation              |
| Testing                | Bash/Kubernetes tests | Security regression testing        |

---

# 🔐 Kubernetes Admission Security

Kyverno provides policy-based admission control.

The project contains policies for:

### 🚫 Privileged Containers

Privileged containers are blocked to reduce the risk of container escape and host-level privilege escalation.

```yaml
validationFailureAction: Enforce
```

### 👤 Non-Root Containers

Workloads are required to run as non-root wherever the policy applies.

```yaml
runAsNonRoot: true
```

### 📏 Resource Limits

Containers are required to define CPU and memory requests/limits.

This helps prevent:

* Resource exhaustion
* Noisy-neighbor problems
* Uncontrolled workload consumption
* Kubernetes scheduling issues

### 📦 Trusted Image Registry

Workloads are restricted to trusted image sources such as:

```text
ghcr.io/MahendarSura/*
```

This provides an image provenance control at admission time.

---

# 🌐 Cilium Network Security

Cilium is used to implement Kubernetes network segmentation using eBPF-based networking and policy enforcement.

The project includes:

```text
cilium/
└── network-policies/
    ├── default-deny.yaml
    ├── dns-allow.yaml
    ├── frontend-to-backend.yaml
    └── backend-to-database.yaml
```

## Default Deny

The application namespace follows a restrictive network model where communication is explicitly controlled.

```text
                    secure-app namespace

                         ┌──────────┐
                         │ Frontend │
                         └────┬─────┘
                              │
                         TCP :3000
                              │
                              ▼
                         ┌──────────┐
                         │ Backend  │
                         └────┬─────┘
                              │
                         TCP :3306
                              │
                              ▼
                         ┌──────────┐
                         │ Database │
                         └──────────┘

                         DNS Allowed
                              │
                              ▼
                         kube-dns :53
```

The intent is to allow only required application communication rather than unrestricted pod-to-pod access.

---

# 🔎 Runtime Threat Detection with Falco

Falco provides runtime security monitoring for Kubernetes workloads.

The project contains:

```text
falco/
├── config/
│   └── falco.yaml
├── deployment/
│   ├── configmap.yaml
│   ├── daemonset.yaml
│   ├── rbac.yaml
│   └── serviceaccount.yaml
└── rules/
    └── kubernetes-security.yaml
```

Falco is designed to detect suspicious runtime behavior such as:

* Unexpected shell execution
* Suspicious process execution
* Container-level anomalies
* Sensitive filesystem access
* Kubernetes security events
* Runtime policy violations

---

# ✍️ Container Image Security

The platform implements multiple image-security controls.

## Trivy

Trivy is used for container image vulnerability scanning.

```text
Developer
    │
    ▼
Container Image
    │
    ▼
Trivy Scan
    │
    ├── Vulnerabilities
    ├── Misconfigurations
    └── Security Findings
```

The scanning automation is located at:

```text
trivy/
├── config/
│   └── trivy.yaml
└── scan-image.sh
```

## Cosign

Cosign is used for container image signing and verification.

```text
Build Image
     │
     ▼
Cosign Sign
     │
     ▼
Signed Image
     │
     ▼
Admission Verification
     │
     ▼
Trusted Workload
```

Project structure:

```text
cosign/
├── policies/
│   └── verify-signed-images.yaml
└── scripts/
    └── sign-image.sh
```

---

# 🔑 Secrets Management

The project includes a Vault-oriented secrets-management structure.

```text
vault/
├── manifests/
│   ├── namespace.yaml
│   └── serviceaccount.yaml
└── policies/
    └── secure-app.hcl
```

The architecture separates application secrets from regular application configuration and provides a foundation for centralized secret-management integration.

A database secret template is intentionally kept as a template rather than storing real credentials in Git.

```text
kubernetes/security/database-secret-template.yaml
```

---

# 📊 Observability & Alerting

The platform includes Prometheus and Alertmanager integration points.

```text
monitoring/
├── prometheus/
│   └── servicemonitor.yaml
└── alertmanager/
    └── security-alerts.yaml
```

The observability layer is designed to provide:

* Kubernetes security metrics
* Platform monitoring
* Security event visibility
* Alert routing
* Runtime security observability

---

# 🏗️ Infrastructure as Code

Terraform provides the AWS infrastructure foundation.

```text
terraform/
├── main.tf
├── providers.tf
├── variables.tf
├── outputs.tf
└── modules/
    ├── vpc/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    └── eks/
        ├── main.tf
        ├── variables.tf
        └── outputs.tf
```

The modular structure separates:

* VPC infrastructure
* EKS infrastructure
* Variables
* Outputs
* Provider configuration

This supports reusable infrastructure automation rather than manually configuring cloud resources.

---

# 🚀 CI/CD Security Validation

GitHub Actions is used for automated security validation.

```text
Developer Push
      │
      ▼
GitHub Repository
      │
      ▼
GitHub Actions
      │
      ├── YAML Validation
      ├── Security Tests
      ├── Policy Validation
      ├── Script Validation
      └── Project Checks
      │
      ▼
Security Validation Result
```

Workflow:

```text
.github/workflows/security-validation.yml
```

---

# 🧪 Automated Security Testing

The repository includes dedicated security-validation scripts.

```text
tests/
├── admission/
│   └── kyverno-policies.yaml
├── network/
│   └── verify-policies.sh
├── runtime/
│   └── falco-rules.sh
└── security/
    └── security-files.sh
```

The tests are designed to validate that important security controls remain present as the project evolves.

---

# 📁 Project Structure

```text
k8s-zero-trust-security-hardening/
│
├── .github/
│   └── workflows/
│       └── security-validation.yml
│
├── cilium/
│   ├── network-policies/
│   │   ├── backend-to-database.yaml
│   │   ├── default-deny.yaml
│   │   ├── dns-allow.yaml
│   │   └── frontend-to-backend.yaml
│   └── observability/
│       └── hubble.yaml
│
├── cosign/
│   ├── policies/
│   │   └── verify-signed-images.yaml
│   └── scripts/
│       └── sign-image.sh
│
├── docs/
│   └── security-architecture.md
│
├── falco/
│   ├── config/
│   │   └── falco.yaml
│   ├── deployment/
│   │   ├── configmap.yaml
│   │   ├── daemonset.yaml
│   │   ├── rbac.yaml
│   │   └── serviceaccount.yaml
│   └── rules/
│       └── kubernetes-security.yaml
│
├── kubernetes/
│   ├── namespaces/
│   ├── security/
│   ├── service-accounts/
│   └── workloads/
│
├── kyverno/
│   ├── exceptions/
│   └── policies/
│       ├── disallow-privileged.yaml
│       ├── require-image-registry.yaml
│       ├── require-non-root.yaml
│       └── require-resource-limits.yaml
│
├── monitoring/
│   ├── alertmanager/
│   └── prometheus/
│
├── scripts/
│   └── validate-cilium-policies.sh
│
├── terraform/
│   ├── modules/
│   │   ├── eks/
│   │   └── vpc/
│   ├── main.tf
│   ├── outputs.tf
│   ├── providers.tf
│   └── variables.tf
│
├── tests/
│   ├── admission/
│   ├── network/
│   ├── runtime/
│   └── security/
│
├── trivy/
│   ├── config/
│   │   └── trivy.yaml
│   └── scan-image.sh
│
├── vault/
│   ├── manifests/
│   └── policies/
│
├── .gitignore
└── README.md
```

---

# 🔄 End-to-End Security Flow

```text
                         SOURCE CODE
                             │
                             ▼
                       GITHUB REPOSITORY
                             │
                             ▼
                       GITHUB ACTIONS
                             │
              ┌──────────────┼──────────────┐
              │              │              │
              ▼              ▼              ▼
           Trivy          Cosign         Policy
           Scan           Sign            Validation
              │              │              │
              └──────────────┼──────────────┘
                             │
                             ▼
                        AMAZON EKS
                             │
                             ▼
                    KYVERNO ADMISSION
                             │
                   ┌─────────┴─────────┐
                   │                   │
                Allowed              Denied
                   │                   │
                   ▼                   ▼
              Kubernetes           Insecure
               Workload            Workload
                   │
                   ▼
                 CILIUM
                   │
          ┌────────┴─────────┐
          │                  │
       Allowed            Blocked
          │                  │
          ▼                  ▼
      Application         Unauthorized
       Traffic              Traffic
          │
          ▼
        FALCO
          │
          ▼
   Runtime Security
      Detection
          │
          ▼
 PROMETHEUS / ALERTMANAGER
```

---

# 🛠️ Technology Stack

| Category                     | Technology                   |
| ---------------------------- | ---------------------------- |
| Cloud                        | AWS                          |
| Kubernetes                   | Amazon EKS                   |
| Infrastructure as Code       | Terraform                    |
| Container Platform           | Kubernetes                   |
| Network Security             | Cilium                       |
| eBPF Observability           | Cilium / Hubble              |
| Admission Control            | Kyverno                      |
| Runtime Security             | Falco                        |
| Image Vulnerability Scanning | Trivy                        |
| Image Signing                | Cosign                       |
| Secrets Management           | HashiCorp Vault              |
| Monitoring                   | Prometheus                   |
| Alerting                     | Alertmanager                 |
| CI/CD Automation             | GitHub Actions               |
| Security Testing             | Bash / Kubernetes validation |
| Workload Security            | Kubernetes Security Contexts |
| Network Segmentation         | CiliumNetworkPolicy          |

---

# 🔒 Security Controls Summary

| Security Control                | Implementation                 |
| ------------------------------- | ------------------------------ |
| Pod Security                    | Kubernetes Pod Security labels |
| Non-Root Containers             | Kyverno                        |
| Privileged Container Prevention | Kyverno                        |
| Resource Limits                 | Kyverno                        |
| Trusted Image Registry          | Kyverno                        |
| Image Vulnerability Scanning    | Trivy                          |
| Image Signing                   | Cosign                         |
| Network Default Deny            | Cilium                         |
| DNS Restriction                 | Cilium                         |
| Frontend → Backend              | Cilium                         |
| Backend → Database              | Cilium                         |
| Runtime Detection               | Falco                          |
| Secret Management Architecture  | Vault                          |
| Security Monitoring             | Prometheus                     |
| Security Alerting               | Alertmanager                   |
| Automated Validation            | GitHub Actions                 |
| Infrastructure Automation       | Terraform                      |

---

# 🚦 Deployment Model

The intended deployment sequence is:

```text
1. Provision AWS infrastructure
           │
           ▼
2. Create Amazon EKS cluster
           │
           ▼
3. Configure Kubernetes namespaces
           │
           ▼
4. Install Cilium
           │
           ▼
5. Apply network policies
           │
           ▼
6. Install Kyverno
           │
           ▼
7. Apply admission policies
           │
           ▼
8. Configure Falco
           │
           ▼
9. Configure image security
           │
           ▼
10. Configure Vault integration
           │
           ▼
11. Configure monitoring
           │
           ▼
12. Run security validation
```

---

# 🧰 Validation Commands

Validate YAML syntax:

```bash
python3 - <<'PY'
import glob
import yaml

for f in glob.glob("**/*.yaml", recursive=True):
    with open(f) as fh:
        list(yaml.safe_load_all(fh))
    print(f"OK")
PY
```

Validate shell scripts:

```bash
bash -n scripts/validate-cilium-policies.sh
bash -n trivy/scan-image.sh
bash -n cosign/scripts/sign-image.sh
bash -n tests/network/verify-policies.sh
bash -n tests/runtime/falco-rules.sh
bash -n tests/security/security-files.sh
```

Validate Cilium policies:

```bash
./scripts/validate-cilium-policies.sh
```

Review project files:

```bash
find . \
  -type f \
  -not -path './.git/*' \
  | sort
```

Review Git status:

```bash
git status
```

---

# ⚠️ Security Considerations

This repository intentionally avoids committing real credentials.

Sensitive values should be supplied through secure mechanisms such as:

* AWS Secrets Manager
* HashiCorp Vault
* External Secrets
* Kubernetes secret injection mechanisms
* CI/CD secret stores

The following file is a template and must not contain production credentials:

```text
kubernetes/security/database-secret-template.yaml
```

---

# 🧠 What This Project Demonstrates

This project demonstrates practical knowledge of:

### ☁️ Cloud

* AWS
* Amazon EKS
* Cloud networking concepts
* Infrastructure automation

### ☸️ Kubernetes

* Namespaces
* Deployments
* Services
* ServiceAccounts
* Security Contexts
* Pod Security Standards
* NetworkPolicies
* Admission Control

### 🔐 DevSecOps

* Shift-left security
* Container scanning
* Image signing
* Admission enforcement
* Security policy automation
* CI security validation

### 🌐 Cloud-Native Networking

* Cilium
* eBPF
* Network segmentation
* Default-deny architecture
* L7-aware security concepts
* Hubble observability

### 🛡️ Runtime Security

* Falco
* Runtime event detection
* Kubernetes security monitoring
* Security rules

### 🔑 Secrets

* HashiCorp Vault
* Secret-management architecture
* Least-privilege policy design

### 📊 Observability

* Prometheus
* Alertmanager
* Hubble
* Runtime security visibility

### 🏗️ Infrastructure Engineering

* Terraform
* Modular IaC
* Reusable VPC module
* Reusable EKS module

---

# 🏢 Enterprise / Real-World Relevance

The architecture reflects security patterns commonly used in modern cloud-native environments where Kubernetes workloads require multiple independent security controls.

A production organization may extend this architecture with additional capabilities such as:

* AWS IAM / IRSA
* AWS KMS
* AWS Secrets Manager
* External Secrets Operator
* OPA/Gatekeeper
* SIEM integration
* Security Information and Event Management
* Centralized audit logging
* Runtime response automation
* Multi-cluster security
* Service mesh
* Progressive delivery
* Disaster recovery automation

These are extension points rather than claims that they are already implemented in this repository.

---

# 📈 Future Enhancements

Planned extension areas include:

* 🔐 AWS KMS integration
* 🔑 External Secrets Operator
* 🛡️ AWS Security Hub integration
* 📊 Grafana dashboards
* 🚨 Slack security notifications
* 🧪 Kubernetes chaos/security testing
* 🌐 Multi-cluster policy enforcement
* 🔄 GitOps deployment
* 🕵️ SIEM integration
* 🤖 Automated incident remediation
* 🔒 Advanced workload identity
* 📦 Supply-chain attestation
* 🧬 SBOM generation and verification

---

# 👨‍💻 Author

**MahendarSura**

Cloud / DevOps / DevSecOps Engineering Portfolio

---

# ⭐ Project Focus

```text
Kubernetes
     +
AWS EKS
     +
Terraform
     +
Cilium
     +
Kyverno
     +
Falco
     +
Trivy
     +
Cosign
     +
Vault
     +
Prometheus
     +
Alertmanager
     +
GitHub Actions
     =
Enterprise-Style Zero-Trust Kubernetes Security Platform
```

---

## 📜 License

This project is intended for educational, portfolio, and engineering demonstration purposes.
