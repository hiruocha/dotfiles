# dotfiles

## 用法

1. 安装必要软件：`git`

2. 设置掩码
```sh
umask 022
```

3. 创建需要的文件夹
```sh
mkdir $HOME/.local/{share,state}
```

4. 创建镜像标识文件（如果需要）
```sh
touch $HOME/.local/state/need_mirror
```

5. 克隆仓库
```sh
cd $HOME/.local/share
git clone https://github.com/hiruocha/dotfiles.git
# 或
# git clone https://v6.gh-proxy.org/github.com/hiruocha/dotfiles.git
cd dotfiles
```

6. 创建本地配置文件
```sh
nvim .dotter/local.toml
```
写入：
```toml
packages = ["cli-meta"] # 或其他需要的元包
```

7. 应用配置
```sh
./dotter-linux-x64-musl -v -f
```
