#!/bin/ash

# Define the URL of the toruncommands file
TORUN_URL="https://raw.githubusercontent.com/balu100/simc-aoe-profiles/main/torun"  # Replace with the actual URL

# Define the path where the toruncommands file will be saved
TORUN_FILE="/app/SimulationCraft/torun"

# Download the toruncommands file using wget
wget -O "$TORUN_FILE" "$TORUN_URL"

# Check if the file was downloaded successfully
if [ ! -f "$TORUN_FILE" ]; then
    echo "Failed to download $TORUN_URL"
    exit 1
fi

# Make sure the file is executable
chmod +x "$TORUN_FILE"

# Read commands from the toruncommands file and execute them
while IFS= read -r line; do
    # Skip empty lines or lines starting with '#' (comments)
    [ -z "$line" ] || [ "${line#\#}" != "$line" ] || continue
    # Execute the command
    echo "Running: $line"
    $line
done < "$TORUN_FILE"
