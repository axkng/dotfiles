#
# .zshrc
#
# @author Alex König
#

# Aliases
alias ls="eza"
alias cat="bat"
alias du="dust"
alias find="fd"
alias grep="rg"

# Colors.
unset LSCOLORS
export CLICOLOR=1
export CLICOLOR_FORCE=1

# Nicer prompt.
export PS1=$'\n'"%F{green} %*%F %F{green}%3~ %F{white}"$'\n'"$ "

# Enable plugins.
plugins=(git brew history kubectl)

# Custom $PATH with extra locations.
export PATH=/opt/homebrew/bin:/usr/local/bin:/usr/local/sbin:$HOME/bin:/usr/local/share:$HOME/.krew/bin:$PATH

# Bash-style time output.
export TIMEFMT=$'\nreal\t%*E\nuser\t%*U\nsys\t%*S'

# Set architecture-specific brew share path.
arch_name="$(uname -m)"
if [ "${arch_name}" = "x86_64" ]; then
    share_path="/usr/local/share"
elif [ "${arch_name}" = "arm64" ]; then
    share_path="/opt/homebrew/share"
else
    echo "Unknown architecture: ${arch_name}"
fi

# Tell homebrew to not autoupdate every single time I run it (just once a week).
export HOMEBREW_AUTO_UPDATE_SECS=604800

# Delete a given line number in the known_hosts file.
knownrm() {
 re='^[0-9]+$'
 if ! [[ $1 =~ $re ]] ; then
   echo "error: line number missing" >&2;
 else
   sed -i '' "$1d" ~/.ssh/known_hosts
 fi
}
eval "$(starship init zsh)"
eval "$(mcfly init zsh)"