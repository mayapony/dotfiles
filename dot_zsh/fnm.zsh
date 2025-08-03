# ~/.zshrc

# 自动安装 fnm（如果未安装）
if ! command -v fnm &> /dev/null; then
  echo "⏳ fnm not found. Installing..."
  curl -fsSL https://fnm.vercel.app/install | bash
  
  # 安装后重新加载 shell（仅当前 session 需要）
  echo "✅ fnm installed. Restart your shell or run:"
  echo "   source ~/.zshrc"
fi

# 初始化 fnm（如果已安装）
if command -v fnm &> /dev/null; then
	FNM_PATH="/home/maya/.local/share/fnm"
	if [ -d "$FNM_PATH" ]; then
		export PATH="$FNM_PATH:$PATH"
		eval "$(fnm env --use-on-cd)"  # 启用自动切换 node 版本
	fi
fi
