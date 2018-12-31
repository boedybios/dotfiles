# ============================================================================
# DEFAULT LOCATION FOR MANJARO
# ============================================================================
# ~/.zshrc


# ============================================================================
# REQUIREMENTS
# ============================================================================
# - zplug
# - fzf

source /usr/share/zsh/scripts/zplug/init.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ============================================================================
# BASIC ZSH CONFIGURATION
# ============================================================================

# cd by typing directory name if it's not a command
setopt auto_cd

# automatically list choices on ambiguous completion
setopt auto_list

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

# select completions with arrow keys
zstyle ':completion:*' menu select

# group results by category
zstyle ':completion:*' group-name ''

# enable approximate matches for completion
zstyle ':completion:::::' completer _expand _complete _ignored _approximate


# ============================================================================
# ALIAS CONFIGURATION
# ============================================================================
alias less='less -i'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias ll='ls -lh'


# ============================================================================
# PLUGINS
# ============================================================================

# Let zplug manage zplug
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

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

# from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
# zplug "plugins/colorize", from:oh-my-zsh
zplug "plugins/colored-man-pages", from:oh-my-zsh


# ============================================================================
# THEMES
# ============================================================================
# Load theme file
# zplug 'dracula/zsh', as:theme
zplug 'bhilburn/powerlevel9k', as:theme


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
# CUSTOM STARTUP
# ============================================================================
neofetch
