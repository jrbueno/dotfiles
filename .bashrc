alias ..="cd .."
alias b="cd -"
alias q="exit"
alias r="rake"
alias gc="git commit -a"
alias gcm="git commit -am"

function gitdays {
    git log --author=jrbueno --reverse --since="$@ days ago" --pretty="format:%n%Cgreen%cd%n%n%s%n%b%n---------------------------------------------"
}

if [ "$OSTYPE" == "msys" ]; then
  SSH_ENV="$HOME/.ssh/environment"

  function start_agent {
    echo "Initializing new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add;
  }

  # Source SSH settings, if applicable
  if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    #ps ${SSH_AGENT_PID} doesn't work under cywgin
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
      start_agent;
    }
  else
    start_agent;
  fi

  # Loads Pik into the shell.
  [[ -s $USERPROFILE/.pik/.pikrc ]] && source $USERPROFILE/.pik/.pikrc
fi


#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
