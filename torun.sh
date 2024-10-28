#!/bin/bash
set -e

# Update package list and install dependencies
apk update && apk add --no-cache nano git figlet

# Clone and update the simulation profiles repository
REPO_DIR="/opt/simc-aoe-profiles"
SIMC_DIR="/app/SimulationCraft/profiles"
rm -rf "$REPO_DIR"
git -C /opt clone https://github.com/balu100/simc-aoe-profiles.git
cp -r -f "$REPO_DIR"/* "$SIMC_DIR"

# Add blank lines for formatting
echo -e "\n\n\n"

# Common variables
SIMC_COMMAND="./simc"
TARGET_ERROR="target_error=0.2 ptr=0"
OUTPUT_DIR="/opt/outside"
LOG_FILE="/var/log/simc_script.log"

# Error patterns for retry logic
error_patterns=(
  "Simulation has been forcefully cancelled"
  "Segmentation fault"
  "An error occurred while running the simulation"
  "Failed to open file"
  "Invalid simulation configuration"
  "Insufficient memory"
  "No valid profiles found"
  "Unsupported operation"
  "Simulation has been canceled after"
)

# Colors for messages
colors=("\033[31m" "\033[33m" "\033[32m" "\033[36m" "\033[34m" "\033[35m")

# Shuffle function for randomizing color order
shuffle_colors() {
  echo "${colors[@]}" | tr ' ' '\n' | shuf | tr '\n' ' '
}

# Display a message with shuffled rainbow colors
display_colored_message() {
  local message="$1"
  local font="$2"
  local shuffled_colors
  shuffled_colors=$(shuffle_colors)

  figlet -f "$font" "$message" | while IFS= read -r line; do
    for color in $shuffled_colors; do
      echo -e "${color}${line}\033[0m"
    done
  done
}

# Log a message
log_message() {
  local message="$1"
  echo -e "$message" | tee -a "$LOG_FILE"
}

# Retry logic for running the simulation command
run_simc_with_retry() {
  local command="$1"
  local log_file="$2"
  local max_retries=5

  for attempt in $(seq 1 $max_retries); do
    log_message "Attempt $attempt/$max_retries for command: $command..."

    # Run the command and capture output
    if $command 2>&1 | tee -a "$log_file" | grep -q "html report took"; then
      log_message "Command executed successfully! \e[32m$command\e[0m"
      return 0
    fi

    # Check for specific error patterns
    for error_pattern in "${error_patterns[@]}"; do
      if grep -q "$error_pattern" "$log_file"; then
        log_message "Error detected: \e[31m$error_pattern\e[0m. Retrying..."
        sleep 2
        break
      fi
    done

    # If max retries reached, exit with an error
    if [ "$attempt" -eq "$max_retries" ]; then
      log_message "Max retries reached. Exiting with failure."
      exit 1
    fi
  done
}


# Display version info
display_colored_message "Version 3.0.2" "big"

# Simulation scenarios
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

# Run simulations
for scenario in "${scenarios[@]}"; do
  scenario_base=$(basename "$scenario" .simc)
  json_file="${OUTPUT_DIR}/${scenario_base}.json"
  html_file="${OUTPUT_DIR}/${scenario_base}.html"
  log_file="${OUTPUT_DIR}/${scenario_base}.log"

  display_colored_message "$scenario_base" "big"
  run_simc_with_retry "$SIMC_COMMAND $scenario json2=$json_file html=$html_file $TARGET_ERROR" "$log_file"
done

# Final message
display_colored_message "DONE" "big"

# Keep script running in a container environment
while true; do
  sleep 86400 # Sleep for 24 hours
done
