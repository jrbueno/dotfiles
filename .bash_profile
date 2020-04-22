export HISTIGNORE="clear:bg:fg:cd:cd -:exit:date:w:* --help"

#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
eval "$(rbenv init -)"

#nodeenv
eval "$(nodenv init -)"

#.Net Core Dnx & Dnx Version Manager
[ -s "/Users/jrbueno/.dnx/dnvm/dnvm.sh" ] && . "/Users/jrbueno/.dnx/dnvm/dnvm.sh" # Load dnvm

export DOTNET_CLI_TELEMETRY_OPTOUT=1
