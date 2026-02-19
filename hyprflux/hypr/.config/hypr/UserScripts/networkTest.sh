#!/bin/bash

TARGET="8.8.8.8"
COUNT=20

echo "📡 Running network quality test..."
echo "-------------------------------------------"

# 1. Speed test
echo "⚡ Running speedtest..."
SPEED_OUTPUT=$(speedtest --format=json)

PING=$(echo "$SPEED_OUTPUT" | jq '.ping.latency')
DOWNLOAD=$(echo "$SPEED_OUTPUT" | jq '.download.bandwidth' | awk '{print $1/125000}')
UPLOAD=$(echo "$SPEED_OUTPUT" | jq '.upload.bandwidth' | awk '{print $1/125000}')

DOWNLOAD_INT=$(printf "%.0f" "$DOWNLOAD")
UPLOAD_INT=$(printf "%.0f" "$UPLOAD")

echo "Ping: ${PING} ms"
echo "Download: ${DOWNLOAD_INT} Mbps"
echo "Upload: ${UPLOAD_INT} Mbps"
echo "-------------------------------------------"

# 2. Ping test
echo "📡 Checking packet loss and jitter to $TARGET ..."
PING_OUTPUT=$(ping -i 0.2 -c $COUNT $TARGET)

LOSS=$(echo "$PING_OUTPUT" | grep -oP '\d+(?=% packet loss)')
AVG=$(echo "$PING_OUTPUT" | grep -oP '(?<=rtt min/avg/max/mdev = ).*' | cut -d'/' -f2 | cut -d'.' -f1)
JITTER=$(echo "$PING_OUTPUT" | grep -oP '(?<=rtt min/avg/max/mdev = ).*' | cut -d'/' -f4 | cut -d'.' -f1)

echo "Packet Loss: $LOSS%"
echo "Avg Latency: ${AVG} ms"
echo "Jitter: ${JITTER} ms"
echo "-------------------------------------------"

# 3. Verdict
echo "📊 Final Verdict:"
GOOD=true

if [ "$DOWNLOAD_INT" -lt 5 ]; then
  echo "❌ Download speed too low for video calls."
  GOOD=false
fi

if [ "$UPLOAD_INT" -lt 3 ]; then
  echo "❌ Upload speed too low (need at least 3 Mbps)."
  GOOD=false
fi

if [ "$LOSS" -gt 2 ]; then
  echo "❌ Too much packet loss. Calls will freeze."
  GOOD=false
fi

if [ "$AVG" -gt 150 ]; then
  echo "⚠️ High latency. You may notice delay."
  GOOD=false
fi

if [ "$JITTER" -gt 30 ]; then
  echo "⚠️ Jitter is high. Video may stutter."
  GOOD=false
fi

if [ "$GOOD" = true ]; then
  echo "✅ Internet is GOOD for video calls (Zoom/Meet/Teams)."
else
  echo "⚠️ Internet is NOT ideal for smooth video calls."
fi
