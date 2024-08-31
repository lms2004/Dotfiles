# ~/.bashrc: executed by bash(1) for non-login shells.
# 非登录 shell 时由 bash 执行

# 基本设置模块
# ----------------------------

# 如果不是交互式 shell，则不执行任何操作
case $- in
    *i*) ;;
      *) return;;
esac

# 历史记录设置：不记录重复的命令，附加到历史记录文件中，不覆盖
HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000

# 在每个命令后检查窗口大小，并更新 LINES 和 COLUMNS 的值
shopt -s checkwinsize

# 配置 less 以处理非文本输入文件
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# 如果在 chroot 环境中，设置提示符以显示 chroot 名称
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# 配色设置模块
# ----------------------------

# 设置彩色提示符
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# 如果启用了强制彩色提示符
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        color_prompt=yes
    else
        color_prompt=
    fi
fi

# 设置彩色提示符格式
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u:\w\$ '
fi
unset color_prompt force_color_prompt

# 如果是 xterm 终端，设置标题为 user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# 插件与别名模块
# ----------------------------

# 启用 ls 命令的颜色支持，并添加常用别名
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# 一些 ls 别名
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# 为长时间运行的命令添加 "alert" 别名
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# 如果有 ~/.bash_aliases 文件，则加载它
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# 启用可编程的命令补全功能
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# 代理设置模块
# ----------------------------

# HTTP 和 HTTPS 代理设置
export http_proxy=http://127.0.0.1:7890
export https_proxy=http://127.0.0.1:7890

# 环境变量设置模块
# ----------------------------


# NVM 配置
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # 加载 NVM
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # 加载 NVM 命令补全

# 添加本地 bin 目录到 PATH
export PATH=$PATH:/home/ubun22/.local/bin

# SKY 数据源配置
export SKY_DATASOURCE_DRIVER_CLASS_NAME=com.mysql.cj.jdbc.Driver
export SKY_DATASOURCE_HOST=localhost
export SKY_DATASOURCE_PORT=3306
export SKY_DATASOURCE_DATABASE=sky_take_out
export SKY_DATASOURCE_USERNAME=root
export SKY_DATASOURCE_PASSWORD=123456

# SKY Redis 配置
export SKY_REDIS_HOST=localhost
export SKY_REDIS_PORT=6379
export SKY_REDIS_PASSWORD=your_redis_password
export SKY_REDIS_DATABASE=0

# 添加 Cargo 的 bin 目录到 PATH
export PATH="$HOME/.cargo/bin:$PATH"
. "$HOME/.cargo/env"

# NPC 配置
export NPC_HOME=/mnt/c/Users/lms/Desktop/ysyx/ysyx-workbench/npc

# MPI 配置
export PATH="/usr/local/mpich-4.1.2/bin:$PATH"

