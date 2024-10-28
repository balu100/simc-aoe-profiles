#!/bin/sh

apk update
apk add --no-cache nano git figlet
rm -rf /opt/simc-aoe-profiles
git -C /opt clone https://github.com/balu100/simc-aoe-profiles.git
cp -r -f /opt/simc-aoe-profiles/* /app/SimulationCraft/profiles/

# Adding blank lines
echo ""
echo ""
echo ""

# Colors in a space-separated string (compatible with POSIX shell)
colors="\033[31m \033[33m \033[32m \033[36m \033[34m \033[35m"
color_list=$(echo $colors)

# Shuffle function to randomize the color order
shuffle_colors() {
  echo $color_list | tr ' ' '\n' | shuf | tr '\n' ' '
}

# Shuffle the colors initially
shuffled_colors=$(shuffle_colors)

# Counter to track which color we're on
i=1

# Displaying the message in shuffled rainbow colors with a larger font
figlet -f big "Version 3.0" | while IFS= read -r line; do
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

# Adding more blank lines
echo ""
echo ""
echo ""

# Define error texts to look for
error_texts="Simulation has been forcefully cancelled|Segmentation fault|An error occurred while running the simulation|Failed to open file|Invalid simulation configuration|Insufficient memory|No valid profiles found|Unsupported operation|Simulation has been canceled after"

# Function to run simc command with retry on specific errors
run_simc_with_retry() {
  local command="$1"
  local log_file="$2"
  local retry=true
  
  while $retry; do
    # Run the command and capture the output, appending to the log file
    output=$($command 2>&1 | tee -a "$log_file")
    
    # Assume success unless an error is detected or the output does not contain "html report took"
    retry=false
    
    # Check if any error text is in the output
    for error_text in $(echo "$error_texts" | tr '|' '\n'); do
      if echo "$output" | grep -F -x -q "$error_text"; then
        echo -e "Error detected: \e[31m$error_text\e[0m. Retrying..." | tee -a "$log_file" # Make the error text red and log it
        retry=true
        sleep 2  # Add a short delay before retrying
        break
      fi
    done
    
    # Check if the output contains "html report took" to determine if the command succeeded
    if ! echo "$output" | grep -q "html report took"; then
      echo -e "Output did not contain 'html report took'. Retrying..." | tee -a "$log_file"
      retry=true
      sleep 2
    fi
    
    # If no errors were found and the correct output was present, print a success message and log it
    if ! $retry; then
      echo -e "Command executed successfully! \e[32m$command\e[0m" | tee -a "$log_file"
      echo "$output" >> "$log_file"  # Append the output of the command to the log file
    fi
  done
}

# Commands with retry logic
echo "RIO" | figlet -f big
echo ""
run_simc_with_retry "./simc Bestrunfromraiderio.simc json2=/opt/outside/Bestrunfromraiderio.json html=/opt/outside/Bestrunfromraiderio.html target_error=0.2 ptr=0" "/opt/outside/Bestrunfromraiderio.log"

echo "SOB" | figlet -f big
echo ""
run_simc_with_retry "./simc TWW1_Raid_SoB_10.simc json2=/opt/outside/TWW1_Mythic_SoB_10.json html=/opt/outside/TWW1_Mythic_SoB_10.html target_error=0.2 ptr=0" "/opt/outside/TWW1_Mythic_SoB_10.log"
run_simc_with_retry "./simc TWW1_Raid_SoB_15.simc json2=/opt/outside/TWW1_Mythic_SoB_15.json html=/opt/outside/TWW1_Mythic_SoB_15.html target_error=0.2 ptr=0" "/opt/outside/TWW1_Mythic_SoB_15.log"

echo "MITS" | figlet -f big
echo ""
run_simc_with_retry "./simc TWW1_Raid_MoTS_10.simc json2=/opt/outside/TWW1_Mythic_MoTS_10.json html=/opt/outside/TWW1_Mythic_MoTS_10.html target_error=0.2 ptr=0" "/opt/outside/TWW1_Mythic_MoTS_10.log"
run_simc_with_retry "./simc TWW1_Raid_MoTS_15.simc json2=/opt/outside/TWW1_Mythic_MoTS_15.json html=/opt/outside/TWW1_Mythic_MoTS_15.html target_error=0.2 ptr=0" "/opt/outside/TWW1_Mythic_MoTS_15.log"

echo "NW" | figlet -f big
echo ""
run_simc_with_retry "./simc TWW1_Raid_TNW_10.simc json2=/opt/outside/TWW1_Mythic_TNW_10.json html=/opt/outside/TWW1_Mythic_TNW_10.html target_error=0.2 ptr=0" "/opt/outside/TWW1_Mythic_TNW_10.log"
run_simc_with_retry "./simc TWW1_Raid_TNW_15.simc json2=/opt/outside/TWW1_Mythic_TNW_15.json html=/opt/outside/TWW1_Mythic_TNW_15.html target_error=0.2 ptr=0" "/opt/outside/TWW1_Mythic_TNW_15.log"

echo "COE" | figlet -f big
echo ""
run_simc_with_retry "./simc TWW1_Raid_AKCOE_10.simc json2=/opt/outside/TWW1_Mythic_AKCOE_10.json html=/opt/outside/TWW1_Mythic_AKCOE_10.html target_error=0.2 ptr=0" "/opt/outside/TWW1_Mythic_AKCOE_10.log"
run_simc_with_retry "./simc TWW1_Raid_AKCOE_15.simc json2=/opt/outside/TWW1_Mythic_AKCOE_15.json html=/opt/outside/TWW1_Mythic_AKCOE_15.html target_error=0.2 ptr=0" "/opt/outside/TWW1_Mythic_AKCOE_15.log"

echo "COT" | figlet -f big
echo ""
run_simc_with_retry "./simc TWW1_Raid_CoT_10.simc json2=/opt/outside/TWW1_Mythic_CoT_10.json html=/opt/outside/TWW1_Mythic_CoT_10.html target_error=0.2 ptr=0" "/opt/outside/TWW1_Mythic_CoT_10.log"
run_simc_with_retry "./simc TWW1_Raid_CoT_15.simc json2=/opt/outside/TWW1_Mythic_CoT_15.json html=/opt/outside/TWW1_Mythic_CoT_15.html target_error=0.2 ptr=0" "/opt/outside/TWW1_Mythic_CoT_15.log"

echo "TD" | figlet -f big
echo ""
run_simc_with_retry "./simc TWW1_Raid_TD_10.simc json2=/opt/outside/TWW1_Mythic_TD_10.json html=/opt/outside/TWW1_Mythic_TD_10.html target_error=0.2 ptr=0" "/opt/outside/TWW1_Mythic_TD_10.log"
run_simc_with_retry "./simc TWW1_Raid_TD_15.simc json2=/opt/outside/TWW1_Mythic_TD_15.json html=/opt/outside/TWW1_Mythic_TD_15.html target_error=0.2 ptr=0" "/opt/outside/TWW1_Mythic_TD_15.log"

echo "TS" | figlet -f big
echo ""
run_simc_with_retry "./simc TWW1_Raid_TS_10.simc json2=/opt/outside/TWW1_Mythic_TS_10.json html=/opt/outside/TWW1_Mythic_TS_10.html target_error=0.2 ptr=0" "/opt/outside/TWW1_Mythic_TS_10.log"
run_simc_with_retry "./simc TWW1_Raid_TS_15.simc json2=/opt/outside/TWW1_Mythic_TS_15.json html=/opt/outside/TWW1_Mythic_TS_15.html target_error=0.2 ptr=0" "/opt/outside/TWW1_Mythic_TS_15.log"

echo "GB" | figlet -f big
echo ""
run_simc_with_retry "./simc TWW1_Raid_GB_10.simc json2=/opt/outside/TWW1_Mythic_GB_10.json html=/opt/outside/TWW1_Mythic_GB_10.html target_error=0.2 ptr=0" "/opt/outside/TWW1_Mythic_GB_10.log"
run_simc_with_retry "./simc TWW1_Raid_GB_15.simc json2=/opt/outside/TWW1_Mythic_GB_15.json html=/opt/outside/TWW1_Mythic_GB_15.html target_error=0.2 ptr=0" "/opt/outside/TWW1_Mythic_GB_15.log"

echo "ST" | figlet -f big
echo ""
run_simc_with_retry "./simc TWW1_Raid.simc json2=/opt/outside/TWW1_Mythic.json html=/opt/outside/TWW1_Mythic.html target_error=0.2 ptr=0" "/opt/outside/TWW1_Mythic.log"

# Final message
echo ""
echo ""
echo ""
echo "DONE" | figlet -f big
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""

# Run an infinite loop with no task
while true; do
  sleep 86400 # Sleep for 24 hours
done
