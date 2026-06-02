#!/bin/bash
echo "You have only 2 seconds to focus the window you want to close"
desktop=$(echo "$XDG_CURRENT_DESKTOP" | tr '[:upper:]' '[:lower:]')
NIRI(){
PID=$(sleep 2 && niri msg --json focused-window | jq '.pid')
if [[ $PID = "null" ]]; then
    echo "Nothing to do"
else
    echo "Target found with PID of $PID"
    kill -9 "$PID"
    echo "Target eliminated"
fi
}



if [[ $desktop = "niri" ]]; then
    echo "desktop found"
    NIRI
fi
