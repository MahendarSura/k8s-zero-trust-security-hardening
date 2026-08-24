# Security Architecture

The platform follows a layered Kubernetes security model.

## Controls

- Pod Security Admission labels
- Kyverno admission policies
- Cilium network policies
- Cosign image verification
- Trivy vulnerability scanning
- Falco runtime detection
- Kubernetes service-account hardening
- Non-root containers
- Resource limits
- Capability dropping
- Read-only container filesystems where supported

Security controls are designed as defense-in-depth layers rather than relying on a single security mechanism.
