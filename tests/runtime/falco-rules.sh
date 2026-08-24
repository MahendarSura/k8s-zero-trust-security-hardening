#!/usr/bin/env bash
set -euo pipefail

test -s falco/rules/kubernetes-security.yaml

echo "Falco runtime security rules present."
