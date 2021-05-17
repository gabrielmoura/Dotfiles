# -*- shell-script -*-
# pac: Encaminha pacman para sudo

function pac
{
  arg="$*";
  sudo /usr/bin/pacman "$arg"
}
