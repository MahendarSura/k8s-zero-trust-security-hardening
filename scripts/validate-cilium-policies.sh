#!/usr/bin/env bash

set -euo pipefail

POLICY_DIR="cilium/network-policies"

echo "Validating Cilium policy files..."

required_files=(
  "default-deny.yaml"
  "dns-allow.yaml"
  "frontend-to-backend.yaml"
  "backend-to-database.yaml"
)

for file in "${required_files[@]}"; do
  if [[ ! -f "${POLICY_DIR}/${file}" ]]; then
    echo "ERROR: Missing ${POLICY_DIR}/${file}"
    exit 1
  fi

  echo "OK: ${POLICY_DIR}/${file}"
done

echo
echo "Cilium policy validation completed successfully."
