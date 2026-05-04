

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
umask 002
export PATH="/Applications/Blender.app/Contents/MacOS:$PATH"
export GOBIN="$HOME/go/bin"
export GOPATH="$HOME/go"
. "$HOME/.local/bin/env"
. "$HOME/.cargo/env"

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
export PATH=$PATH:$HOME/go/bin

# Terminal Startup Stuff
echo -n -e "\033]0;Mac Term \007"

# useful alias
alias grep='grep --color'
alias c="clear"
alias ll="ls -lah"
alias lh="ls -a | egrep '^\.'"
alias copy="cp"
alias f='find . | grep'
alias greload="touch ~/.config/ghostty/config"

# quickly edit and source .zshrc
alias vz="vi ~/.zshrc"
alias sz=" source ~/.zshrc; echo '~/.zshrc sourced'"
alias vtty="vi ~/.config/ghostty/config"
alias tz="vi ~/.tmux.conf.local"

# use yellow for directories
export CLICOLOR=1
export LSCOLORS=fxfxcxdxbxegedabagacad

# change prompt
autoload -Uz promptinit
promptinit
# 1. Load the Git System
autoload -Uz vcs_info
setopt prompt_subst

# 2. Define the logic that runs before every prompt
precmd() {
    # Load git info
    vcs_info
}

# 3. Style the Git Info
# check-for-changes: simpler/faster git check
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
# Format: (branch_name) [dirty_status]
zstyle ':vcs_info:git:*' formats ' %F{240}(%b)%f%u%c'
zstyle ':vcs_info:git:*' actionformats ' %F{240}(%b|%a)%f%u%c'
# Status symbols: * for modified, + for staged
zstyle ':vcs_info:*' unstagedstr ' %F{yellow}*%f'
zstyle ':vcs_info:*' stagedstr ' %F{green}+%f'

# 4. Check if we are Remote (SSH)
# If we are remote, show "user@host" in yellow. If local, show nothing.
local user_context=''
if [[ -n $SSH_CONNECTION ]]; then
    user_context='%F{yellow}%n@%m%f '
fi

# 5. Build the Prompt
# Line 1: [User@Host] [Directory in Blue] [Git Info]
# Line 2: [Arrow that turns red on error]
PROMPT='
${user_context}%B%F{blue}%~%f%b${vcs_info_msg_0_}
%(?.%F{magenta}.%F{red})❯%f '

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
# bindkey -vi

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

autoload -Uz compinit
compinit

eval "$(uv generate-shell-completion zsh)"
alias uv='nocorrect uv'

zstyle ':completion:*' completer _expand _complete _ignored
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

zstyle ':completion:*' menu select=2
zstyle ':completion:*' group-name ''
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' verbose true

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}



zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'


# TMUX Restart
# if [[ $- =~ i ]] && [[ -z "$TMUX" ]] && command -v tmux &> /dev/null; then
    # Attach to an existing session named 'main' or create a new one
#    exec tmux new-session -A -s main
#  fi

# GHOSTY TERm
if [[ "$TERM_PROGRAM" == "ghostty" ]]; then
  export TERM=xterm-256color
fi

export PATH="$PATH:$HOME/.docker/bin"

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/deekshith/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

# opencode
export PATH=/Users/deekshith/.opencode/bin:$PATH

# pyenv colab vscode
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"
