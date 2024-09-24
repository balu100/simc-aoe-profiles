# Simcraft AOE Profiles

This repository contains profiles for Area of Effect (AOE) damage simulations in SimulationCraft. Follow the instructions below to use these profiles, either manually or via Docker.

## Manual Installation

1. **Download SimulationCraft:**
   - Get the latest SimulationCraft build from the [nightly builds page](http://downloads.simulationcraft.org/nightly/?C=M;O=D).

2. **Overwrite Profile Files:**
   - Replace the `TWW1_Raid.simc` file and the `TWW1` folder in the `profiles` directory of your SimulationCraft installation with the ones provided in this repository.

3. **Usage:**
   - Run SimulationCraft as usual. The new AOE profiles will be used automatically after the overwrite.

## Docker Installation

You can run SimulationCraft with these profiles via Docker for a streamlined setup:

1. **Run the Docker Container:**
   ```
   docker run baluzs/simc:latest
   ```
2. **Mapped Volume::**
   - The output files will be saved to `/opt/outside` inside the container, which will be automatically mapped to the host machine.
     
3. **What does it auto generate**
```
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
```

### Contributions
Contributions are welcome! If you have any suggestions for improvements or additional profiles, feel free to submit a pull request or open an issue.
