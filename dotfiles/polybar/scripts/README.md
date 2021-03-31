# Polybar Spotify Playerctl extention

Spotify player for Polybar using playerctl.

# Screenshot

![2019-04-08-221311_3440x1440_scrot](/uploads/1e5f83ee9771272a8439680f471358b9/2019-04-08-221311_3440x1440_scrot.png)

# Installation

*  Install `playerctl`
*  Move the 2 files to appropriate location
*  Execute spotifyhooks on startup
*  Edit polybar config as shown below

# Dependencies

* Installation of `ttf-font-awesome` is required to display the bar icons

# Polybar config example

```
[module/previous]
type = custom/script
format = <label>
exec = echo ""
line-size = 1
click-left = "playerctl --player=spotify previous"

[module/next]
type = custom/script
format = <label>
label-padding-right = 4
exec = echo ""
line-size = 1
click-left = "playerctl --player=spotify next"

[module/playpause]
type = custom/ipc
hook-0 = echo ""
hook-1 = echo ""
hook-2 = echo ""
initial = 1
line-size = 1
click-left = "playerctl --player=spotify play-pause"

[module/spotify]
type = custom/script
format = <label>
format-prefix = " "
exec = ~/.config/polybar/scripts/spotify
interval = 0.1
```

Add to polybar:

```
modules-right = spotify previous playpause next
```

# font awesome cheatsheet

Not satisfied with the icons? please refer to [Font Awesome Cheatsheet](https://fontawesome.com/v4.7.0/cheatsheet/), and pick your own.