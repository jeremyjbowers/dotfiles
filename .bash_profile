#!/bin/bash

export DOTFILES="$HOME/working/dotfiles"

# Don't check mail when opening terminal.
unset MAILCHECK

# enable colors
alias ls="command ls -G"
export LSCOLORS='Gxfxcxdxdxegedabagacad'

# Set Sublime Text as default editor
export EDITOR="/usr/bin/subl -w"
export GIT_EDITOR='/usr/bin/subl -w'

# source congi bash files, like aliases, colors, base theme
HELPERS="${DOTFILES}/*.bash"
for config_file in $HELPERS
do
  source $config_file
done

# sweet prompt theme from bash-it
source "$DOTFILES/themes/hawaii50.theme.bash"

# source custom files
CUSTOM="$DOTFILES/custom/*"
for config_file in $CUSTOM
do
  source $config_file
done

# tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh