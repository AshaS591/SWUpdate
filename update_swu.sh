#!/bin/bash

WATCH_DIR="$HOME/hello_swu"
SRC_FILE="$WATCH_DIR/hello.py"
ROOTFS="$WATCH_DIR/rootfs/usr/local/bin"
SWU_FILE="$WATCH_DIR/hello_signed.swu"
SWDESC="$WATCH_DIR/sw-description"
PRIV_KEY="$WATCH_DIR/priv.pem"

# Copy to rootfs
cp "$SRC_FILE" "$ROOTFS/hello.py"

# Create signed SWU
mkswu -d "$WATCH_DIR/rootfs" -o "$SWU_FILE" -s "$SWDESC" -k "$PRIV_KEY"

# Flash to live system
sudo swupdate -i "$SWU_FILE" -k "$WATCH_DIR/pub.pem" -v
