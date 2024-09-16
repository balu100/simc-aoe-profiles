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
   ./simc TWW1_Raid.simc html=/opt/outside/6Target_LightMovement.html fight_style=LightMovement desired_targets=6 target_error=1.0
   ./simc TWW1_Raid.simc html=/opt/outside/6Target_HelterSkelter.html fight_style=HelterSkelter desired_targets=6 target_error=1.0
   ./simc TWW1_Raid.simc html=/opt/outside/6Target_HeavyMovement.html fight_style=HeavyMovement desired_targets=6 target_error=1.0
   ./simc TWW1_Raid.simc html=/opt/outside/8Target_LightMovement.html fight_style=LightMovement desired_targets=8 target_error=1.0
   ./simc TWW1_Raid.simc html=/opt/outside/8Target_HeavyMovement.html fight_style=HeavyMovement desired_targets=8 target_error=1.0
   ./simc TWW1_Raid.simc html=/opt/outside/8Target_HelterSkelter.html fight_style=HelterSkelter desired_targets=8 target_error=1.0
   ./simc TWW1_Raid.simc html=/opt/outside/DungeonSlice.html fight_style=DungeonSlice target_error=1.0
   ./simc TWW1_Raid.simc html=/opt/outside/Patchwerk.html fight_style=Patchwerk target_error=1.0
   ./simc TWW1_Raid.simc html=/opt/outside/12Target_LightMovement.html fight_style=LightMovement desired_targets=12 target_error=1.0
   ./simc TWW1_Raid.simc html=/opt/outside/12Target_HeavyMovement.html fight_style=HeavyMovement desired_targets=12 target_error=1.0
   ./simc TWW1_Raid.simc html=/opt/outside/12Target_HelterSkelter.html fight_style=HelterSkelter desired_targets=12 target_error=1.0
   #./simc TWW1_Raid.simc html=/opt/outside/20Target_LightMovement.html fight_style=LightMovement desired_targets=20 target_error=1.0
   #./simc TWW1_Raid.simc html=/opt/outside/20Target_HeavyMovement.html fight_style=HeavyMovement desired_targets=20 target_error=1.0
   #./simc TWW1_Raid.simc html=/opt/outside/20Target_HelterSkelter.html fight_style=HelterSkelter desired_targets=20 target_error=1.0
    ```

### Contributions
Contributions are welcome! If you have any suggestions for improvements or additional profiles, feel free to submit a pull request or open an issue.
