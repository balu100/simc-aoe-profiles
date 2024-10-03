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
figlet -f big "Version 1.0" | while IFS= read -r line; do
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



echo "siege-of-boralu"
./simc TWW1_Raid_SoB_10.simc json2=/opt/outside/TWW1_Raid_SoB_10.json html=/opt/outside/TWW1_Raid_SoB_10.html target_error=1.0 ptr=0
#./simc TWW1_Raid_SoB_10.simc json2=/opt/outside/TWW1_Raid_SoB_10_PTR.json html=/opt/outside/TWW1_Raid_SoB_10_PTR.html target_error=1.0 ptr=1
./simc TWW1_Raid_SoB_15.simc json2=/opt/outside/TWW1_Raid_SoB_15.json html=/opt/outside/TWW1_Raid_SoB_15.html target_error=1.0 ptr=0
#./simc TWW1_Raid_SoB_15.simc json2=/opt/outside/TWW1_Raid_SoB_15_PTR.json html=/opt/outside/TWW1_Raid_SoB_15_PTR.html target_error=1.0 ptr=1

echo "mists-of-tirna-scithe"
./simc TWW1_Raid_MoTS_10.simc json2=/opt/outside/TWW1_Raid_MoTS_10.json html=/opt/outside/TWW1_Raid_MoTS_10.html target_error=1.0 ptr=0
#./simc TWW1_Raid_MoTS_10.simc json2=/opt/outside/TWW1_Raid_MoTS_10_PTR.json html=/opt/outside/TWW1_Raid_MoTS_10_PTR.html target_error=1.0 ptr=1
./simc TWW1_Raid_MoTS_15.simc json2=/opt/outside/TWW1_Raid_MoTS_15.json html=/opt/outside/TWW1_Raid_MoTS_15.html target_error=1.0 ptr=0
#./simc TWW1_Raid_MoTS_15.simc json2=/opt/outside/TWW1_Raid_MoTS_15_PTR.json html=/opt/outside/TWW1_Raid_MoTS_15_PTR.html target_error=1.0 ptr=1


echo "the-necrotic-wake"
./simc TWW1_Raid_TNW_10.simc json2=/opt/outside/TWW1_Raid_TNW_10.json html=/opt/outside/TWW1_Raid_TNW_10.html target_error=1.0 ptr=0
#./simc TWW1_Raid_TNW_10.simc json2=/opt/outside/TWW1_Raid_TNW_10_PTR.json html=/opt/outside/TWW1_Raid_TNW_10_PTR.html target_error=1.0 ptr=1
./simc TWW1_Raid_TNW_15.simc json2=/opt/outside/TWW1_Raid_TNW_15.json html=/opt/outside/TWW1_Raid_TNW_15.html target_error=1.0 ptr=0
#./simc TWW1_Raid_TNW_15.simc json2=/opt/outside/TWW1_Raid_TNW_15_PTR.json html=/opt/outside/TWW1_Raid_TNW_15_PTR.html target_error=1.0 ptr=1


echo "ara-kara-city-of-echoes"
./simc TWW1_Raid_AKCOE_10.simc json2=/opt/outside/TWW1_Raid_AKCOE_10.json html=/opt/outside/TWW1_Raid_AKCOE_10.html target_error=1.0 ptr=0
#./simc TWW1_Raid_AKCOE_10.simc json2=/opt/outside/TWW1_Raid_AKCOE_10_PTR.json html=/opt/outside/TWW1_Raid_AKCOE_10_PTR.html target_error=1.0 ptr=1
./simc TWW1_Raid_AKCOE_15.simc json2=/opt/outside/TWW1_Raid_AKCOE_15.json html=/opt/outside/TWW1_Raid_AKCOE_15.html target_error=1.0 ptr=0
#./simc TWW1_Raid_AKCOE_15.simc json2=/opt/outside/TWW1_Raid_AKCOE_15_PTR.json html=/opt/outside/TWW1_Raid_AKCOE_15_PTR.html target_error=1.0 ptr=1


