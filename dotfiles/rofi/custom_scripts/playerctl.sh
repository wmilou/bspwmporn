#!/usr/bin/env bash

rofi_command="rofi -theme ~/.config/rofi/custom_scripts/themes/playerctl.rasi"

# Gets the current status of mpd (for us to parse it later on)
status="$(playerctl status)"
# Defines the Play / Pause option content
if [[ $status == *"Playing"* ]]; then
    play_pause=""
else
    play_pause=""
fi
active=""
urgent=""

# Display if repeat mode is on / off
tog_repeat="凌"
if [[ $status == *"repeat: on"* ]]; then
    active="-a 4"
elif [[ $status == *"repeat: off"* ]]; then
    urgent="-u 4"
else
    tog_repeat=" Parsing error"
fi

# Display if random mode is on / off
tog_random=""
if [[ $status == *"random: on"* ]]; then [ -n "$active" ] && active+=",5" || active="-a 5"
elif [[ $status == *"random: off"* ]]; then
    [ -n "$urgent" ] && urgent+=",5" || urgent="-u 5"
else
    tog_random=" Parsing error"
fi
stop=""
next=""
previous=""

# Variable passed to rofi
options="$previous\n$play_pause\n$stop\n$next"

# Get the current playing song
current=$(playerctl metadata title)
# If mpd isn't running it will return an empty string, we don't want to display that
if [[ -z "$current" ]]; then
    current="-"
fi

# Spawn the mpd menu with the "Play / Pause" entry selected by default
chosen="$(echo -e "$options" | $rofi_command -p "  $current" -dmenu $active $urgent -selected-row 1)"
case $chosen in
    $previous)
        playerctl previous && sleep 2 && notify-send -t 1800   " $(playerctl metadata title )"
        ;;
    $play_pause)
        if [[ $status == *"Playing"* ]]; then
            playerctl play-pause && sleep 2 && notify-send -t 1800  " $(playerctl metadata title)"
        else
            playerctl play-pause && sleep 2 && notify-send -t 1800  " $(playerctl metadata title)"
        fi
        ;;
    $stop)
        playerctl stop && sleep 2 && notify-send -t 1800  " $(playerctl metadata title)"
        ;;
    $next)
        playerctl next && sleep 2 && notify-send -t 1800  "  $(playerctl metadata title)"
        ;;
    $tog_repeat)
        playerctl loop
        ;;
    $tog_random)
        playerctl shuffle
        ;;
esac
