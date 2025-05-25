# Simcraft AOE Profiles

This repository contains profiles for Area of Effect (AOE) damage simulations in SimulationCraft. Follow the instructions below to use these profiles, either manually or via Docker.

## [View online](https://dps.ebalazs.com/)
Latest mythic dps charts


## Docker

You can run SimulationCraft with these profiles via Docker for a streamlined setup:

1. **Run the Docker Container:**
   ```
   docker run baluzs/simc:latest
   ```
2. **Mapped Volume::**
   - The output files will be saved to `/opt/outside` inside the container, which will be automatically mapped to the host machine.
     
3. **What does it auto generate**
```
https://raw.githubusercontent.com/balu100/simc-aoe-profiles/refs/heads/main/torun.sh
```

### Contributions
Contributions are welcome! If you have any suggestions for improvements or additional profiles, feel free to submit a pull request or open an issue.
