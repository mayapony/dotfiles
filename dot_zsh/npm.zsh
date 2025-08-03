# ~/.zshrc

# 配置 npm 全局路径（自动创建目录+添加PATH）
export NPM_GLOBAL_DIR="${HOME}/.npm-global"

# 自动创建目录（如果不存在）
if [ ! -d "$NPM_GLOBAL_DIR" ]; then
  mkdir -p "$NPM_GLOBAL_DIR/bin"
fi

# 添加全局 bin 目录到 PATH（如果尚未添加）
if [[ ":$PATH:" != *":$NPM_GLOBAL_DIR/bin:"* ]]; then
  export PATH="$NPM_GLOBAL_DIR/bin:$PATH"
fi
