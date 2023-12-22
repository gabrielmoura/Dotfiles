#!bin/bash
#

if [ $# -eq 0 ]; then
    echo "Busca os módulos npm"
    echo ""
    echo "Usage: ./ssl.sh [sizeModules]"
fi



if [ "$1" == "sizeModules" ]; then
    find . -name "node_modules" -type d -prune -print | xargs du -chs
fi

if [ "$1" == "cleanModules" ]; then
    find . -name "node_modules" -type d -prune -print | xargs rm -rf
fi
