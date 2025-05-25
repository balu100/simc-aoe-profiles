#!/bin/bash
set -e

# Update package list and install dependencies
apk update && apk add --no-cache nano git figlet

# Directories and file paths
REPO_DIR="/tmp/simc-aoe-profiles"
SIMC_DIR="/app/SimulationCraft/profiles"
OUTPUT_DIR="/opt/outside"
LOG_FILE="/var/log/simc_script.log" # This is the main script log file
SIMC_COMMAND="./simc"
TARGET_ERROR="target_error=1 ptr=0"

# Clone and update the simulation profiles repository
setup_repo() {
  rm -rf "$REPO_DIR"
  git -C /opt clone https://github.com/balu100/simc-aoe-profiles.git
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

# Log messages to file and console
log_message() {
  local message="$1"
  # Ensure multi-line messages are handled by echo correctly when passed to tee
  # The -e allows interpretation of backslash escapes, $message should be quoted.
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
  "Simulation has been forcefully cancelled at 4080.000"
  "Simulation has been forcefully cancelled at"
)

# Retry logic for running the simulation command
run_simc_with_retry() {
  local command="$1"
  local scenario_log_file="$2" # Renamed for clarity: this is the scenario-specific log
  local max_retries=3
  local command_output # To store output of the command
  local command_status # To store exit status of the command

  for attempt in $(seq 1 "$max_retries"); do
    log_message "Attempt $attempt/$max_retries for command: $command..."

    # Capture output of command. The output also goes to console and scenario_log_file due to tee.
    command_output=$($command 2>&1 | tee -a "$scenario_log_file")
    command_status=${PIPESTATUS[0]} # Get status of $command, not tee

    # Check for error patterns with extended, case-insensitive matching
    local error_found=false # Use local for variables inside functions
    for error_pattern in "${error_patterns[@]}"; do
      if echo "$command_output" | grep -Eiq "$error_pattern"; then
        log_message "Error detected (matches pattern '$error_pattern'). Retrying..."
        error_found=true
        sleep 2
        break
      fi
    done

    # If no errors (based on patterns), check for successful completion
    if ! $error_found && [ "$command_status" -eq 0 ] && echo "$command_output" | grep -iq "html report took"; then
      log_message "Command executed successfully! $command"
      return 0
    fi

    # If this is the last attempt, and it wasn't successful, then exit.
    if [ "$attempt" -eq "$max_retries" ]; then
      log_message "Max retries reached for command: $command"
      log_message "The command failed on the final attempt (Attempt $attempt/$max_retries)."
      log_message "Exit status of last attempt: $command_status"
      log_message "Full output of the last attempt was:"
      # log_message will print command_output to console and main log file
      # The command_output is already in the scenario_log_file
      log_message "$command_output"
      log_message "Exiting script due to persistent failure of this command."
      exit 1 # Exit the entire script
    fi

    # If not the last attempt, and an error occurred (either matched pattern or other failure),
    # the loop will continue for the next attempt.
    # A message for retrying due to a matched pattern was already logged.
    # If it's an un-matched error, it will just loop to the next attempt message.
  done
}

# Initial setup and display version info
setup_repo
display_colored_message "Version 3.3.3" "big"

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

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"
# Create main log file if it doesn't exist and ensure it's writable
touch "$LOG_FILE" && chmod 644 "$LOG_FILE"


# Run simulations
for scenario in "${scenarios[@]}"; do
  scenario_base=$(basename "$scenario" .simc)
  json_file="${OUTPUT_DIR}/${scenario_base}.json"
  html_file="${OUTPUT_DIR}/${scenario_base}.html"
  # This is the scenario-specific log file passed to run_simc_with_retry
  scenario_specific_log_file="${OUTPUT_DIR}/${scenario_base}.log"
  
  # Ensure scenario-specific log file is fresh for each run or append as preferred
  # For fresh log each time: > "$scenario_specific_log_file"
  # Current script appends due to `tee -a`

  display_colored_message "$scenario_base" "small"
  run_simc_with_retry "$SIMC_COMMAND $scenario json2=\"$json_file\" html=\"$html_file\" $TARGET_ERROR" "$scenario_specific_log_file"
done

# Final completion message
display_colored_message "DONE" "big"

# Keep container alive
while true; do
  sleep 86400  # Sleep for 24 hours
done