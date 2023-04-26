#!/usr/bin/bash
swww init
while true; do
  ls -d ~/dotfiles/pic/* | sort -R | while read file; do
    sleep 300
    swww img "$file" --transition-step 16 --transition-fps 30 --transition-type random
  done
done
