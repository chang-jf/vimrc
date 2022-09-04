#!/bin/bash
# Credit to vgod's [auto-install.sh]("https://github.com/vgod/vimrc/blob/master/auto-install.sh")
VIMHOME=~/.vim

warn() {
    echo "$1" >&2
}

die() {
    warn "$1"
    exit 1
}

[ -e "$VIMHOME/vimrc" ] && die "$VIMHOME/vimrc already exists."
[ -e "~/.vim" ] && die "~/.vim already exists."
[ -e "~/.vimrc" ] && die "~/.vimrc already exists."

git clone https://github.com/chang-jf/vimrc "$VIMHOME"
#git clone https://github.com/chang-jf/dotfiles ~/.dotfiles

. $VIMHOME/install-vimrc.sh

echo "vimrc is installed."

