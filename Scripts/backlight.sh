#!/usr/bin/env bash
# Change the screen brightness.
# See the output of "$0 -h" for details.

# Exit immediately on each error and unset variable;
# see: https://vaneyckt.io/posts/safer_bash_scripts_with_set_euxo_pipefail/
#set -Eeuxo pipefail
set -Eeu

APP_NAME="Screen Brightness Changer"
cmd=${1:-get}
bl_dir=/sys/class/backlight/intel_backlight

function print_help() {

    script_name="$(basename "$0")"
    echo "${APP_NAME} - Allows to change the screen brightness."
    echo "It may do so using the hardware backlight or through software manipulation of pixel values sent to the screen."
    echo
    echo "Usage:"
    echo "  $script_name [OPTIONS] COMMAND"
    echo "Commands:"
    echo "  [on|off]         set the brightness to either 100% or 0%"
    echo "  [0.0, 1.0]       set the brightness to the given fraction"
    echo "  [+-][0.0, 1.0]   increase/decrease the brightness by the given fraction"
    echo "  [0, 100]%        set the brightness to the given percentage"
    echo "  [+-][0, 100]%    increase/decrease the brightness by the given percentage"
    echo "Options:"
    echo "  -h, --help              Print this usage help and exit"
    echo "Examples:"
    echo "  $script_name            # Returns the current brightness"
    echo "  $script_name 1.0        # Set to full brightness"
    echo "  $script_name 100%       # Set to full brightness"
    echo "  $script_name +0.1       # Increase brightness by 10%"
    echo "  $script_name -10%       # Reduce brightness by 10%"
    echo "  $script_name --help     # Print this usage help and exit"
}

# read command-line args
POSITIONAL=()
while [[ $# -gt 0 ]]
do
    arg="${1}"
    shift # $2 -> $1, $3 -> $2, ...

    case "${arg}" in
        -h|--help)
            print_help
            exit 0
            ;;
        *) # non-/unknown option
            POSITIONAL+=("${arg}") # save it in an array for later
            ;;
    esac
done
set -- "${POSITIONAL[@]}" # restore positional parameters

# Check if first number is larger then the second.
# This can do floating-point comparison.
function _isLarger() {
    return "$(awk -v n1="$1" -v n2="$2" \
        'BEGIN { if (n1 >= n2) { print("0") } else { print("1") } }')"
}

# Convert potentially relative (+|-X) into new absolute value.
# If relative=false, return the value.
# Else, return current +|- the value.
function _makeAbs() {
    local _cur="$1"
    local _rel="$2"
    local _rel_sign="$3"
    local _val="$4"
    local _new=""
    if $_rel
    then
        _new=$(printf "%.3f" "$(awk "BEGIN { print($_cur + ($_rel_sign * $_val)) }")")
    else
        _new="$_val"
    fi
    echo -n "$_new"
}

# Limits the input value (float) to the range [0.0, 1.0] (inclusive).
function _limit01() {
    local _val="$1"
    local _new=""
    if _isLarger "$_val" 1
    then
        _new="1.0"
    elif _isLarger 0 "$_val"
    then
        _new="0.0"
    else
        _new="$_val"
    fi
    echo -n "$_new"
}

# Post-process/parse the input command/value.
val_rel=$(echo "$cmd" | grep -q '^[+-]' && echo -n "true" || echo -n "false")
val_rel_sign=$(echo "$cmd" | grep -q '^+' && echo -n "1" || echo -n "-1")
cmd=$(echo "$cmd" | sed -e 's|^[+-]||')

# Calculate the (float) fractional value -
# absolute or relative -
# indicated by the given command.
if   [ "$cmd" == "on" ]; then
    # turn fully bright
    val_new=1.0
elif [ "$cmd" == "off" ]; then
    # turn the screen backlight off
    val_new=0.0
elif echo "$cmd" | grep -q '%$'; then
    val_new=${cmd/\%/}
    val_new=$(printf "%.3F" "$(awk "BEGIN { print($val_new / 100) }")")
elif _isLarger "$cmd" 0 && _isLarger 1 "$cmd"; then
    val_new=$cmd
elif [ "$cmd" == "get" ]; then
    val_new="0"
    val_rel="true"
    val_rel_sign="1"
else
    >&2 echo "Invalid command '$cmd'!"
    exit 1
fi

# Evaluate which backlight/brightness changeing method to use

mth_xbacklight=false
mth_bare=false
mth_xrandr=false
if which xbacklight > /dev/null 2>&1 && xbacklight -get > /dev/null 2>&1
then
  #  echo "Using 'xbacklight' (hardware) ..."
    # This requires the `xbacklight` utility installed
    # and the systems backlight to be suported by it.
    # This method actually changes the backlight brightness (hardware).
    mth_xbacklight=true
elif [ -d "$bl_dir" ] && [ "$EUID" -eq 0 ]
then
   # echo "Using '$bl_dir' (hardware) ..."
    # This requires the $bl_dir directory to be present
    # and this script to be run with root priviledges
    # in order to be able to write ot that dir.
    # This method actually changes the backlight brightness (hardware).
    mth_bare=true
elif which xrandr > /dev/null 2>&1
then
   # echo "Using xrandr (software) ..."
    # This has no prerequisite; it should always work.
    # This method only manipulates the pixel values sent to the screen, imitating more/less brightness (software).
    mth_xrandr=true
else
    >&2 echo "No low-level-method chosen!"
    exit 1
fi

# Fetch the current brightness value as fraction in [0.0, 1.0]
if $mth_xbacklight
then
    val_cur_perc=$(xbacklight -get)
    val_cur=$(printf "%.3f" "$(awk "BEGIN { print($val_cur_perc / 100) }")")
elif $mth_bare
then
    val_max=$(cat "$bl_dir/max_brightness")
    val_cur_abs=$(cat "$bl_dir/brightness")
    val_cur=$(printf "%.3f" "$(awk "BEGIN { print(1.0 * $val_cur_abs / $val_max) }")")
elif $mth_xrandr
then
    val_cur=$(xrandr --verbose | grep -i "brightness" | sed -e 's|.*: ||')
else
    >&2 echo "No low-level-method chosen!"
    exit 1
fi

# Calculate the new brightness value as fraction in [0.0, 1.0]
val_new=$(_limit01 "$(_makeAbs "$val_cur" "$val_rel" "$val_rel_sign" "$val_new")")
val_new_perc=$(printf "%.0f" "$(awk "BEGIN { print($val_new * 100) }")")

# Just print the (new == old) current brightness percentage and exit
if [ "$cmd" == "get" ]
then
    echo "${val_new_perc}%"
    exit 0
fi

# Set the new brightness value
if $mth_xbacklight
then
    xbacklight -set "$val_new_perc"
elif $mth_bare
then
    val_max=$(cat "$bl_dir/max_brightness")
    val_new_abs=$(printf "%.0f" "$(awk "BEGIN { print($val_new * $val_max) }")")
    echo -n "$val_new_abs" | tee "$bl_dir/brightness"> /dev/null
elif $mth_xrandr
then
    display=$(xrandr -q | grep " connected" | sed -e 's| .*||')
    xrandr --output "$display" --brightness "$val_new"
else
    >&2 echo "No low-level-method chosen!"
    exit 1
fi