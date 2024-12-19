#!/bin/bash

# Define your network interface (adjust based on your system)
WIFI_INTERFACE=$(networksetup -listallhardwareports | awk '/Wi-Fi/{getline; print $2}')

# Get current network stats
if [ -n "$WIFI_INTERFACE" ]; then
  # Capture initial transmitted and received bytes
  RX_BYTES=$(netstat -ib | grep "$WIFI_INTERFACE" | awk 'NR==1 {print $7}')
  TX_BYTES=$(netstat -ib | grep "$WIFI_INTERFACE" | awk 'NR==1 {print $10}')
  
  # Wait for a second to calculate the difference
  sleep 1
  
  # Capture transmitted and received bytes again
  RX_BYTES_NEW=$(netstat -ib | grep "$WIFI_INTERFACE" | awk 'NR==1 {print $7}')
  TX_BYTES_NEW=$(netstat -ib | grep "$WIFI_INTERFACE" | awk 'NR==1 {print $10}')
  
  # Calculate upload and download speeds
  RX_SPEED=$((RX_BYTES_NEW - RX_BYTES)) # Download speed in bytes per second
  TX_SPEED=$((TX_BYTES_NEW - TX_BYTES)) # Upload speed in bytes per second
  
  # Convert to human-readable format (KB/s or MB/s)
  RX_HUMAN=$(echo "$RX_SPEED" | awk '{printf "%.1f KB/s", $1/1024}')
  TX_HUMAN=$(echo "$TX_SPEED" | awk '{printf "%.1f KB/s", $1/1024}')
  
  # Display the result
  echo "⬇ $RX_HUMAN ⬆ $TX_HUMAN"
else
  echo "Disconnected"
fi

sketchybar -m --set network.down label="$RX_HUMAN" icon.highlight="$(if [ "$DOWN" -gt "0" ]; then echo "on"; else echo "off"; fi)" \
	--set network.up label="$TX_HUMAN" icon.highlight="$(if [ "$UP" -gt "0" ]; then echo "on"; else echo "off"; fi)"
