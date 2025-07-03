#!/bin/bash

set -euo pipefail

# Ensure the script is run from its own directory
cd "$(dirname "$0")"

echo "⚠️  WARNING: This will delete the 'beammp-server' folder and lock docker-compose.yml."
read -rp "Are you sure you want to continue? (y/N): " confirm

if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
  echo "❌ Cleanup aborted by user."
  exit 0
fi

echo "✅ Running cleanup..."

if [ -d beammp-server ]; then
  # Check if script has authority
  TARGET_DIR="./beammp-server"
  if ! touch "${TARGET_DIR}/test_write_permission.tmp" 2>/dev/null; then
     echo "ERROR: Cannot write to ${TARGET_DIR}. Please run with 'sudo' or adjust directory permissions."
     exit 1
  fi
#rm -f "${TARGET_DIR}/test_write_permission.tmp"
rm -rfv beammp-server

else
  echo "ℹ️  'beammp-server' folder not found."
fi


echo "Moving docker-compose.yml back to "locked" state, change back with running prepare.sh again"
if [ -f docker-compose.yml ]; then
  mv  docker-compose.yml docker-compose.locked
else
  echo "ℹ️  docker-compose.yml does not exist, skipping move."
fi
