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
# PLUGINS
# ============================================================================

# autojump is a faster way to navigate your filesystem. It works by maintaining a database of the directories you use the most from the command line.
zplug "wting/autojump"

# Add syntax highlighting to your Zsh. Make sure you load this before zsh-users/zsh-history-substring-search or they will both break.
zplug "zsh-users/zsh-syntax-highlighting"

# Fish-like fast/unobtrusive autosuggestions for Zsh.
zplug "zsh-users/zsh-autosuggestions"

# A collection of extra completions for Zsh.
zplug "zsh-users/zsh-completions"

# A simple tool that provides enhanced cd command.
zplug "b4b4r07/enhancd"

zplug "plugins/git",   from:oh-my-zsh
zplug "plugins/colored-man-pages",   from:oh-my-zsh


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
