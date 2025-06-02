#!/bin/bash
IMAGE_FILE="$1"

# Install fswebcam first: sudo apt install fswebcam
fswebcam -r 640x480 --no-banner "$IMAGE_FILE"
