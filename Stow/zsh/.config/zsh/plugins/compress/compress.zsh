# -*- shell-script -*-

function compress
{
  dir="$*";
  tar -cf - "$dir" | xz -9 -c - > "$dir".tar.xz;
}
