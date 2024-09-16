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
   - The output files will be saved to a volume mapped to /opt/outside on your machine.

### Contributions
Contributions are welcome! If you have any suggestions for improvements or additional profiles, feel free to submit a pull request or open an issue.
