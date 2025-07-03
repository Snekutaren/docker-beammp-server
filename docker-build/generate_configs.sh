#!/bin/bash

# BeamMP map config generator
# Generates a .toml for each map in ./generated_configs

OUTPUT_DIR="./configs"
mkdir -p "$OUTPUT_DIR"

# List of maps sorted by name
maps=(
  automation_test_track
  cliff
  derby
  driver_training
  east_coast_usa
  gridmap_v2
  hirochi_raceway
  industrial
  italy
  johnson_valley
  jungle_rock_island
  small_island
  smallgrid
  utah
  west_coast_usa
)

for map in "${maps[@]}"
do
  cat << EOF > ${OUTPUT_DIR}/${map}.toml
# This is the BeamMP-Server config file.
# Help & Documentation: https://docs.beammp.com/server/server-maintenance/
# IMPORTANT: Fill in the AuthKey with the key you got from https://keymaster.beammp.com/

[Misc]
SendErrorsShowMessage = true
SendErrors = true
ImScaredOfUpdates = false

[General]
ResourceFolder = "Resources"
Map = "/levels/${map}/info.json"
MaxPlayers = 8
Description = "BeamMP Default Description"
Tags = "Freeroam"
Port = 30814
Private = true
Debug = false
Name = "BeamMP Server"
LogChat = true
MaxCars = 1
AuthKey = ""
EOF

  echo "Generated ${OUTPUT_DIR}/${map}.toml"
done

# Optionally zip the results 
# zip -j beammp_maps_config.zip ${OUTPUT_DIR}/*.toml

echo "✅ All configs generated in ${OUTPUT_DIR}/"
