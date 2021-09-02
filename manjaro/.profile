export QT_QPA_PLATFORMTHEME="qt5ct"
export EDITOR=/usr/bin/nvim
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
# fix "xdg-open fork-bomb" export your preferred browser from here
#export BROWSER=/usr/bin/microsoft-edge-dev
#export BROWSER=/usr/bin/firefox
export BROWSER=/usr/bin/google-chrome-stable
export CHROME_EXECUTABLE=google-chrome-stable

# Flutter 镜像
export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn

# go 相关
export GOPATH=/home/mayapony/.env/go  #根据自己的Go工作目录替换
export GOBIN=$GOPATH/bin
export PATH=$GOBIN:$PATH

# Android SDK
export ANDROID_HOME=/opt/android-sdk
export PATH=$ANDROID_HOME/tools:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH

export GTK2_RC_FILES=/home/mayapony/.gtkrc-2.0
# npm
export PATH=~/.npm/node_global/bin:$PATH
