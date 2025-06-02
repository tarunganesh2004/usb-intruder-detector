#!/bin/bash

IMAGE="$1"
TIME="$2"
USB_INFO="$3"

# Uses 'mail' command or sendmail
echo -e "USB Alert at $TIME\n\nUSB Details:\n$USB_INFO" | mutt -s "USB Intruder Alert!" -a "$IMAGE" -- your@email.com
