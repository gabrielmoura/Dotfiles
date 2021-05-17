# -*- shell-script -*-
# point: cria um tunel por ssh para a maquina local

function point
{
  port="$1";
  user="$2";
  ip="$3";
  ssh -L "$port":127.0.0.1:"$port" -N -f "$user"@"$ip"
}
