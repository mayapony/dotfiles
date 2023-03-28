#!/bin/sh

cd ~

xset -b

export QT_QPA_PLATFORMTHEME="qt5ct"
export EDITOR=/usr/bin/nvim
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
# fix "xdg-open fork-bomb" export your preferred browser from here
#export BROWSER=/usr/bin/microsoft-edge-dev
#export BROWSER=/usr/bin/firefox
export BROWSER=/usr/bin/google-chrome-stable
export CHROME_EXECUTABLE=browser

# Flutter 镜像
# export PUB_HOSTED_URL=https://pub.flutter-io.cn
# export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn

# go 相关
export GOPATH=/home/mayapony/.env/go  #根据自己的Go工作目录替换
export GOBIN=$GOPATH/bin
export PATH=$GOBIN:$PATH

# rust
export PATH=/home/mayapony/.cargo/bin:$PATH

# Android SDK
# export ANDROID_HOME=/opt/android-sdk
export ANDROID_HOME=/home/mayapony/.opt/android-sdk
export PATH=$ANDROID_HOME/tools:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH

export GTK2_RC_FILES=/home/mayapony/.gtkrc-2.0
# npm
export PATH=~/.npm/node_global/bin:$PATH

# fcitx5
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export GLFW_IM_MODULE=ibus kitty

# MPD daemon start (if no other user instance exists)
[ ! -s ~/.config/mpd/pid ] && mpd

# To force GBM as backend
# origin url: https://wiki.archlinux.org/title/wayland
# export GBM_BACKEND=nvidia-drm
# __GLX_VENDOR_LIBRARY_NAME=nvidia


export _JAVA_AWT_WM_NONREPARENTING=1
export XCURSOR_SIZE=24
export XDG_CURRENT_DESKTOP=Hyprland
export XDG_SESSION_TYPE=wayland
export XDG_SESSION_DESKTOP=Hyprland
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export QT_QPA_PLATFORM=wayland;xcb
export QT_QPA_PLATFORMTHEME=qt5ct
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1

exec Hyprland
