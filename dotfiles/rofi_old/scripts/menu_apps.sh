#!/usr/bin/env bash

## Author : Aditya Shakya (adi1090x)
## Mail : adi1090x@gmail.com
## browser : @adi1090x
## music : @adi1090x

rofi_command="rofi -theme themes/menu/apps.rasi"

# Links
terminal=""
files=""
editor=""
# browser=""
#browser=""
browser=""
#haskell=""
thunderbird=""
ssr="📹"
vm=""
all=""

# Variable passed to rofi
options="$all\n$files\n$editor\n$browser\n$vm"

chosen="$(echo -e "$options" | $rofi_command -p "Most Used" -dmenu -selected-row 0)"
case $chosen in
    $all)
        rofi -config ~/.config/rofi/themes/config.simple -show drun -display-drun 'Apps ' -padding 18 -width 50 -location 0 -lines 10 -columns 3 -show-icons -icon-theme 'Papirus' -font 'Fantasque Sans Mono 13'
        # rofi -show drun -theme ~/.config/rofi/themes/apps.rasi &
        ;;
    $files)
        nautilus &
        ;;
    $editor)
        gedit &
        ;;
    $browser)
        opera &
        #google-chrome-stable &
        ;;
    $vm)
        #rofi -show drun -theme .config/rofi/themes/terminalroot.rasi &
        #rofi -show drun -theme sidebar -yoffset 40 -xoffset 10 &
        rofi -config ~/.config/rofi/themes/config.simple -show drun -display-drun 'Apps ' -padding 18 -width 50 -location 0 -lines 10 -columns 3 -show-icons -icon-theme 'Papirus' -font 'Fantasque Sans Mono 13'
        ;;
    
esac

