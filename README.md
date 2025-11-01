# dotfiles

## 介绍
适用于 Arch Linux 的配置文件  
基本系统可参考本人博客文章[全盘加密安装 Arch Linux](https://hiruocha.codeberg.page/posts/arch-installation/)安装
### 特性
- 全盘加密、灵活的 LVM 分区管理
- 安全启动
- 使用`dash`作为`/bin/sh`
- 使用`zsh`作为登录 Shell
- 尽可能遵守 XDG 目录规范
- 使用 GPG 代理 SSH
- 使用 GPG 密钥签名`makepkg`的包，且启用安装验证
### 系统组成
本人系统上手动装的包列表（不定期更新）  
一部分是从 AUR 安装
```
# 系统核心
base                                  基础系统
base-devel                            基础工具集（sudo、gcc、make 等）
linux-cachyos-hardened                内核（可自选）
linux-cachyos-hardened-headers        内核头文件（可自选，与内核一致）
linux-firmware                        固件
grub                                  引导加载器
grub-hook-ca                          GRUB 自动更新钩子
efibootmgr                            EFI 启动管理器
lvm2                                  逻辑卷管理

# 包管理
paru                                  AUR 助手
pacman-contrib                        Pacman 额外工具集
archlinuxcn-keyring                   Arch Linux CN 仓库密钥环（添加 Arch Linux CN 仓库需装）
archlinuxcn-mirrorlist-git            Arch Linux CN 镜像列表（添加 Arch Linux CN 仓库需装）
flatpak                               Flatpak 包管理器

# Shell
zsh                                   登录/交互 Shell
zsh-autosuggestions                   Zsh 自动补全建议插件
zsh-completions                       Zsh 额外补全定义
zsh-syntax-highlighting               Zsh 语法高亮插件
dashbinsh                             /bin/sh（dash）

# 命令行工具
bat                                   cat 替代品
btop                                  资源监视器
eza                                   ls 替代品
fd                                    find 替代品
fzf                                   模糊搜索工具
lf                                    终端文件管理器
trash-cli                             命令行回收站工具
exfatprogs                            exFAT 文件系统工具
xdg-ninja-git                         XDG 目录规范检查工具
xdg-user-dirs                         XDG 用户目录管理
tldr                                  简化的命令手册
axel                                  多线程下载工具（makepkg 使用）
dysk                                  磁盘信息查看工具
neovim                                终端文本编辑器
neovim-symlinks                       Neovim 符号链接（vi、vim 等）
git                                   版本控制系统
stow                                  符号链接管理
docker                                容器平台
docker-compose                        Docker 编排工具
android-tools                         Android 工具 （adb、fastboot 等）
payload-dumper-go                     payload.bin 解包
shellcheck                            Shell 脚本静态分析
plocate                               快速文件定位
man-db                                手册页数据库
man-pages-zh_cn                       中文手册

# 系统信息显示
fastfetch                             系统信息展示
macchina                              系统信息展示（用作 hyfetch 后端）
hyfetch                               *fetch 的 LGBT 前端
pfetch-rs                             极简系统信息展示

# 网络工具
networkmanager                        网络管理器
openssh                               SSH 支持
ufw                                   防火墙
frpc                                  内网穿透
adguardhome                           广告拦截
flclash-bin                           Clash 图形化客户端

# 开发工具
code                                  文本编辑器（IDE）
code-marketplace                      VSCode 扩展市场
jdk-openjdk                           Java
ccache                                编译缓存加速
pnpm                                  Node.js 包管理器
yarn                                  Node.js 包管理器
lineageos-devel                       LineageOS 开发工具

# 输入法
fcitx5                                输入法框架（fcitx5-im 包组）
fcitx5-configtool                     Fcitx5 配置工具（fcitx5-im 包组）
fcitx5-gtk                            Fcitx5 GTK 支持（fcitx5-im 包组）
fcitx5-qt                             Fcitx5 Qt 支持（fcitx5-im 包组）
fcitx5-chinese-addons                 中文输入法
fcitx5-pinyin-genshin                 原神词库
fcitx5-pinyin-moegirl                 萌娘百科词库
fcitx5-pinyin-starrail                崩坏：星穹铁道词库
fcitx5-mozc                           日语输入法

# 桌面环境
swayfx                                窗口管理器
waybar                                状态栏
foot                                  终端
wofi                                  应用启动器
mako                                  通知
swaybg                                壁纸
swayimg                               图片查看
xorg-xwayland                         X11 兼容层

# 字体
noto-fonts                            Noto 基础字体
noto-fonts-cjk                        Noto CJK 字体
noto-fonts-emoji                      Noto Emoji 字体
noto-fonts-extra                      Noto 额外字体
ttf-maplemono-cn                      等宽字体
ttf-nerd-fonts-symbols                Nerd Fonts 符号字体

# 图形驱动
mesa                                  OpenGL 实现
lib32-mesa                            32 位 Mesa 库
vulkan-intel                          Intel Vulkan 驱动
lib32-vulkan-intel                    32 位 Intel Vulkan 驱动
vulkan-tools                          Vulkan 工具集
nvidia-open-dkms                      NVIDIA 驱动
nvidia-utils                          NVIDIA 工具
lib32-nvidia-utils                    32 位 NVIDIA 工具
nvidia-prime                          NVIDIA 显卡切换工具

# 音频
pipewire                              音视频服务器
pipewire-alsa                         PipeWire ALSA 支持
lib32-pipewire                        32 位 PipeWire 库
pipewire-audio                        PipeWire 音频支持
pipewire-jack                         PipeWire JACK 支持
pipewire-pulse                        PipeWire PulseAudio 替代

# 浏览器
firefox                               Firefox 浏览器
firefox-i18n-zh-cn                    Firefox 简体中文语言包

# 通讯社交
telegram-desktop                      Telegram
linuxqq                               QQ
liteloader-qqnt-bin                   QQ 插件加载器
nheko                                 Matrix

多媒体
mpv                                   多媒体播放器
gimp                                  图像编辑器
musiclyricapp                         获取音乐歌词
kew-git                               终端音乐播放器
nipaplay-reload-bin                   带弹幕的视频播放器，接入弹弹 Play 和 Bangumi

游戏
steam                                 Steam
lutris                                游戏管理器
osu-lazer-bin                         osu!
prismlauncher                         Minecraft 启动器
nbtexplorer                           Minecraft NBT 文件编辑器
luanti                                开源体素游戏引擎(原 Minetest)

文件传输与下载
qbittorrent-enhanced-nox              qBittorrent 增强版无界面版
localsend                             局域网文件传输工具

安全工具
gnome-keyring                         密钥环管理器
keepassxc                             密码管理器
sbctl                                 安全启动支持

实用工具
ventoy-bin                            多合一启动 U 盘工具
```

## 使用方法
