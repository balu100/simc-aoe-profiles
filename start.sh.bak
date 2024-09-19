#!/bin/ash

# Remove the existing directory if it exists
rm -rf /opt/simc-aoe-profiles

# Clone the repository
git -C /opt clone https://github.com/balu100/simc-aoe-profiles.git

# Copy files to the destination directory
cp -r -f /opt/simc-aoe-profiles/* /app/SimulationCraft/profiles/

# Change directory to /app/SimulationCraft
cd /app/SimulationCraft || exit 1  # Exit if the directory doesn't exist

# Read commands from the /app/SimulationCraft/profiles/torun file and execute them
while IFS= read -r line; do
    # Execute the command using ash
    /bin/ash -c "$line"
done < /app/SimulationCraft/profiles/torun
