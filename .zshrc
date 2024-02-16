plugins=(
    dotenv
    zsh-autosuggestions
)


autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Aliases
alias zshconfig="code ~/.zshrc"
alias gs="git submodule update --init --recursive"
alias clearr="clear && source ~/.zshrc"
alias gapa="git add --patch"
alias grpa="git reset --patch"
alias gst="git status"
alias gdh="git diff HEAD"
alias gp="git push"
alias gph="git push -u origin HEAD"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gcm="git checkout master"
alias gcd="git checkout develop"

# Requires zoxide
alias cd="z"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm


pokemon-colorscripts -r

eval $(thefuck --alias)
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
