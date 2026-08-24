#!/usr/bin/env bash

set -euo pipefail

IMAGE="${1:-}"

if [[ -z "$IMAGE" ]]; then
  echo "Usage: $0 <image-reference>"
  echo "Example: $0 ghcr.io/MahendarSura/secure-app:1.0.0"
  exit 1
fi

if ! command -v cosign >/dev/null 2>&1; then
  echo "ERROR: cosign is not installed."
  exit 1
fi

echo "Signing container image:"
echo "$IMAGE"

cosign sign "$IMAGE"

echo "Image signing completed successfully."
