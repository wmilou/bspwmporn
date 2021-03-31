#!/usr/bin/env bash

## Author : Aditya Shakya (adi1090x)
## Mail : adi1090x@gmail.com
## Github : @adi1090x
## Reddit : @adi1090x

rofi_command="rofi -theme themes/powermenu.rasi"
uptime=$(uptime -p | sed -e 's/up //g')

# Options
#shutdown="襤"
#reboot="ﰇ"
#lock=""
#suspend="鈴"
#logout=""
shutdown=""
reboot=""
lock=""
suspend=""
logout=""

# Variable passed to rofi
options="$shutdown\n$reboot\n$lock\n$suspend\n$logout"

chosen="$(echo -e "$options" | $rofi_command -p "UP - $uptime" -dmenu -selected-row 2 -location 3 -yoffset 40)"
case $chosen in
    $shutdown)
        poweroff
        ;;
    $reboot)
        reboot
        ;;
    $lock)
        #i3lock
        dunstify -t 3000 "❌ Lock. Opção não configurada."
        ;;
    $suspend)
        #mpc -q pause
        #amixer set Master mute
        #systemctl suspend
        dunstify -t 3000 "❌ Suspend. Opção não configurada."
        ;;
    $logout)
        bspc quit
        ;;
esac

