export PATH="/usr/local/opt/openjdk/bin:/usr/local/Cellar/smlnj/110.84/bin:/usr/local/bin:/usr/local/sbin:~/Library/bin:$PATH"
export CDPATH=:~/code
export EDITOR="vim"
#export VISUAL="mvim -f"
export GEM_OPEN_EDITOR="vim"
export JAVA_HOME='/System/Library/Frameworks/JavaVM.framework/Home'
export CLICOLOR=1
export PGOPTIONS='-c client_min_messages=WARNING'
export NODE_PATH="/usr/local/lib/node_modules"
export CPPFLAGS="-I/usr/local/opt/openjdk/include"

# fixes the issue with ZSH / NPM until ZSH is upgrade to the new function _npm
if type npm > /dev/null; then
  eval "$(npm completion)"
fi

export DOTNET_CLI_TELEMETRY_OPTOUT=1
