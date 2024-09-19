#!/bin/sh

apk update
apk add --no-cache nano git
rm -rf /opt/simc-aoe-profiles
git -C /opt clone https://github.com/balu100/simc-aoe-profiles.git
cp -r -f /opt/simc-aoe-profiles/* /app/SimulationCraft/profiles/

#siege-of-boralus
./simc TWW1_Raid_SoB_10.simc html=/opt/outside/TWW1_Raid_SoB_10.html target_error=1.0 ptr=0
./simc TWW1_Raid_SoB_10.simc html=/opt/outside/TWW1_Raid_SoB_10_PTR.html target_error=1.0 ptr=1
./simc TWW1_Raid_SoB_15.simc html=/opt/outside/TWW1_Raid_SoB_15.html target_error=1.0 ptr=0
./simc TWW1_Raid_SoB_15.simc html=/opt/outside/TWW1_Raid_SoB_15_PTR.html target_error=1.0 ptr=1
./simc TWW1_Raid_SoB_20.simc html=/opt/outside/TWW1_Raid_SoB_20.html target_error=1.0 ptr=0
./simc TWW1_Raid_SoB_20.simc html=/opt/outside/TWW1_Raid_SoB_20_PTR.html target_error=1.0 ptr=1

#mists-of-tirna-scithe
./simc TWW1_Raid_MoTS_10.simc html=/opt/outside/TWW1_Raid_MoTS_10.html target_error=1.0 ptr=0
./simc TWW1_Raid_MoTS_10.simc html=/opt/outside/TWW1_Raid_MoTS_10_PTR.html target_error=1.0 ptr=1
./simc TWW1_Raid_MoTS_15.simc html=/opt/outside/TWW1_Raid_MoTS_15.html target_error=1.0 ptr=0
./simc TWW1_Raid_MoTS_15.simc html=/opt/outside/TWW1_Raid_MoTS_15_PTR.html target_error=1.0 ptr=1
./simc TWW1_Raid_MoTS_20.simc html=/opt/outside/TWW1_Raid_MoTS_20.html target_error=1.0 ptr=0
./simc TWW1_Raid_MoTS_20.simc html=/opt/outside/TWW1_Raid_MoTS_20_PTR.html target_error=1.0 ptr=1

#the-necrotic-wake
./simc TWW1_Raid_TNW_10.simc html=/opt/outside/TWW1_Raid_TNW_10.html target_error=1.0 ptr=0
./simc TWW1_Raid_TNW_10.simc html=/opt/outside/TWW1_Raid_TNW_10_PTR.html target_error=1.0 ptr=1
./simc TWW1_Raid_TNW_15.simc html=/opt/outside/TWW1_Raid_TNW_15.html target_error=1.0 ptr=0
./simc TWW1_Raid_TNW_15.simc html=/opt/outside/TWW1_Raid_TNW_15_PTR.html target_error=1.0 ptr=1
./simc TWW1_Raid_TNW_20.simc html=/opt/outside/TWW1_Raid_TNW_20.html target_error=1.0 ptr=0
./simc TWW1_Raid_TNW_20.simc html=/opt/outside/TWW1_Raid_TNW_20_PTR.html target_error=1.0 ptr=1

#ara-kara-city-of-echoes
./simc TWW1_Raid_AKCoE_10.simc html=/opt/outside/TWW1_Raid_AKCoE_10.html target_error=1.0 ptr=0
./simc TWW1_Raid_AKCoE_10.simc html=/opt/outside/TWW1_Raid_AKCoE_10_PTR.html target_error=1.0 ptr=1
./simc TWW1_Raid_AKCoE_15.simc html=/opt/outside/TWW1_Raid_AKCoE_15.html target_error=1.0 ptr=0
./simc TWW1_Raid_AKCoE_15.simc html=/opt/outside/TWW1_Raid_AKCoE_15_PTR.html target_error=1.0 ptr=1
./simc TWW1_Raid_AKCoE_20.simc html=/opt/outside/TWW1_Raid_AKCoE_20.html target_error=1.0 ptr=0
./simc TWW1_Raid_AKCoE_20.simc html=/opt/outside/TWW1_Raid_AKCoE_20_PTR.html target_error=1.0 ptr=1

#city-of-threads
./simc TWW1_Raid_CoT_10.simc html=/opt/outside/TWW1_Raid_CoT_10.html target_error=1.0 ptr=0
./simc TWW1_Raid_CoT_10.simc html=/opt/outside/TWW1_Raid_CoT_10_PTR.html target_error=1.0 ptr=1
./simc TWW1_Raid_CoT_15.simc html=/opt/outside/TWW1_Raid_CoT_15.html target_error=1.0 ptr=0
./simc TWW1_Raid_CoT_15.simc html=/opt/outside/TWW1_Raid_CoT_15_PTR.html target_error=1.0 ptr=1
./simc TWW1_Raid_CoT_20.simc html=/opt/outside/TWW1_Raid_CoT_20.html target_error=1.0 ptr=0
./simc TWW1_Raid_CoT_20.simc html=/opt/outside/TWW1_Raid_CoT_20_PTR.html target_error=1.0 ptr=1

#the-dawnbreaker
./simc TWW1_Raid_TD_10.simc html=/opt/outside/TWW1_Raid_TD_10.html target_error=1.0 ptr=0
./simc TWW1_Raid_TD_10.simc html=/opt/outside/TWW1_Raid_TD_10_PTR.html target_error=1.0 ptr=1
./simc TWW1_Raid_TD_15.simc html=/opt/outside/TWW1_Raid_TD_15.html target_error=1.0 ptr=0
./simc TWW1_Raid_TD_15.simc html=/opt/outside/TWW1_Raid_TD_15_PTR.html target_error=1.0 ptr=1
./simc TWW1_Raid_TD_20.simc html=/opt/outside/TWW1_Raid_TD_20.html target_error=1.0 ptr=0
./simc TWW1_Raid_TD_20.simc html=/opt/outside/TWW1_Raid_TD_20_PTR.html target_error=1.0 ptr=1

#the-stonevault
./simc TWW1_Raid_TS_10.simc html=/opt/outside/TWW1_Raid_TS_10.html target_error=1.0 ptr=0
./simc TWW1_Raid_TS_10.simc html=/opt/outside/TWW1_Raid_TS_10_PTR.html target_error=1.0 ptr=1
./simc TWW1_Raid_TS_15.simc html=/opt/outside/TWW1_Raid_TS_15.html target_error=1.0 ptr=0
./simc TWW1_Raid_TS_15.simc html=/opt/outside/TWW1_Raid_TS_15_PTR.html target_error=1.0 ptr=1
./simc TWW1_Raid_TS_20.simc html=/opt/outside/TWW1_Raid_TS_20.html target_error=1.0 ptr=0
./simc TWW1_Raid_TS_20.simc html=/opt/outside/TWW1_Raid_TS_20_PTR.html target_error=1.0 ptr=1

# Run an infinite loop with no task
while true; do
  # Just sleep to keep the script running
  sleep 86400 # Sleep for 24 hours
done
