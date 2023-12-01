export HISTIGNORE="clear:bg:fg:cd:cd -:exit:date:w:* --help"

#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
eval "$(rbenv init -)"

#nodeenv
eval "$(nodenv init -)"

export DOTNET_CLI_TELEMETRY_OPTOUT=1
