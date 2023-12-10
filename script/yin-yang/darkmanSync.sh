#!/bin/bash
# sync darkman and yin_yang
# author: maya

json=$(cat ~/.config/yin_yang/yin_yang.json)

if [[ $json =~ "\"dark_mode\": true" ]]; then
	/bin/darkman set dark
else
	/bin/darkman set light
fi

