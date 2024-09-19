#!/bin/bash

# Remove the existing directory if it exists
rm -rf /opt/simc-aoe-profiles

# Clone the repository
git -C /opt clone https://github.com/balu100/simc-aoe-profiles.git

# Copy files to the destination directory
cp -r -f /opt/simc-aoe-profiles/* /app/SimulationCraft/profiles/

# Read commands from the /app/SimulationCraft/profiles/torun file and execute them
while IFS= read -r line; do
    # Execute the command from the file
    $line
done < /app/SimulationCraft/profiles/torun
