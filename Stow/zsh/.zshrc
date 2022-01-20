# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# export GOROOT=/usr/lib/go
go env -w GO111MODULE=auto
export GOPATH=$HOME/go:$HOME/Projetos/Go
export PATH=$PATH:$HOME/go/bin/
export PATH=$PATH:$HOME/.config/composer/vendor/bin
export PATH=$PATH:$HOME/.local/bin
export CHROOT=$HOME/chroot

#### DOCKER
export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock

#### ANDROID
export ANDROID_SDK_ROOT=$HOME/Android/Sdk
export ANDROID_AVD_HOME=$HOME/.android/avd
export ANDROID_HOME=$HOME/Android/Sdk #/opt/android-sdk
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools:$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/cmdline-tools
export ANDROID_NDK_HOME=/opt/android-ndk

export MANPATH="/usr/local/man:$MANPATH"
export LANG=pt_BR.UTF-8

#### ESP32
export PATH=$PATH:$HOME/.espressif/python_env/idf4.1_py3.8_env/bin:/usr/bin:$HOME/.espressif/tools/xtensa-esp32-elf/esp-2020r2-8.2.0/xtensa-esp32-elf/bin:$HOME/.espressif/tools/xtensa-esp32s2-elf/esp-2020r2-8.2.0/xtensa-esp32s2-elf/bin:$HOME/.espressif/tools/esp32ulp-elf/2.28.51-esp-20191205/esp32ulp-elf-binutils/bin:$HOME/.espressif/tools/esp32s2ulp-elf/2.28.51-esp-20191205/esp32s2ulp-elf-binutils/bin:$HOME/.espressif/tools/openocd-esp32/v0.10.0-esp32-20191114/openocd-esp32/bin

export TOOL_PATH=$HOME/.espressif/tools/openocd-esp32/v0.10.0-esp32-20191114/openocd-esp32/share/openocd/scripts
#### Bundler
export PATH=$PATH:$HOME/.gem/ruby/2.7.0/bin

export PATH=$PATH:/usr/lib/distcc

export PATH=$PATH:$HOME/Dotfiles/Scripts/dash.SH
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

#export IDF_PATH=/opt/esp-idf
#. /opt/esp-idf/export.sh


# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# Theme spaceship: https://github.com/denysdovhan/spaceship-prompt
ZSH_THEME="gentoo"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="dd/mm/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$HOME/.config/zsh

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git extract git-flow golang zsh-syntax-highlighting mkcd compress point pac systemadmin sudo)

source $ZSH/oh-my-zsh.sh
#################### User settings below this line ################################

# Extended globbing. Allows using regular expressions with *
setopt extendedglob
# Case insensitive globbing
setopt nocaseglob
# Array expension with parameters
setopt rcexpandparam
# Dont warn about running processes when exiting
setopt nocheckjobs
# Sort filenames numerically when it makes sense
setopt numericglobsort
# No beep
setopt nobeep
# Immediately append history instead of overwriting
setopt appendhistory
# If a new command is a duplicate, remove the older one
setopt histignorealldups
# if only directory path is entered, cd there.
setopt autocd
# Remove command lines from the history list when the first character on the line is a space.
setopt HIST_IGNORE_SPACE

# User configuration
export SSH_KEY_PATH="~/.ssh/rsa_id"
# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
##########################  Aliases section  ########################################


alias ls='exa --group-directories-first' # https://the.exa.website/
alias l='ls'
alias :q='exit'
alias ips="ip addr show eth0 | grep inet | awk '{ print $2; }' | sed 's/\/.*$//'"
alias sail='[ -f sail ] && bash sail || bash vendor/bin/sail'
####################### Custom functions ###############################

# Ref: https://github.com/paulmillr/dotfiles/blob/master/home/.zshrc.sh#L282
# Show how much RAM application uses.
# $ ram safari
# # => safari uses 154.69 MBs of RAM.
ram() {
  local sum
  local items
  local app="$1"
  if [ -z "$app" ]; then
    echo "First argument - pattern to grep from processes"
  else
    sum=0
    for i in `ps aux | grep -i "$app" | grep -v "grep" | awk '{print $6}'`; do
      sum=$(($i + $sum))
    done
    sum=$(echo "scale=2; $sum / 1024.0" | bc)
    if [[ $sum != "0" ]]; then
      echo "${fg[blue]}${app}${reset_color} uses ${fg[green]}${sum}${reset_color} MBs of RAM."
    else
      echo "There are no processes with pattern '${fg[blue]}${app}${reset_color}' are running."
    fi
  fi
}

