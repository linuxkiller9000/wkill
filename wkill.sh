
desktop=$(echo "$XDG_CURRENT_DESKTOP" | tr '[:upper:]' '[:lower:]')

NIRI(){
if [[ $desktop = "niri" ]]; then
    echo "you got only 4 seconds to focus the window"
    sleep 4 && niri msg action close-window
fi
}
SWAY(){
if [[ $desktop = "sway" || $desktop = "volare" || $desktop = "scroll" || $desktop = "swayfx" ]]; then
    echo "you got 4 seconds to focus the window"
    sleep 4 && swaymsg kill
fi
}
NILE(){
if [[ $desktop = "river" || $desktop = "croffle" ]]; then
    echo "you got 4 seconds to focus the window"
    sleep 4 && riverctl close
fi
}
QTILE(){
if [[ $desktop = "qtile" ]]; then
    echo "you got 4 seconds to focus the window"
    sleep 4 && qtile cmd-obj -o window -f kill
fi
}
KDE(){
if [[ $desktop = "kde" || $desktop = "plasma" || $desktop = "theseus" ]]; then
    echo "you got 4 seconds to focus the window"
    sleep 4 && qdbus org.kde.kglobalaccel /component/kwin org.kde.kglobalaccel.Component.invokeShortcut "Window Close"
fi
}
GNOME(){
if [[ $desktop = "gnome" || $desktop = "mutter" || $desktop = "muffin" || $desktop = "magpie" || $desktop = "ukwm" ]]; then
    echo "you got 4 seconds to focus the window"
    sleep 4 && wmctrl -c :ACTIVE:
fi
}
HYPR(){
if [[ $desktop = "hyprland" ]]; then
    echo "you got 4 seconds to focus the window"
    sleep 4 && hyprctl dispatch closewindow active
fi
}

if [[ $desktop = "niri" ]]; then
    NIRI
elif [[ $desktop = "sway" || $desktop = "volare" || $desktop = "scroll" || $desktop = "swayfx" ]]; then
    SWAY
elif [[ $desktop = "river" || $desktop = "croffle" ]]; then
    NILE
elif [[ $desktop = "qtile" ]]; then
    QTILE
elif [[ $desktop = "hyprland" ]]; then
    HYPR
elif [[ $desktop = "gnome" || $desktop = "mutter" || $desktop = "muffin" || $desktop = "magpie" || $desktop = "ukwm" ]]; then
    GNOME
elif [[ $desktop = "kde" || $desktop = "plasma" || $desktop = "theseus" ]]; then
    KDE
fi




