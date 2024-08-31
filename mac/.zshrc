# 环境变量
	# zsh
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

	# 语言
export LANG=zh_CN.UTF-8
export LC_MESSAGES=zh_CN.UTF-8

	# brew
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles


# 插件
plugins=(git zsh-autosuggestions autojump zsh-syntax-highlighting)

[[ -s /home/zsh/.autojump/etc/profile.d/autojump.sh ]] && source /home/zsh/.autojump/etc/profile.d/autojump.sh

autoload -U compinit && compinit -u

source $ZSH/oh-my-zsh.sh

# 代理

alias proxy="
    export http_proxy=socks5://127.0.0.1:7890;
    export https_proxy=socks5://127.0.0.1:7890;
    export all_proxy=socks5://127.0.0.1:7890;
    export no_proxy=socks5://127.0.0.1:7890;
    export HTTP_PROXY=socks5://127.0.0.1:7890;
    export HTTPS_PROXY=socks5://127.0.0.1:7890;
    export ALL_PROXY=socks5://127.0.0.1:7890;
    export NO_PROXY=socks5://127.0.0.1:7890;"
alias unproxy="
    unset http_proxy;
    unset https_proxy;
    unset all_proxy;
    unset no_proxy;
    unset HTTP_PROXY;
    unset HTTPS_PROXY;
    unset ALL_PROXY;
    unset NO_PROXY"

proxy

