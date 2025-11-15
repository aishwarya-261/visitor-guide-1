#!/bin/bash

# Targets & ports
TARGETS="$1"
PORTS="$2"
RATE="${3:-100}"

# Timestamp for results
DATE=$(date +"%Y-%m-%d_%H-%M-%S")

# Output file
OUTFILE="scan_$DATE.xml"

echo "Running Masscan on $TARGETS ports $PORTS..."

# Masscan command (clean output)
sudo masscan "$TARGETS" -p"$PORTS" --rate "$RATE" \
  -oX "$OUTFILE" --verbosity 0 2>&1 | grep -v "Discovered open port"

echo "Scan complete. Result saved to $OUTFILE"
