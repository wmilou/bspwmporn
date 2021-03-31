#!/usr/bin/env bash

## Author : Aditya Shakya (adi1090x)
## Mail : adi1090x@gmail.com
## browser : @adi1090x
## music : @adi1090x


style="$($HOME/.config/rofi/applets/menu/style.sh)"

dir="$HOME/.config/rofi/applets/menu/configs/$style"
rofi_command="rofi -theme $dir/apps.rasi"

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
settings=""
music=" "

# Variable passed to rofi
options="$all\n$terminal\n$files\n$editor\n$browser\n$music\n$settings"

chosen="$(echo -e "$options" | $rofi_command -p "Most Used" -dmenu -selected-row 0)"
case $chosen in
    $terminal)
        gnome-terminal &
        ;;
    $all)
        rofi -config ~/.config/rofi/themes/config.simple -show drun -display-drun 'Apps ' -padding 18 -width 50 -location 0 -lines 10 -columns 3 -show-icons -icon-theme 'Papirus' -font 'Fantasque Sans Mono 13'
        ;;
    $files)
        nautilus &
        ;;
    $editor)
        gnome-terminal --execute nvim&
        ;;
    $browser)
        opera &
        #google-chrome-stable &
        ;;
    $music)
        opera --ran-launcher --remote music.youtube.com &
        #google-chrome-stable &
        ;;
    $settings)
        #rofi -show drun -theme .config/rofi/themes/terminalroot.rasi &
        #rofi -show drun -theme sidebar -yoffset 40 -xoffset 10 &
        # rofi -config ~/.config/rofi/themes/config.simple -show drun -display-drun 'Apps ' -padding 18 -width 50 -location 0 -lines 10 -columns 3 -show-icons -icon-theme 'Papirus' -font 'Fantasque Sans Mono 13'
        gnome-control-center
        ;;
esac

