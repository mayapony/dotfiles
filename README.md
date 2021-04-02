## 一、关于i3的一些设置

> i3 的配置文件在 `~/.i3/config`

友情链接：

[manjaro-i3](https://ld246.com/article/1552717494529)

### 1. 默认程序

**默认程序位置：** `.config/mimeapps.list` 



可以使用 `$mod + z` 来进行设置

### 2. 设置开机启动

启动输入法

`exec --no-startup-id fcitx5`



## 二、pacman 问题

### 1. 报错 无法从...获取文件`archlinuxcn.db`

```shell
无法从 mirrors.tuna.tsinghua.edu.cn : Operation too slow. Less than 1 bytes/sec transferred the last 10 seconds 获取文件 'archlinuxcn.db'
```

解决办法：

修改`/etc/pacman.conf`

```shell
[archlinuxcn]
SigLevel = Optional TrustAll
Server = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/$arch
[options]
XferCommand = /usr/bin/wget --quiet --show-progress --passive-ftp -c -O %o %u
SigLevel    = Required DatabaseNever
```



### 2. 密钥问题

```shell
pacman -Syu haveged
systemctl start haveged
systemctl enable haveged
 
rm -fr /etc/pacman.d/gnupg
pacman-key --init
pacman-key --populate archlinux
pacman-key --populate archlinuxcn
```

## 三、vim

### 1. vim-plug 设置代理

使用`proxychains vi init.vim` 即可。

## 四、一些工具

### 1. proxychains

代理神器！！！

1. fzf
2. thefuck
3. autojump
4. figlet 获得艺术字
5. nitrogen 壁纸管理
6. goldendict 翻译工具 [使用指南](https://zhuanlan.zhihu.com/p/67156145)

### 2. 剪切板工具

剪切板工具

`xsel` `manjaro-i3` 自带的剪切板管理工具，不能贴图片。。

换成了 `xfce4-clipman` 解决图片粘贴问题j

## 五、python相关

安装`pip2` 

```bash
sudo pacman install python2-pip
```

## 一些故障

１．i3bar position 设置为top时，底部bar仍显示

```shell
$ rm -r ~/.config/nitrogen/
```





