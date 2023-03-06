#!/usr/bin/env bash

## Author  : mayapony
## Mail    : mayapony@foxmail.com

theme="search-style"
dir="$HOME/.config/rofi"


# dracula
ALPHA="#00000000"
BG="#282a36ff"
FG="#f8f8f2ff"
SELECT="#44475aff"

ACCENT="#bd93f9"
# overwrite colors file
cat > $dir/colors.rasi <<- EOF
	/* colors */

	* {
	  al:  $ALPHA;
	  bg:  $BG;
	  se:  $SELECT;
	  fg:  $FG;
	  ac:  $ACCENT;
	}
EOF

#rofi -modi blocks -blocks-wrap /usr/bin/rofi-search -show blocks -lines 0  -eh 2 -kb-custom-1 'Control+y' -theme $dir/"$theme"
rofi -modi blocks -blocks-wrap rofi-search -show blocks -lines 4 -eh 4 -kb-custom-1 'Control+y' -theme $dir/"$theme"
