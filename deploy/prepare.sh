#!/bin/bash

set -euo pipefail

# Ensure the script is run from its own directory
cd "$(dirname "$0")"

# Hey!
# This script prepares your BeamMP server folder with correct permissions and default config.
#
# Usage:
#   chmod +x prepare.sh
#   ./prepare.sh
#
# Options:
#   --allow-root   Allow running as root (not recommended).

ALLOW_ROOT=false

# Parse arguments
for arg in "$@"; do
  case "$arg" in
    --allow-root)
      ALLOW_ROOT=true
      ;;
  esac
done

# Check if running as root
if [ "$EUID" -eq 0 ] && [ "$ALLOW_ROOT" = false ]; then
  echo "❌ ERROR: This script should not be run as root."
  echo "⚠️  Use --allow-root only if you understand the security implications."
  exit 1
fi

# Determine current user and group ID to ensure correct file ownership.
# This ensures that files created inside the container will belong to your host user,
# avoiding permission issues when editing files on the host.
uid=$(id -u)  # Get current user's UID
gid=$(id -g)  # Get current user's GID

echo "🔧 Preparing BeamMP server folder..."
echo "Using UID:GID ${uid}:${gid}"

# Create beammp-server folder structure if it doesn't exist
mkdir -vp beammp-server/configs
mkdir -vp beammp-server/Resources/Client
mkdir -vp beammp-server/Resources/Server

# Set correct ownership
echo "🔑 Setting permissions on beammp-server to ${uid}:${gid}..."
chown -Rc "${uid}:${gid}" beammp-server

# Restore docker-compose.yml if locked version exists
if [ -f docker-compose.locked ]; then
  mv  docker-compose.locked docker-compose.yml
  echo "🔓 docker-compose.locked renamed to docker-compose.yml"
fi

echo "✅ Done. BeamMP server folder is ready. You can now start your container without hassle!"
