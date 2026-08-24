# Kyverno Policy Exceptions

This directory documents approved exceptions to Kyverno security policies.

Exceptions should only be introduced when a workload has a documented
technical requirement that cannot satisfy the default security policies.

## Exception Principles

- Exceptions must be reviewed before deployment.
- Exceptions must have a documented reason.
- Exceptions should be scoped to the minimum required workload.
- Exceptions should not disable security controls globally.
- Temporary exceptions should have an expiration or review date.

## Covered Policies

- Require non-root containers
- Disallow privileged containers
- Require CPU and memory requests and limits
- Require approved container image registries

## Review

Every exception should be reviewed by the platform/security team before
being applied to a production Kubernetes cluster.
