#!/usr/bin/env bash

set -euo pipefail

IMAGE="${1:-}"

if [[ -z "$IMAGE" ]]; then
  echo "Usage: $0 <image-reference>"
  echo "Example: $0 ghcr.io/MahendarSura/secure-app:1.0.0"
  exit 1
fi

if ! command -v trivy >/dev/null 2>&1; then
  echo "ERROR: trivy is not installed."
  exit 1
fi

echo "Scanning container image:"
echo "$IMAGE"

trivy image \
  --config trivy/config/trivy.yaml \
  "$IMAGE"

echo "Trivy scan completed successfully."
