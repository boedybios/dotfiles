eval "$(/usr/local/bin/starship init bash)"
export PATH=~/.local/bin:"$PATH"
export PATH=~/.cargo/bin:$PATH
[ -f ~/.fzf.bash ] && source ~/.fzf.bash


# alias ls="exa"
alias ls="lsd"
alias ll="ls -l"
alias la="ls -al"
alias l="ls"

alias cp="cp -i"
alias mv="mv -i"
alias rm="trash-put"

alias vi="nvim"
alias vim="nvim"

# alias cat="bat"
alias less="less -i"
