# Ajudantes Pac ohmyzsh


* Pac : Pacman em sudo
* Pacbash : Bash ou argumentos em chroot
* Pacmake : makepkg em chroot

$CHROOT precisa estar definido.
https://wiki.archlinux.org/index.php/DeveloperWiki:Building_in_a_clean_chroot

```zsh
ZSH_CUSTOM=$HOME/.config/zsh
export CHROOT=$HOME/chroot
plugins=(pac)
```