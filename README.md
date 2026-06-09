# wkill

A lightweight, universal Bash utility designed to gracefully close or kill the currently focused window across various Wayland compositors and desktop environments.

## Features

* **Smart Delay:** Gives you a 2-second countdown timer to move your mouse and focus the exact window you want to destroy.
* **Universal Support:** Automatically detects your running environment and triggers the correct native window management command.
* **Open Source:** Licensed under the GNU GPLv3 to ensure the code remains free and open forever.

## Supported Compositors & Environments

* **Niri**
* **Sway Group:** Sway, SwayFX, Volare, Scroll
* **River Group:** River, Croffle
* **Qtile**
* **KDE Group:** KDE Plasma, Theseus
* **Hyprland**
* 
if any one want to be a contributor just reach out for me discord=1.honey_block .
gnome grope are broken so if any one can fix it i`d apreceate it the gnome grope are
GNOME Group: GNOME, Mutter, Muffin, Magpie, ukwm
the tested and known working is niri 
## Installation & Setup

1. Clone the repository to your local machine:
   ```bash
    git clone https://github.com/linuxkiller9000/wkill.git
2. make it executable:
   ```bash
   cd wkill && chmod +x wkill.sh

## usage
  3. go to the file location and run it:
   ```bash
    ./wkill.sh
