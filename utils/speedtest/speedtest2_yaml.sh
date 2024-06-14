#!/bin/bash

# Set variables for clarity and readability
LITE_SPEEDTEST_URL="https://github.com/xxf098/LiteSpeedTest/releases/download/v0.15.0/lite-linux-amd64-v0.15.0.gz"
LITE_CONFIG_URL="https://raw.githubusercontent.com/Airuop/cross/master/utils/speedtest/lite_config_yaml.json"
SUB_MERGE_YAML_URL="https://raw.githubusercontent.com/Airuop/cross/master/sub/sub_merge_yaml.yml"
LOG_FILE="speedtest.log"

# Download LiteSpeedTest binary
cat <<<  "Downloading LiteSpeedTest binary..."
wget -q -O lite-linux-amd64.gz "$LITE_SPEEDTEST_URL"
cat <<<  "Download complete."

# Extract the binary
cat <<<  "Extracting LiteSpeedTest binary..."
gzip -d lite-linux-amd64.gz
cat <<<  "Extraction complete."

# Download LiteSpeedTest configuration
cat <<<  "Downloading LiteSpeedTest configuration..."
wget -q -O lite_config.json "$LITE_CONFIG_URL"
cat <<<  "Download complete."

# Make the binary executable
cat <<<  "Making LiteSpeedTest binary executable..."
chmod +x ./lite-linux-amd64
cat <<<  "Done."

# Run LiteSpeedTest with configuration and logging
cat <<<  "Running LiteSpeedTest..."
sudo nohup ./lite-linux-amd64 --config ./lite_config.json --test "$SUB_MERGE_YAML_URL" > "$LOG_FILE" 2>&1 &
cat <<<  "LiteSpeedTest running in background. Log file: $LOG_FILE"

# Show log output in real-time
cat <<<  "Log output:"
tail -f "$LOG_FILE"
