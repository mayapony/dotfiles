#!/bin/sh

cd ~

export EDITOR=/usr/bin/nvim
export BROWSER=/usr/bin/microsoft-edge-stable
export CHROME_EXECUTABLE=browser

# Flutter 镜像
export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn

# Java
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk
export PATH=$JAVA_HOME/bin:$PATH

# Android
export ANDROID_SDK_ROOT=/opt/android-sdk
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools/
export PATH=$PATH:$ANDROID_SDK_ROOT/tools/bin/
export PATH=$PATH:$ANDROID_SDK_ROOT/tools/
export CHROME_EXECUTABLE=/usr/bin/brave

# go 相关
export GOPATH=~/.env/go #根据自己的Go工作目录替换
export GOBIN=$GOPATH/bin
export PATH=$GOBIN:$PATH

# rust
export PATH=~/.cargo/bin:$PATH

# fcitx5
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

# hyprland
export CLUTTER_BACKEND=wayland
export GBM_BACKEND=nvidia-drm
export GDK_BACKEND=wayland,x11
export LIBVA_DRIVER_NAME=nvidia
export MOZ_ENABLE_WAYLAND=1
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export QT_QPA_PLATFORM=wayland;xcb
export QT_QPA_PLATFORMTHEME=qt5ct
export QT_STYLE_OVERRIDE=kvantum
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
export SDL_VIDEODRIVER=wayland
export WLR_NO_HARDWARE_CURSORS=1
export XCURSOR_SIZE=30
export XDG_CURRENT_DESKTOP=Hyprland
export XDG_SESSION_DESKTOP=Hyprland
export XDG_SESSION_TYPE=wayland
export _JAVA_AWT_WM_NONREPARENTING=1
export __GLX_VENDOR_LIBRARY_NAME=nvidia


# My bin
export PATH=~/.dotfiles/bin:$PATH

# npm && pnpm
export NPM_HOME=~/.npm/bin
export PNPM_HOME=~/.local/share/pnpm
export PATH=$PNPM_HOME:$PATH
export PATH=$NPM_HOME:$PATH

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# ==== DON'T DELETE ME =====
Hyprland
# ==========================
