krabby random
[ -f "/c/Users/Slava/bin/win-sudo/s/path.sh" ] && source "/c/Users/Slava/bin/win-sudo/s/path.sh"

[ -f ~/.inshellisense/key-bindings.bash ] && source ~/.inshellisense/key-bindings.bash



eval "$(starship init bash)"
eval "$(zoxide init bash)"eval "$(atuin init bash)"
[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh
eval "$(atuin init bash)"
ble/util/import/eval-after-load core-complete 'ble/array#remove _ble_complete_auto_source atuin-history'