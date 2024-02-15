if [ "$XDG_CURRENT_DESKTOP" = "i3" ]; then
    export QT_QPA_PLATFORMTHEME="kde"
fi

#### DOCKER
export DOCKER_HOST=tcp://127.0.0.1:2375

### PHP
export PATH=$PATH:$HOME/.config/composer/vendor/bin

### Local
export PATH=$PATH:$HOME/.local/bin

### GO
go env -w GO111MODULE=auto
export GOPATH=$HOME/go:$HOME/Projetos/Go
export PATH=$PATH:$HOME/go/bin/

#### ANDROID
export ANDROID_SDK_ROOT=$HOME/Android/Sdk
export ANDROID_AVD_HOME=$HOME/.android/avd
export ANDROID_HOME=$HOME/Android/Sdk #/opt/android-sdk
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools:$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/cmdline-tools
export ANDROID_NDK_HOME=/opt/android-ndk

#### ESP32
export PATH=$PATH:$HOME/.espressif/python_env/idf4.1_py3.8_env/bin:/usr/bin:$HOME/.espressif/tools/xtensa-esp32-elf/esp-2020r2-8.2.0/xtensa-esp32-elf/bin:$HOME/.espressif/tools/xtensa-esp32s2-elf/esp-2020r2-8.2.0/xtensa-esp32s2-elf/bin:$HOME/.espressif/tools/esp32ulp-elf/2.28.51-esp-20191205/esp32ulp-elf-binutils/bin:$HOME/.espressif/tools/esp32s2ulp-elf/2.28.51-esp-20191205/esp32s2ulp-elf-binutils/bin:$HOME/.espressif/tools/openocd-esp32/v0.10.0-esp32-20191114/openocd-esp32/bin
export TOOL_PATH=$HOME/.espressif/tools/openocd-esp32/v0.10.0-esp32-20191114/openocd-esp32/share/openocd/scripts

### PERL

PATH="${HOME}/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="${HOME}/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="${HOME}/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"${HOME}/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=${HOME}/perl5"; export PERL_MM_OPT;

# PNPM
export PNPM_HOME="${HOME}/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Github
export CR_PAT="ghp_JzkRfVslOn4IZuTJ1EKbJj"

# Tmux
export TMUX_CONFIG="$HOME/.config/tmux/tmux.conf"

