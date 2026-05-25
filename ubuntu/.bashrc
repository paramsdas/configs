# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
export GOROOT="/usr/local/go"
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
    # add golang dir to path
    PATH="$PATH:$GOROOT/bin"
    PATH="$PATH:$HOME/go/bin"
    # PATH="$PATH:$HOME/.local/bin"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Custom Aliases
## General
alias la='ls -la --color=auto'
alias c='clear'
alias v='nvim'
alias ev='nvim ~/.config/nvim/'
alias ep='nvim ~/.bashrc'
alias ewc='nvim /mnt/c/Users/param/.wezterm.lua'
## Git
alias gs='git status'
alias gc='git commit'
alias gp='git push'
## Directory shorcuts
alias ws='cd ~/ws/'
alias k='kubectl'

# Custom Functions
function prompt_comand() {
    # Return code of last command
    RC=$?
    # defaults to avoid else cases
    rc_out="\[\033[1;32m\]✔"
    branch_result=""
    text_color="\[\033[1;34m\]"
    # get branch, if in a git repo
    branch=$(git branch 2>/dev/null | grep "^*" | colrm 1 2);
    # setting final values
    if [ $RC != 0 ]; then
        rc_out="\[\033[1;31m\]✖"
    fi
    if [ ! -z $branch ]; then
        branch_result=$(echo " <$branch>")
        text_color="\[\033[1;32m\]"
    fi

    out="$rc_out \[\033[1;36m\]\u $text_color[\w]$branch_result\[\033[1;37m\] \$ "

    export PS1=$out
}

export PROMPT_COMMAND=(prompt_comand 'printf "\e]9;9;%s\e\\" "$(wslpath -w "$PWD")"')

zoxide --version > /dev/null 2>&1

if [ "$?" == 0 ]; then
    eval "$(zoxide init bash)"
fi

# pnpm
export PNPM_HOME="/home/param/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"
