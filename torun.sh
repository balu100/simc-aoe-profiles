#!/bin/sh
set -e

# Update package list and install dependencies
apk update && apk add --no-cache nano git figlet

# Clone and update the simulation profiles repository
rm -rf /opt/simc-aoe-profiles
git -C /opt clone https://github.com/balu100/simc-aoe-profiles.git
cp -r -f /opt/simc-aoe-profiles/* /app/SimulationCraft/profiles/

# Adding blank lines for formatting
echo ""
echo ""
echo ""

# Define common variables
SIMC_COMMAND="./simc"
TARGET_ERROR="target_error=0.2 ptr=0"
OUTPUT_DIR="/opt/outside"
LOG_FILE="/var/log/simc_script.log"

# Define error texts to look for
error_texts="Simulation has been forcefully cancelled|Segmentation fault|An error occurred while running the simulation|Failed to open file|Invalid simulation configuration|Insufficient memory|No valid profiles found|Unsupported operation|Simulation has been canceled after|Simulation has been forcefully cancelled at"

# Colors in a space-separated string (compatible with POSIX shell)
colors="\033[31m \033[33m \033[32m \033[36m \033[34m \033[35m"
color_list=$(echo $colors)

# Shuffle function to randomize the color order
shuffle_colors() {
  echo $color_list | tr ' ' '\n' | shuf | tr '\n' ' '
}

# Function to display a message with shuffled rainbow colors
display_colored_message() {
  local message="$1"
  local font="$2"
  
  # Shuffle the colors initially
  shuffled_colors=$(shuffle_colors)
  i=1
  
  # Display the message in shuffled rainbow colors with a larger font
  figlet -f "$font" "$message" | while IFS= read -r line; do
    # Get the current color from the shuffled list
    color=$(echo $shuffled_colors | cut -d' ' -f$i)
    
    # Display the line in the current color
    echo -e "${color}${line}\033[0m"
    
    # Move to the next color
    i=$((i + 1))
    
    # If we've used all colors, reshuffle them and reset the index
    if [ $i -gt $(echo $shuffled_colors | wc -w) ]; then
      shuffled_colors=$(shuffle_colors)
      i=1
    fi
  done
}

# Function to log messages
log_message() {
  local message="$1"
  echo -e "$message" | tee -a "$LOG_FILE"
}

# Function to run simc command with retry on specific errors
run_simc_with_retry() {
  local command="$1"
  local log_file="$2"
  local max_retries=5
  local attempt=0
  
  while [ $attempt -lt $max_retries ]; do
    log_message "Attempt $((attempt + 1))/$max_retries for command: $command..."
    
    # Run the command and capture the output
    output=$($command 2>&1 | tee -a "$log_file")
    
    # If the command succeeded, break the loop
    if echo "$output" | grep -q "html report took"; then
      log_message "Command executed successfully! \e[32m$command\e[0m"
      break
    fi
    
    # Check for specific error messages
    for error_text in $(echo "$error_texts" | tr '|' '\n'); do
      if echo "$output" | grep -F -x -q "$error_text"; then
        log_message "Error detected: \e[31m$error_text\e[0m. Retrying..."
        sleep 2
        break
      fi
    done
    
    # Increment the attempt counter
    attempt=$((attempt + 1))
    
    # If we've reached max retries, exit with an error
    if [ $attempt -eq $max_retries ]; then
      log_message "Max retries reached. Exiting with failure."
      exit 1
    fi
  done
}

# Display the version in rainbow colors
display_colored_message "Version 3.0.1" "big"

# List of simulation scenarios
scenarios=(
  "Bestrunfromraiderio.simc"
  "TWW1_Raid_SoB_10.simc"
  "TWW1_Raid_SoB_15.simc"
  "TWW1_Raid_MoTS_10.simc"
  "TWW1_Raid_MoTS_15.simc"
  "TWW1_Raid_TNW_10.simc"
  "TWW1_Raid_TNW_15.simc"
  "TWW1_Raid_AKCOE_10.simc"
  "TWW1_Raid_AKCOE_15.simc"
  "TWW1_Raid_CoT_10.simc"
  "TWW1_Raid_CoT_15.simc"
  "TWW1_Raid_TD_10.simc"
  "TWW1_Raid_TD_15.simc"
  "TWW1_Raid_TS_10.simc"
  "TWW1_Raid_TS_15.simc"
  "TWW1_Raid_GB_10.simc"
  "TWW1_Raid_GB_15.simc"
  "TWW1_Raid.simc"
)

# Run simulations for each scenario
for scenario in "${scenarios[@]}"; do
  html_file="${OUTPUT_DIR}/${scenario%.simc}.html"
  log_file="${OUTPUT_DIR}/${scenario%.simc}.log"
  
  display_colored_message "$(basename "$scenario" .simc)" "big"
  run_simc_with_retry "$SIMC_COMMAND $scenario html=$html_file $TARGET_ERROR" "$log_file"
done

# Final message in rainbow colors
display_colored_message "DONE" "big"

# Infinite loop to keep the script running (for container environment)
while true; do
  sleep 86400 # Sleep for 24 hours
done
