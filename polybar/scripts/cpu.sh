#!/bin/bash

# Get CPU usage as a percentage
cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')

# Get CPU frequency in GHz
cpu_freq=$(echo "scale=2; $(cat /proc/cpuinfo | grep 'cpu MHz' | head -n 1 | awk '{print $4}') / 1000" | bc)

# Get CPU temperature in degrees Celsius
cpu_temp=$(cat /sys/class/thermal/thermal_zone0/temp)
cpu_temp=$(echo "scale=2;$cpu_temp/1000" | bc)

# Print the result in the desired format
echo "$cpu_usage% (${cpu_freq}GHz) (${cpu_temp}°C)"

