export EDITOR=nvim
export LANG=en_US.UTF-8

############################
# Android 
############################
export ANDROID_STUDIO_HOME=$HOME/.env/android-studio
export ANDROID_HOME=$HOME/.env/Android/Sdk
export ANDROID_SDK_ROOT=$ANDROID_HOME
export PATH=$PATH:$ANDROID_STUDIO_HOME/bin
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/build-tools/34.0.0

# Java
# export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
# export PATH=$PATH:$JAVA_HOME/bin

############################
# Rust
############################
export RUSTUP_HOME=$HOME/.env/rust/rustup
export CARGO_HOME=$HOME/.env/rust/cargo
export PATH=$CARGO_HOME/bin:$PATH
export CARGO_REGISTRIES_CRATES_IO_PROTOCOL=sparse

############################
# Node.js
############################
export NPM_CONFIG_PREFIX="$HOME/.env/npm"
export PNPM_HOME="$HOME/.env/pnpm"
export YARN_GLOBAL_FOLDER="$HOME/.env/yarn"
export NODE_PATH="$HOME/.env/node_modules"
export PATH="$NPM_CONFIG_PREFIX/bin:$PNPM_HOME:$YARN_GLOBAL_FOLDER/bin:$PATH"
mkdir -p "$HOME/.env"/{npm,pnpm,yarn,node_modules}

