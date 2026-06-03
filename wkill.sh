#!/bin/bash
echo "You have only 2 seconds to focus the window you want to close"
desktop=$(echo "$XDG_CURRENT_DESKTOP" | tr '[:upper:]' '[:lower:]')
NIRI(){
PID=$(sleep 2 && niri msg --json focused-window | jq '.pid')
if [[ "$PID" = "null" ]] || [[ -z "$PID" ]]; then
    echo "Nothing to do"
else
    echo "Target found with PID of $PID"
    kill -9 "$PID"
    echo "Target eliminated"
fi
}
SWAY(){
PID=$(sleep 2 && swaymsg -t get_tree | jq '.. | select(.focused? == true).pid')
if [[ "$PID" = "null" ]] || [[ -z "$PID" ]]; then
    echo "Nothing to do"
else
    echo "Target found with PID of $PID"
    kill -9 "$PID"
    echo "Target eliminated"
fi
}
NILE(){
PID=$(sleep 2 && lsw -j | jq 'select(.focused == true).pid')
if [[ "$PID" = "null" ]] || [[ -z "$PID" ]]; then
    echo "Nothing to do"
else
    echo "Target found with PID of $PID"
    kill -9 "$PID"
    echo "Target eliminated"
fi
}
QTILE(){
PID=$(sleep 2 && qtile cmd-obj -o window -f info | jq '.pid')
if [[ "$PID" = "null" ]] || [[ -z "$PID" ]]; then
    echo "Nothing to do"
else
    echo "Target found with PID of $PID"
    kill -9 "$PID"
    echo "Target eliminated"
fi
}
KDE(){
PID=$(sleep 2 && qdbus org.kde.KWin /KWin org.kde.KWin.queryWindowInfo | grep "processId:" | awk '{print $2}')
if [[ "$PID" = "null" ]] || [[ -z "$PID" ]]; then
    echo "Nothing to do"
else
    echo "Target found with PID of $PID"
    kill -9 "$PID"
    echo "Target eliminated"
fi
}
GNOME(){
PID=$(sleep 2 && gdbus call --session --dest org.gnome.Shell --object-path /org/gnome/Shell --method org.gnome.Shell.Eval "global.get_window_actors().find(a => a.meta_window.has_focus()).meta_window.get_pid()" | awk -F"'" '{print $2}')
if [[ "$PID" = "null" ]] || [[ -z "$PID" ]]; then
    echo "Nothing to do"
else
    echo "Target found with PID of $PID"
    kill -9 "$PID"
    echo "Target eliminated"
fi
}
HYPR(){
PID=$(sleep 2 && hyprctl activewindow -j | jq '.pid')
if [[ "$PID" = "null" ]] || [[ -z "$PID" ]]; then
    echo "Nothing to do"
else
    echo "Target found with PID of $PID"
    kill -9 "$PID"
    echo "Target eliminated"
fi
}
if [[ $desktop = "niri" ]]; then
    echo "compositor found: Niri"
    NIRI
elif [[ $desktop = "sway" || $desktop = "volare" || $desktop = "scroll" || $desktop = "swayfx" ]]; then
    echo "compositor found: Sway-based compositor"
    SWAY
elif [[ $desktop = "river" || $desktop = "croffle" ]]; then
    echo "compositor found: River-based compositor"
    NILE
elif [[ $desktop = "qtile" ]]; then
    echo "compositor found: Qtile"
    QTILE
elif [[ $desktop = "kde" || $desktop = "plasma" || $desktop = "theseus" ]]; then
    echo "compositor found: KDE Plasma"
    KDE
elif [[ $desktop = "gnome" || $desktop = "mutter" || $desktop = "muffin" || $desktop = "magpie" || $desktop = "ukwm" ]]; then
    echo "compositor found: GNOME-based compositor"
    GNOME
elif [[ $desktop = "hyprland" || $desktop = "aquamarine" ]]; then
    echo "compositor found: Hyprland"
    HYPR
fi
