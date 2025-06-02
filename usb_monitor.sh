#!/bin/bash

LOG_FILE="./logs/usb_events.log"
IMAGE_DIR="./images"
CAPTURE_SCRIPT="./capture_image.sh"
ALERT_SCRIPT="./send_alert.sh"

mkdir -p "$IMAGE_DIR" logs

echo "Monitoring USB devices..."

while true; do
    NEW_USB=$(lsusb)
    if [ "$NEW_USB" != "$OLD_USB" ]; then
        TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
        echo "[!] USB change detected at $TIMESTAMP" | tee -a "$LOG_FILE"
        echo "$NEW_USB" | tee -a "$LOG_FILE"

        IMAGE_FILE="$IMAGE_DIR/intruder_$(date '+%Y%m%d_%H%M%S').jpg"
        bash "$CAPTURE_SCRIPT" "$IMAGE_FILE"
        
        bash "$ALERT_SCRIPT" "$IMAGE_FILE" "$TIMESTAMP" "$NEW_USB"

        OLD_USB="$NEW_USB"
    fi
    sleep 5
done
