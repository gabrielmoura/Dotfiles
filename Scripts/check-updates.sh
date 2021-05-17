#!/bin/sh




# if ! updates_aur=$(cower -u 2> /dev/null | wc -l); then
updates_aur=$(yay -Su --aur --quiet | wc -l); 


if [ "$updates_aur" -gt 0 ]; then
    echo " $updates_aur"
else
    echo "0"
fi
