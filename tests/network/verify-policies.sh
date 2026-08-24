#!/usr/bin/env bash
set -euo pipefail

echo "Validating Cilium network policy manifests..."

for file in cilium/network-policies/*.yaml; do
  test -s "$file"
  echo "OK: $file"
done

echo "Cilium network policy validation completed."
