## 介绍

本配置基于 [LazyVim](https://www.lazyvim.org/)，平时用于写前端 React、Typescript 等..

## 我的常用功能

以下所有的<leader>键都是 space 空格键

### 1. 目录树

使用 [neotree](https://github.com/nvim-neo-tree/neo-tree.nvim)

- 使用 `<leader> + e` 打开目录树
- 使用 `/` 搜索目录或文件
- 使用 `A` 添加文件夹
- 使用 `a` 添加文件
- 使用 `r` 修改文件名 (使用 `space + c + R` 修改文件名并修正文件引用)
- 使用 `d` 删除文件
- 使用 `H` toggle 是否隐藏文件 (可隐藏dot文件、gitignore内添加的文件等，可配置)

使用 `?` 查看更多命令，这些命令需要在光标在 neotree window 的条件下使用。

### 2. 终端

使用 [toggleterm](https://github.com/akinsho/toggleterm.nvim)

- 使用 `<leader> + ut` 打开终端，之后可以使用 ctrl + t toggle 终端
- 数字 + ctrl + t 打开对应终端（利用此可管理多个终端）
- 双击 esc 进入 normal 模式

### 3. Telescope

🚧🚧

