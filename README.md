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

1. fzf
2. thefuck
3. autojump
4. figlet 获得艺术字
5. **nitrogen** 壁纸管理
6. goldendict 翻译工具 [使用指南](https://zhuanlan.zhihu.com/p/67156145)
7. manjaro-application-utility 默认应用管理工具
8. **flameshot** 截图
9. deepin-system-monitor 任务管理器 (好看)
10. zeal 离线文档
11. **stacer** 系统诊断和优化工具
12. qtq2 文本转二维码 (可不登陆qq与手机通信)
13. nitroshare 局域网文件传输
14. **feem** 局域网文件传输，可通过手机热点传输
15. font-manager 字体管理工具
16. gimp 图片编辑工具
17. ydcv 有道翻译命令行
18. **youdao-dict** 有道翻译(最好用)
19. xfce4-clipman 截图
20. filezilla ftp工具
21. simplescreenrecorder 屏幕录制
22. proxychains 终端代理

### 2. 剪切板工具

剪切板工具

`xsel` `manjaro-i3` 自带的剪切板管理工具，不能贴图片。。

换成了 `xfce4-clipman` 解决图片粘贴问题

## 五、python相关

安装`pip2` 

```bash
sudo pacman install python2-pip
```

## 一些故障

1. 3bar position 设置为top时，底部bar仍显示

```shell
$ rm -r ~/.config/nitrogen/
```

2. 蓝牙连接成功但是没有声音

解决方法：
启动： `pulseaudio --start`  如果失败 使用`killall pulseaudio`

3. 关闭BIOS 的声音

解决办法：在终端输入 `xset -b` 并回车
也可以把下面一行加入到 `xprofile`

```shell
sudo echo 'xset -b' >> ~/.xprofile
```

## 修改默认浏览器

```shell
nvim ~/.profile
```

修改export `export BROWSER=/usr/bin/chromium`

[可参考](https://www.rockyourcode.com/change-the-default-browser-in-i3-manjaro-linux/)

如果上述方案无效：

1. 找到下方文件 此为`google-chorome`快捷方式

   `/usr/share/applications/google-chrome-stable.desktop`

2. 执行下列命令

   ```shell
   unset BROWSER
   xdg-settings set default-web-browser google-chrome-stable.desktop
   xdg-settings get default-web-browser
   xdg-open https://www.manjaro.org
   ```

## 六、添加字体

将字体添加在 `~/.local/share/fonts` 

```shell
docker run -r
```

