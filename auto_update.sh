#!/bin/bash

WATCH_DIR="$HOME/hello_swu"

while true; do
    inotifywait -e modify "$WATCH_DIR/hello.py"
    "$WATCH_DIR/update_swu.sh"
done

