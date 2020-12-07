source /usr/share/defaults/etc/profile

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/home/boedybios/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/home/boedybios/anaconda3/etc/profile.d/conda.sh" ]; then
#         . "/home/boedybios/anaconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/home/boedybios/anaconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda initialize <<<
eval "$(/usr/local/bin/starship init bash)"
