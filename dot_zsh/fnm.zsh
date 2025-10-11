# ~/.zsh/fnm.zsh

# 预先确保 FNM_PATH 在 PATH 中（这样安装后能立刻被找到）
export FNM_PATH="$HOME/.local/share/fnm"
export PATH="$FNM_PATH:$PATH"

# 自动安装 fnm（如果未安装）
if ! command -v fnm &> /dev/null; then
  echo "⏳ fnm not found. Installing..."
  
  # 下载并安装 fnm
  curl -fsSL https://fnm.vercel.app/install | bash

  # ✅ 安装后立即重新加载 PATH 或 source 配置，让 fnm 可用
  # 注意：安装脚本会修改 .zshrc，但我们不想重启 shell
  # 所以手动 eval 它的环境
  if [ -f "$FNM_PATH/fnm" ]; then
    echo "✅ fnm installed and added to PATH."
  else
    echo "❌ fnm installation failed or path incorrect."
    return 1
  fi
fi

# 初始化 fnm
eval "$(fnm env --use-on-cd --shell zsh)"
