source /usr/share/zsh/scripts/zplug/init.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

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

zplug "plugins/git"

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
zplug load --verbose

# ZSH_THEME="robbyrussell"

# function powerline_precmd() {
#         PS1="$(powerline-shell --shell zsh $?)"
# }

# function install_powerline_precmd() {
#         for s in "${precmd_functions[@]}"; do
#                 if [ "$s" = "powerline_precmd" ]; then
#                         return
#                 fi
#         done
#         precmd_functions+=(powerline_precmd)
# }

# if [ "$TERM" != "linux" ]; then
#         install_powerline_precmd
# fi
