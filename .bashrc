
krabby random

[ -f "/c/Users/Slava/bin/win-sudo/s/path.sh" ] && source "/c/Users/Slava/bin/win-sudo/s/path.sh"
[ -f ~/.inshellisense/key-bindings.bash ] && source ~/.inshellisense/key-bindings.bash

eval "$(fzf --bash)"
eval "$(starship init bash)"
eval "$(zoxide init bash)"

[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh
eval "$(atuin init bash)"

export BAT_THEME=Dracula