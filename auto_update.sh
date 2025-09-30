#!/bin/bash
WATCH_DIR="$HOME/hello_swu"

while true; do
    inotifywait -e modify "$WATCH_DIR/hello.py"
    cp "$WATCH_DIR/hello.py" "$WATCH_DIR/rootfs/usr/local/bin/hello.py"
    mkswu -d "$WATCH_DIR/rootfs" -o "$WATCH_DIR/hello_signed.swu" -s "$WATCH_DIR/sw-description" -k "$WATCH_DIR/priv.pem"
    sudo swupdate -i "$WATCH_DIR/hello_signed.swu" -k "$WATCH_DIR/pub.pem" -v
done

