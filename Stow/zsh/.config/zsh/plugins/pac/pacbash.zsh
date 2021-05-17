# -*- shell-script -*-
# pacbash: Entra em chroot, ou envia dados para.
# https://wiki.archlinux.org/index.php/DeveloperWiki:Building_in_a_clean_chroot

function pacbash
{
  arg="$*";
  arch-nspawn $CHROOT/root "$arg"
}
