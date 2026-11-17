#!/bin/bash
echo "You have only 2 seconds to focus the window you want to close"
sleep 2
desktop=$(echo "$XDG_CURRENT_DESKTOP" | tr '[:upper:]' '[:lower:]')
ELIMINATE(){
    local pid=$(echo "$1" | tr -d '"' | tr -d "'")
    if [[ "$pid" = "null" ]] || [[ -z "$pid" ]]; then
        echo "Nothing to do"
    else
        echo "Target found with PID of $pid"
        kill -9 "$pid"
        echo "Target eliminated"
    fi
}
NIRI(){
PID=$(niri msg --json focused-window | jq '.pid')
ELIMINATE "$PID"
}
SWAY(){
PID=$(swaymsg -t get_tree | jq '.. | select(.focused? == true).pid')
ELIMINATE "$PID"
}
NILE(){
PID=$(lsw -j | jq 'select(.focused == true).pid')
ELIMINATE "$PID"
}
QTILE(){
PID=$(qtile cmd-obj -o window -f info | jq '.pid')
ELIMINATE "$PID"
}
KDE(){
PID=$(qdbus org.kde.KWin /KWin org.kde.KWin.queryWindowInfo | grep "processId:" | awk '{print $2}')
ELIMINATE "$PID"
}
GNOME(){
PID=$(gdbus call --session --dest org.gnome.Shell --object-path /org/gnome/Shell --method org.gnome.Shell.Eval "global.get_window_actors().find(a => a.meta_window.has_focus()).meta_window.get_pid()" | awk -F"'" '{print $2}')
ELIMINATE "$PID"
}
HYPR(){
PID=$(hyprctl activewindow -j | jq '.pid')
ELIMINATE "$PID"
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
