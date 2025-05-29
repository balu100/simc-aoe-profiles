#!/bin/bash
set -e

# Directories and file paths
REPO_DIR="/tmp/simc-aoe-profiles"
SIMC_DIR="/app/SimulationCraft/profiles"
OUTPUT_DIR="/opt/outside"
LOG_FILE="/var/log/simc_script.log"
SIMC_COMMAND="./simc"

# Clone and update the simulation profiles repository
setup_repo() {
  rm -rf "$REPO_DIR"
  git -C /tmp clone https://github.com/balu100/simc-aoe-profiles.git
  cp -r -f "$REPO_DIR"/* "$SIMC_DIR"
}

# Shuffle colors for message display
colors=("\033[31m" "\033[33m" "\033[32m" "\033[36m" "\033[34m" "\033[35m")
shuffle_colors() { echo "${colors[@]}" | tr ' ' '\n' | shuf | tr '\n' ' '; }

# Display message with ASCII art and shuffled colors
display_colored_message() {
  local message="$1"
  local font="${2:-standard}"  # Default to 'standard' if no font specified
  local shuffled_colors=($(shuffle_colors))

  figlet -f "$font" "$message" | while IFS= read -r line; do
    echo -e "${shuffled_colors[RANDOM % ${#shuffled_colors[@]}]}${line}\033[0m"
  done
}

# Log messages to file
log_message() {
  local message="$1"
  echo -e "$message" | tee -a "$LOG_FILE"
}

# Error patterns for retry logic
error_patterns=(
  "Simulation.*has.*been.*cancelled"
  "Simulation.*has.*been.*canceled"
  "Simulation.*forcefully.*cancelled"
  "Segmentation fault"
  "An error occurred while running the simulation"
  "Failed to open file"
  "Invalid simulation configuration"
  "Insufficient memory"
  "No valid profiles found"
  "Unsupported operation"
)

# Retry logic for running the simulation command
run_simc_with_retry() {
  local command="$1"
  local log_file="$2"
  local max_retries=3

  for attempt in $(seq 1 "$max_retries"); do
    log_message "Attempt $attempt/$max_retries for command: $command..."

    # Capture output of command
    command_output=$($command 2>&1 | tee -a "$log_file")
    command_status=$?

    # Check for error patterns with extended, case-insensitive matching
    error_found=false
    for error_pattern in "${error_patterns[@]}"; do
      if echo "$command_output" | grep -Eiq "$error_pattern"; then
        log_message "Error detected: $error_pattern. Retrying..."
        error_found=true
        sleep 2
        break
      fi
    done

    # If no errors, check for successful completion
    if ! $error_found && [ "$command_status" -eq 0 ] && echo "$command_output" | grep -iq "html report took"; then
      log_message "Command executed successfully! $command"
      return 0
    fi

    # Exit if max retries reached
    if [ "$attempt" -eq "$max_retries" ]; then
      log_message "Max retries reached. Exiting with failure."
      exit 1
    fi
  done
}

# Initial setup and display version info
setup_repo
display_colored_message "Version 3.1.1" "big"

# Simulation scenarios
scenarios=(
  "CinderbrewMeadery.simc"
  "DarkflameCleft.simc"
  "OperationFloodgate.simc"
  "TheMotherload.simc"
  "TheRookery.simc"
  "TheaterOfPain.simc"
  "OperationMechagonWorkshop.simc"
  "AoeSingleTarget.simc"
)

# Run simulations
for scenario in "${scenarios[@]}"; do
  scenario_base=$(basename "$scenario" .simc)
  json_file="${OUTPUT_DIR}/${scenario_base}.json"
  html_file="${OUTPUT_DIR}/${scenario_base}.html"
  log_file="${OUTPUT_DIR}/${scenario_base}.log"

  display_colored_message "$scenario_base" "small"
  run_simc_with_retry "$SIMC_COMMAND $scenario json2=$json_file html=$html_file $ARGS" "$log_file"
done

# Final completion message
display_colored_message "DONE" "big"

# Keep container alive
while true; do
  sleep 86400  # Sleep for 24 hours
done