# -*- shell-script -*-
# pacmake: makepkg em chroot
# https://wiki.archlinux.org/index.php/DeveloperWiki:Building_in_a_clean_chroot


function pacmake
{
  arg="$*";
  makechrootpkg -c -r $CHROOT "$dir" 
}
