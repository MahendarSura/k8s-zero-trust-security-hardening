#!/usr/bin/env bash
set -euo pipefail

test -s cosign/policies/verify-signed-images.yaml
test -s trivy/config/trivy.yaml
test -s kyverno/policies/disallow-privileged.yaml
test -s kyverno/policies/require-non-root.yaml

echo "Security policy files validated successfully."
