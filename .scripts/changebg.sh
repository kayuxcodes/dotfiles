#!/bin/bash

# Function to set wallpaper based on GTK theme
set_wallpaper() {
	theme=$1
	# notify-send "yes" "$current_theme | $new_theme"
	if [[ "$theme" == "Adwaita" ]]; then
		# Set the wallpaper for Adwaita theme
		xfconf-query -c xfce4-desktop \
			-p /backdrop/screen0/monitoreDP-1/workspace0/last-image \
			-s ~/Pictures/mountainlight.jpg
		kitten themes --reload-in=all Catppuccin-Latte
	else
		# Set the wallpaper for non-Adwaita themes
		xfconf-query -c xfce4-desktop \
			-p /backdrop/screen0/monitoreDP-1/workspace0/last-image \
			-s ~/Pictures/mountaindark.jpg
		kitten themes --reload-in=all Solarized Dark
	fi
}

XSETTINGS_FILE=$(find ~/.config/xfce4 -name "xsettings.xml")

get_current_theme() {
	xfconf-query -c xsettings -p /Net/ThemeName
}

current_theme=$(get_current_theme)

while true; do
	sleep 1
	new_theme=$(get_current_theme)
	if [[ "$new_theme" != "$current_theme" ]]; then
		# notify-send "Appearance settings updated" "Theme: $new_theme"
		current_theme="$new_theme"
		set_wallpaper "$current_theme"
		# Add your actions here
	fi
done
