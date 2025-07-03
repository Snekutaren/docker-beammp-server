#!/bin/bash
set -euo pipefail

echo "Starting entrypoint script..."

# Update beammp user UID:GID if environment variables set (for correct mounted volume ownership)
if [ -n "${HOST_UID:-}" ] && [ -n "${HOST_GID:-}" ]; then
  echo "Updating beammp user UID:GID to ${HOST_UID}:${HOST_GID}"
  groupmod -g "$HOST_GID" beammp
  usermod -u "$HOST_UID" -g "$HOST_GID" beammp
#  chown -Rv beammp:beammp /beamroot
fi

# Ensure configs folder exists in runtime dir
mkdir -pv /beamroot/beammp/configs

# Copy config files from /beamroot/configs to /beamroot/beammp/configs if missing
for file in /beamroot/configs/*; do
  dest="/beamroot/beammp/configs/$(basename "$file")"
  if [ ! -e "$dest" ]; then
    echo "Copying config $(basename "$file") to $dest"
    cp -v "$file" "$dest"
  else
    echo "Config $(basename "$file") already exists, skipping copy"
  fi
done

# Making sure permissions is setup.
echo "Fixing permissions.."
chown -Rc beammp:beammp /beamroot

# Make sure the MAP_NAME env var is set, else fail hard
if [ -z "${MAP_NAME:-}" ]; then
  echo "ERROR: MAP_NAME environment variable not set. Aborting."
  exit 1
fi

CONFIG_FILE="/beamroot/beammp/configs/${MAP_NAME}.toml"

if [ ! -f "$CONFIG_FILE" ]; then
  echo "ERROR: Config file $CONFIG_FILE not found. Aborting."
  exit 1
fi

echo "Using config $CONFIG_FILE"

echo "Switching to beammp user and launching server..."
exec gosu beammp bin/BeamMP-Server --config="$CONFIG_FILE"
