#!/bin/sh
set -euo pipefail # Exit on error, treat unset vars as error, pipefail

# URL of the script to download
SCRIPT_URL="https://raw.githubusercontent.com/balu100/simc-aoe-profiles/main/torun.sh"
# Path where the script will be saved
SCRIPT_PATH="/app/SimulationCraft/torun.sh"
# Temporary path for download
SCRIPT_TEMP_PATH="$SCRIPT_PATH.tmp"
# Log file path
LOG_FILE="/var/log/torun_download.log"

# Ensure log directory exists and log file can be written to
mkdir -p "$(dirname "$LOG_FILE")"
touch "$LOG_FILE"

# Function for logging with timestamp
log_message() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a "$LOG_FILE"
}

log_message "Starting script update process..."

# Ensure target script directory exists
mkdir -p "$(dirname "$SCRIPT_PATH")"

# Generate a highly unique cache buster (seconds + nanoseconds)
# Alpine's BusyBox date supports %N
CACHE_BUSTER="$(date +%s%N)"

log_message "Downloading the latest script from $SCRIPT_URL to $SCRIPT_TEMP_PATH"
log_message "Using cache buster: ?$CACHE_BUSTER"

# Download with aggressive cache-busting headers and retries
# Stderr from curl will also go to the log file
if curl -fsSL \
     --retry 3 \
     --retry-delay 5 \
     -H "Cache-Control: no-cache, no-store, must-revalidate" \
     -H "Pragma: no-cache" \
     -H "Expires: 0" \
     "$SCRIPT_URL?$CACHE_BUSTER" \
     -o "$SCRIPT_TEMP_PATH" >> "$LOG_FILE" 2>&1; then
    log_message "Curl command finished. Checking downloaded file..."
else
    # Curl failed (e.g., network error after retries, or -f caused exit on HTTP 4xx/5xx)
    # The error message from curl (due to -S) should be in the log.
    log_message "Download failed. Curl exit code: $?. Check log for curl error messages."
    # Clean up potentially empty or partial temp file
    rm -f "$SCRIPT_TEMP_PATH"
    exit 1
fi

# Check if the downloaded file is not empty
if [ ! -s "$SCRIPT_TEMP_PATH" ]; then
    log_message "Download seemed to succeed, but the temporary file $SCRIPT_TEMP_PATH is empty. This could be an issue with the remote file or a silent curl problem. Exiting."
    # Clean up empty temp file
    rm -f "$SCRIPT_TEMP_PATH"
    exit 1
fi

log_message "Download successful. Temporary file $SCRIPT_TEMP_PATH is valid and not empty."

# Atomically replace the old script with the new one
if mv "$SCRIPT_TEMP_PATH" "$SCRIPT_PATH"; then
    log_message "Successfully moved $SCRIPT_TEMP_PATH to $SCRIPT_PATH."
else
    log_message "Failed to move $SCRIPT_TEMP_PATH to $SCRIPT_PATH. Exiting."
    rm -f "$SCRIPT_TEMP_PATH" # Clean up temp file if move failed
    exit 1
fi

# Make the script executable
if chmod +x "$SCRIPT_PATH"; then
    log_message "$SCRIPT_PATH is now executable."
else
    log_message "Failed to make $SCRIPT_PATH executable. Exiting."
    exit 1
fi

# Run the script
log_message "Executing the updated script: $SCRIPT_PATH"
exec "$SCRIPT_PATH"