echo "city-of-threads"
./simc TWW1_Raid_CoT_10.simc json2=/opt/outside/TWW1_Raid_CoT_10.json html=/opt/outside/TWW1_Raid_CoT_10.html target_error=1.0 ptr=0
#./simc TWW1_Raid_CoT_10.simc json2=/opt/outside/TWW1_Raid_CoT_10_PTR.json html=/opt/outside/TWW1_Raid_CoT_10_PTR.html target_error=1.0 ptr=1
./simc TWW1_Raid_CoT_15.simc json2=/opt/outside/TWW1_Raid_CoT_15.json html=/opt/outside/TWW1_Raid_CoT_15.html target_error=1.0 ptr=0
#./simc TWW1_Raid_CoT_15.simc json2=/opt/outside/TWW1_Raid_CoT_15_PTR.json html=/opt/outside/TWW1_Raid_CoT_15_PTR.html target_error=1.0 ptr=1


echo "the-dawnbreaker"
./simc TWW1_Raid_TD_10.simc json2=/opt/outside/TWW1_Raid_TD_10.json html=/opt/outside/TWW1_Raid_TD_10.html target_error=1.0 ptr=0
#./simc TWW1_Raid_TD_10.simc json2=/opt/outside/TWW1_Raid_TD_10_PTR.json html=/opt/outside/TWW1_Raid_TD_10_PTR.html target_error=1.0 ptr=1
./simc TWW1_Raid_TD_15.simc json2=/opt/outside/TWW1_Raid_TD_15.json html=/opt/outside/TWW1_Raid_TD_15.html target_error=1.0 ptr=0
#./simc TWW1_Raid_TD_15.simc json2=/opt/outside/TWW1_Raid_TD_15_PTR.json html=/opt/outside/TWW1_Raid_TD_15_PTR.html target_error=1.0 ptr=1


echo "the-stonevault"
./simc TWW1_Raid_TS_10.simc json2=/opt/outside/TWW1_Raid_TS_10.json html=/opt/outside/TWW1_Raid_TS_10.html target_error=1.0 ptr=0
#./simc TWW1_Raid_TS_10.simc json2=/opt/outside/TWW1_Raid_TS_10_PTR.json html=/opt/outside/TWW1_Raid_TS_10_PTR.html target_error=1.0 ptr=1
./simc TWW1_Raid_TS_15.simc json2=/opt/outside/TWW1_Raid_TS_15.json html=/opt/outside/TWW1_Raid_TS_15.html target_error=1.0 ptr=0
#./simc TWW1_Raid_TS_15.simc json2=/opt/outside/TWW1_Raid_TS_15_PTR.json html=/opt/outside/TWW1_Raid_TS_15_PTR.html target_error=1.0 ptr=1

echo "grim-batol"
./simc TWW1_Raid_GB_10.simc json2=/opt/outside/TWW1_Raid_GB_10.json html=/opt/outside/TWW1_Raid_GB_10.html target_error=1.0 ptr=0
#./simc TWW1_Raid_GB_10.simc json2=/opt/outside/TWW1_Raid_GB_10_PTR.json html=/opt/outside/TWW1_Raid_GB_10_PTR.html target_error=1.0 ptr=1
./simc TWW1_Raid_GB_15.simc json2=/opt/outside/TWW1_Raid_GB_15.json html=/opt/outside/TWW1_Raid_GB_15.html target_error=1.0 ptr=0
#./simc TWW1_Raid_GB_15.simc json2=/opt/outside/TWW1_Raid_GB_15_PTR.json html=/opt/outside/TWW1_Raid_GB_15_PTR.html target_error=1.0 ptr=1

echo "single target with aoe"
./simc TWW1_Raid.simc json2=/opt/outside/TWW1_Raid.json html=/opt/outside/TWW1_Raid.html target_error=1.0 ptr=0
#./simc TWW1_Raid.simc json2=/opt/outside/TWW1_Raid_PTR.json html=/opt/outside/TWW1_Raid_PTR.html target_error=1.0 ptr=1


echo "done"
echo "done 10%"
echo "done 20%"
echo "done 30%"
echo "done 40%"
echo "done 50%"
echo "done 60%"
echo "done 70%"
echo "done 80%"
echo "done 90%"
echo "done 100%"


# Run an infinite loop with no task
while true; do
  # Just sleep to keep the script running
  sleep 86400 # Sleep for 24 hours
done
