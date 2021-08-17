# ============================================================================
# DEFAULT LOCATION FOR MANJARO
    # ============================================================================
    # ~/.zshrc


# ============================================================================
# REQUIREMENTS
# ============================================================================
# - zplug
# - fzf
# - colorls


# ============================================================================
# GLOBAL VARIABLE
# ============================================================================
source ~/.zplug/init.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# set NeoVim as devault text editor
export EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/nvim
export PATH=~/.cargo/bin:$PATH

# Maintain terminal color compatibility with tmux
export TERM="xterm-256color"

# ============================================================================
# ALIAS CONFIGURATION
# ============================================================================

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

# ============================================================================
# BASIC ZSH CONFIGURATION
# ============================================================================

# cd by typing directory name if it is not a command
setopt auto_cd

# automatically use menu completion
setopt auto_menu

# move cursor to end if word had one match
setopt always_to_end

# remove older duplicate entries from history
setopt hist_ignore_all_dups

# remove superfluous blanks from history items
setopt hist_reduce_blanks

# save history entries as soon as they are entered
setopt inc_append_history

# share history between different instances
setopt share_history

# autocorrect commands
setopt correct_all

# allow comments in interactive shells
setopt interactive_comments

# automatically list choices on ambiguous completion
setopt auto_list

# allow completion from within a word/phrase
setopt complete_in_word

# when using auto-complete, put the first option on the line immediately
setopt menu_complete

# turn on completion for aliases as well
setopt complete_aliases

# cycle through menus horizontally instead of vertically
setopt list_rows_first

# select completions with arrow keys
zstyle ':completion:*' menu select

# group results by category
zstyle ':completion:*' group-name ''

# enable approximate matches for completion
zstyle ':completion:::::' completer _expand _complete _ignored _approximate


# ============================================================================
# PLUGINS
# ============================================================================

# Let zplug manage zplug
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# Simple zsh plugin that reminds you that you should use one of your existing aliases for a command you just typed.
zplug "MichaelAquilina/zsh-you-should-use"

# autojump is a faster way to navigate your filesystem. It works by maintaining a database of the directories you use the most from the command line.
zplug "wting/autojump"

# Add syntax highlighting to your Zsh. An improved version of zsh-syntax-highlightling
zplug "zdharma/fast-syntax-highlighting"

# Add syntax highlighting to your Zsh. Make sure you load this before zsh-users/zsh-history-substring-search or they will both break.
# zplug "zsh-users/zsh-syntax-highlighting"

# ZSH port of Fish history search (up arrow)
zplug "zsh-users/zsh-history-substring-search"

# Fish-like fast/unobtrusive autosuggestions for Zsh.
zplug "zsh-users/zsh-autosuggestions"

# A collection of extra completions for Zsh.
zplug "zsh-users/zsh-completions"

# make directory listings more readable, adding a bit of color and some git status information on files and directories.
zplug "supercrabtree/k"

# A next-generation cd command with an interactive filter
# zplug "b4b4r07/enhancd"

# from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/colored-man-pages", from:oh-my-zsh


# ============================================================================
# THEMES
# ============================================================================
# Load theme file
# zplug "dracula/zsh", as:theme
# zplug "bhilburn/powerlevel9k", as:theme
# zplug "themes/gnzh", from:oh-my-zsh
# zplug "themes/bira", from:oh-my-zsh
# zplug "themes/fino", from:oh-my-zsh


# Install plugins if there are plugins that have not been installed
    if ! zplug check --verbose; then
        printf "Install? [y/N]: "
        if read -q; then
            echo; zplug install
        fi
    fi

# Then, source plugins and add commands to $PATH
    zplug load


# ============================================================================
# POWERLEVEL9K CONFIGURATION
# ============================================================================
# POWERLEVEL9K_MODE='nerdfont-complete'

# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
# dir
# vcs
# dir_writable
# )

# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
# status
# root_indicator
# background_jobs
# history
# # context
# time
# )

# POWERLEVEL9K_PROMPT_ON_NEWLINE=true
# POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
# POWERLEVEL9K_COLOR_SCHEME='dark'


# ============================================================================
# CUSTOM STARTUP
# ============================================================================
# neofetch


autoload -U compinit
compinit
autoload -U promptinit; promptinit

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

eval "$(/usr/local/bin/starship init zsh)"
