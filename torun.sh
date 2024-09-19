#!/bin/sh

apk update
apk add --no-cache nano git
rm -rf /opt/simc-aoe-profiles
git -C /opt clone https://github.com/balu100/simc-aoe-profiles.git
cp -r -f /opt/simc-aoe-profiles/* /app/SimulationCraft/profiles/
./simc TWW1_Raid_AKCOE_10.simc html=/opt/outside/TWW1_Raid_AKCOE_10.html target_error=1.0 ptr=0
./simc TWW1_Raid_AKCOE_10.simc html=/opt/outside/TWW1_Raid_AKCOE_10_PTR.html target_error=1.0 ptr=1
./simc TWW1_Raid_AKCOE_15.simc html=/opt/outside/TWW1_Raid_AKCOE_15.html target_error=1.0 ptr=0
./simc TWW1_Raid_AKCOE_15.simc html=/opt/outside/TWW1_Raid_AKCOE_15_PTR.html target_error=1.0 ptr=1
./simc TWW1_Raid_AKCOE_20.simc html=/opt/outside/TWW1_Raid_AKCOE_20.html target_error=1.0 ptr=0
./simc TWW1_Raid_AKCOE_20.simc html=/opt/outside/TWW1_Raid_AKCOE_20_PTR.html target_error=1.0 ptr=1

# Run an infinite loop with no task
while true; do
  # Just sleep to keep the script running
  sleep 86400 # Sleep for 24 hours
done
