#!/bin/bash
# sync darkman and yin_yang
# author: maya

json=$(cat ~/.config/yin_yang/yin_yang.json)

if [[ $json =~ "\"dark_mode\": true" ]]; then
	echo "dark"
	/bin/darkman set dark
else
	echo "light"
	/bin/darkman set light
fi

