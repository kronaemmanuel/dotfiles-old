# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt notify
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/krona/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Alias for dotfiles management
alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

# Starship
eval "$(starship init zsh)"

# Tizonia
#alias music='tizonia --soundcloud-user-likes'

# Pacman
alias pacman='sudo pacman'

# .vimrc edit
alias vimrc='vim ~/.vimrc'

# .zshrc edit
alias zshrc='vim ~/.zshrc'

# vim without any settings plugins
#alias vi='vim -u NONE'

# show battery percentage
alias bat='cat /sys/class/power_supply/BAT0/capacity'