alias sized='du -sh'
    alias size='du -h'
    alias open='xdg-open'
function sign(){
gpg --output "$1".sig --detach-sig "$1"
#gpg --recipient 76CE3619A00292AF --output $1.sig --detach-sign $1
echo "Asssinado com sucesso!";
}
mount.freenet(){
mount -t btrfs -o subvol=freenet /dev/sdb2 /opt/freenet
}
clima() {
    local cache="$HOME/.cache/clima"
    local tmp="/tmp/clima"
    if curl -s 'pt.wttr.in' > $tmp; then
        mv $tmp $cache
        cat $cache
    elif [ -e $cache ]; then
        echo "Without internet connection, using local cache."
        cat $cache
    else 
        echo "You need internet connection!"
    fi
}

function compressxz(){
	for arg in $*
	do
		tar -cf - $arg | xz -9 -c - > $arg.tar.xz 
	done
}
function mkpass(){
 < /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-32};echo;
}

function bkp(){
    for arg in $*
    do
	cp $arg $arg.bkp;
    done
}

function compress(){
	for arg in $*
	do
		tar -cJf $arg.tar.xz $arg
	done
}
function compress.9(){
for arg in $*
do
	tar -cf - $arg | xz -9ev -c - > $arg.tar.xz
done
}
function transfer(){
    if [ ! -f ~/.transferShLog ]
    then
	touch ~/.transferShLog;
    fi

    if [ $# -eq 0 ]
    then
	echo -e "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md";
	return 1;
    fi
    tmpfile=$( mktemp -t transferXXX );
    if tty -s
    then
	basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g');
	curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile;
    else
	curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ;
    fi;
    cat $tmpfile >> ~/.transferShLog;
    echo -e "\n" >> ~/.transferShLog;
    cat $tmpfile;  rm -f $tmpfile;
}

###### convert seconds to minutes, hours, days, and etc.
# inputs a number of seconds, outputs a string like "2 minutes, 1 second"
# $1: number of seconds
#
function displaytime {
  local T=$1
  local D=$((T/60/60/24))
  local H=$((T/60/60%24))
  local M=$((T/60%60))
  local S=$((T%60))
  [[ $D > 0 ]] && printf '%d days ' $D
  [[ $H > 0 ]] && printf '%d hours ' $H
  [[ $M > 0 ]] && printf '%d minutes ' $M
  [[ $D > 0 || $H > 0 || $M > 0 ]] && printf 'and '
  printf '%d seconds\n' $S
}
#timer
timer(){
    #convert time
    m=$(echo $1 | cut -d ":" -f 1);
    s=$(echo $1 | cut -d ":" -f 2);

    time=$(($m*60 + $s));

    echo "Waiting " $time "seconds..." ;

    sleep $time | spin;

    echo "... end !";

    #use msi keyboard led
    if [ -f ~/Scripts/msiNotify.sh ]
    then
	~/Scripts/msiNotify.sh -1;
    fi
}

#chrono
chrono(){
    #init counter
    i=0;
    while true
    do
	echo $i;
	let i++;
	sleep 1;
	clear;
    done
}
autoload -U +X bashcompinit && bashcompinit
zmodload -i zsh/parameter
if ! (( $+functions[compdef] )) ; then
    autoload -U +X compinit && compinit
fi

alias tb="nc termbin.com 9999"
transfer.sh() { if [ $# -eq 0 ]; then echo -e "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; return 1; fi 
tmpfile=$( mktemp -t transferXXX ); if tty -s; then basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile; else curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ; fi; cat $tmpfile; rm -f $tmpfile; 
}
function tmp.ninja(){
      if [ $# -eq 0 ]
    then
	echo -e "No arguments specified.";
	return 1;
    fi
    curl -i -F file=@"$1" https://tmp.ninja/api.php?d=upload-tool
} 
PATH="/home/blx32/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/blx32/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/blx32/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/blx32/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/blx32/perl5"; export PERL_MM_OPT;

