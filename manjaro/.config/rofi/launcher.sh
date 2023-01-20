#!/usr/bin/env bash

## Author  : mayapony
## Mail    : mayapony@foxmail.com

theme="style"
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

rofi -no-lazy-grab -show drun -modi drun -theme $dir/"$theme"
