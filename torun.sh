#!/bin/sh

apk update
apk add --no-cache nano git
rm -rf /opt/simc-aoe-profiles
git -C /opt clone https://github.com/balu100/simc-aoe-profiles.git
cp -r -f /opt/simc-aoe-profiles/* /app/SimulationCraft/profiles/

echo "siege-of-boralu"
./simc TWW1_Raid_SoB_10.simc html=/opt/outside/TWW1_Raid_SoB_10.html target_error=1.0 ptr=0
./simc TWW1_Raid_SoB_10.simc html=/opt/outside/TWW1_Raid_SoB_10_PTR.html target_error=1.0 ptr=1
./simc TWW1_Raid_SoB_15.simc html=/opt/outside/TWW1_Raid_SoB_15.html target_error=1.0 ptr=0
./simc TWW1_Raid_SoB_15.simc html=/opt/outside/TWW1_Raid_SoB_15_PTR.html target_error=1.0 ptr=1

echo "mists-of-tirna-scithe"
./simc TWW1_Raid_MoTS_10.simc html=/opt/outside/TWW1_Raid_MoTS_10.html target_error=1.0 ptr=0
./simc TWW1_Raid_MoTS_10.simc html=/opt/outside/TWW1_Raid_MoTS_10_PTR.html target_error=1.0 ptr=1
./simc TWW1_Raid_MoTS_15.simc html=/opt/outside/TWW1_Raid_MoTS_15.html target_error=1.0 ptr=0
./simc TWW1_Raid_MoTS_15.simc html=/opt/outside/TWW1_Raid_MoTS_15_PTR.html target_error=1.0 ptr=1


echo "the-necrotic-wake"
./simc TWW1_Raid_TNW_10.simc html=/opt/outside/TWW1_Raid_TNW_10.html target_error=1.0 ptr=0
./simc TWW1_Raid_TNW_10.simc html=/opt/outside/TWW1_Raid_TNW_10_PTR.html target_error=1.0 ptr=1
./simc TWW1_Raid_TNW_15.simc html=/opt/outside/TWW1_Raid_TNW_15.html target_error=1.0 ptr=0
./simc TWW1_Raid_TNW_15.simc html=/opt/outside/TWW1_Raid_TNW_15_PTR.html target_error=1.0 ptr=1


echo "ara-kara-city-of-echoes"
./simc TWW1_Raid_AKCOE_10.simc html=/opt/outside/TWW1_Raid_AKCOE_10.html target_error=1.0 ptr=0
./simc TWW1_Raid_AKCOE_10.simc html=/opt/outside/TWW1_Raid_AKCOE_10_PTR.html target_error=1.0 ptr=1
./simc TWW1_Raid_AKCOE_15.simc html=/opt/outside/TWW1_Raid_AKCOE_15.html target_error=1.0 ptr=0
./simc TWW1_Raid_AKCOE_15.simc html=/opt/outside/TWW1_Raid_AKCOE_15_PTR.html target_error=1.0 ptr=1


echo "city-of-threads"
./simc TWW1_Raid_CoT_10.simc html=/opt/outside/TWW1_Raid_CoT_10.html target_error=1.0 ptr=0
./simc TWW1_Raid_CoT_10.simc html=/opt/outside/TWW1_Raid_CoT_10_PTR.html target_error=1.0 ptr=1
./simc TWW1_Raid_CoT_15.simc html=/opt/outside/TWW1_Raid_CoT_15.html target_error=1.0 ptr=0
./simc TWW1_Raid_CoT_15.simc html=/opt/outside/TWW1_Raid_CoT_15_PTR.html target_error=1.0 ptr=1


echo "the-dawnbreaker"
./simc TWW1_Raid_TD_10.simc html=/opt/outside/TWW1_Raid_TD_10.html target_error=1.0 ptr=0
./simc TWW1_Raid_TD_10.simc html=/opt/outside/TWW1_Raid_TD_10_PTR.html target_error=1.0 ptr=1
./simc TWW1_Raid_TD_15.simc html=/opt/outside/TWW1_Raid_TD_15.html target_error=1.0 ptr=0
./simc TWW1_Raid_TD_15.simc html=/opt/outside/TWW1_Raid_TD_15_PTR.html target_error=1.0 ptr=1


echo "the-stonevault"
./simc TWW1_Raid_TS_10.simc html=/opt/outside/TWW1_Raid_TS_10.html target_error=1.0 ptr=0
./simc TWW1_Raid_TS_10.simc html=/opt/outside/TWW1_Raid_TS_10_PTR.html target_error=1.0 ptr=1
./simc TWW1_Raid_TS_15.simc html=/opt/outside/TWW1_Raid_TS_15.html target_error=1.0 ptr=0
./simc TWW1_Raid_TS_15.simc html=/opt/outside/TWW1_Raid_TS_15_PTR.html target_error=1.0 ptr=1

echo "grim-batol"
./simc TWW1_Raid_GB_10.simc html=/opt/outside/TWW1_Raid_GB_10.html target_error=1.0 ptr=0
./simc TWW1_Raid_GB_10.simc html=/opt/outside/TWW1_Raid_GB_10_PTR.html target_error=1.0 ptr=1
./simc TWW1_Raid_GB_15.simc html=/opt/outside/TWW1_Raid_GB_15.html target_error=1.0 ptr=0
./simc TWW1_Raid_GB_15.simc html=/opt/outside/TWW1_Raid_GB_15_PTR.html target_error=1.0 ptr=1

echo "single target with aoe"
./simc TWW1_Raid.simc html=/opt/outside/TTWW1_Raid.html target_error=1.0 ptr=0
./simc TWW1_Raid.simc html=/opt/outside/TWW1_Raid_PTR.html target_error=1.0 ptr=1


echo "done"
echo "done 10%"
echo "done 20%"
echo "done 30%"
echo "done 40%"
echo "done 50%"
echo "done 60%"
echo "done 70%"
echo "done 80%"
echo "done 90%"
echo "done 100%"


# Run an infinite loop with no task
while true; do
  # Just sleep to keep the script running
  sleep 86400 # Sleep for 24 hours
done
