#!/bin/bash
# me@kaderovski.com
set -Eeuo pipefail
trap end_shloader SIGINT SIGTERM ERR EXIT RETURN
tput civis


# Loaders
ball=( 0.2 '(●)' '(⚬)');
arrow=( 0.06 '↑' '↗' '→' '↘' '↓' '↙' '←' '↖')
cym=( 0.1 '⊏' '⊓' '⊐' '⊔')
x_plus=( 0.08 '×' '+');
line=( 0.08 '☰' '☱' '☳' '☷' '☶' '☴')
ball_wave=( 0.1 '𓃉𓃉𓃉' '𓃉𓃉∘' '𓃉∘°' '∘°∘' '°∘𓃉' '∘𓃉𓃉')
old=( 0.07 '—' "\\" '|' '/' )
dots=( 0.04 '⣾' '⣽' '⣻' '⢿' '⡿' '⣟' '⣯' '⣷' )
dots2=( 0.04 '⠋' '⠙' '⠹' '⠸' '⠼' '⠴' '⠦' '⠧' '⠇' '⠏' )
dots3=( 0.04 '⠋' '⠙' '⠚' '⠞' '⠖' '⠦' '⠴' '⠲' '⠳' '⠓' )
dots4=( 0.04 '⠄' '⠆' '⠇' '⠋' '⠙' '⠸' '⠰' '⠠' '⠰' '⠸' '⠙' '⠋' '⠇' '⠆' )
dots5=( 0.04 '⠋' '⠙' '⠚' '⠒' '⠂' '⠂' '⠒' '⠲' '⠴' '⠦' '⠖' '⠒' '⠐' '⠐' '⠒' '⠓' '⠋' )
dots6=( 0.04 '⠁' '⠉' '⠙' '⠚' '⠒' '⠂' '⠂' '⠒' '⠲' '⠴' '⠤' '⠄' '⠄' '⠤' '⠴' '⠲' '⠒' '⠂' '⠂' '⠒' '⠚' '⠙' '⠉' '⠁' )
dots7=( 0.04 '⠈' '⠉' '⠋' '⠓' '⠒' '⠐' '⠐' '⠒' '⠖' '⠦' '⠤' '⠠' '⠠' '⠤' '⠦' '⠖' '⠒' '⠐' '⠐' '⠒' '⠓' '⠋' '⠉' '⠈' )
dots8=( 0.04 '⠁' '⠁' '⠉' '⠙' '⠚' '⠒' '⠂' '⠂' '⠒' '⠲' '⠴' '⠤' '⠄' '⠄' '⠤' '⠠' '⠠' '⠤' '⠦' '⠖' '⠒' '⠐' '⠐' '⠒' '⠓' '⠋' '⠉' '⠈' '⠈' )
dots9=( 0.04  '⢹' '⢺' '⢼' '⣸' '⣇' '⡧' '⡗' '⡏' )
dots10=( 0.04  '⢄' '⢂' '⢁' '⡁' '⡈' '⡐' '⡠' )
dots11=( 0.04 '⠁' '⠂' '⠄' '⡀' '⢀' '⠠' '⠐' '⠈' )


die() {
  local code=${2-1}
  exit "$code"
}


usage() {
  cat <<EOF

Available options:

-h, --help            <OPTIONAL>    Print this help and exit
-l, --loader          <OPTIONAL>   Chose loader to display
-m, --message         <OPTIONAL>    Text to display while loading
-e, --ending          <OPTIONAL>    Text to display when finishing

EOF
  exit 0
}


play_shloader() {
  while true ; do
    for frame in "${loader[@]}" ; do
      printf "\r%s" "${frame} ${message}"
      sleep "${speed}"
    done
  done
}


end_shloader() {
  kill "${loading_animation_pid}" &>/dev/null
  tput cnorm
  if [[ "${ending}" ]]; then
    printf "\r${ending}"; echo
  fi
}


shloader() {
  loader=''
  message=''
  ending=''

  while :; do
    case "${1-}" in
    -h | --help) usage;;
    -l | --loader)
      loader="${2-}"
      shift
      ;;
    -m | --message)
      message="${2-}"
      shift
      ;;
    -e | --ending)
      ending="${2-}"
      shift
      ;;
    -?*) die "Unknown option: $1" ;;
    *) break ;;
    esac
    shift
  done

  if [[ -z "${loader}" ]] ; then
    loader=dots[@] 
  else
    loader=$loader[@]
  fi

  loader=( ${!loader} )
  speed="${loader[0]}"
  unset "loader[0]"

  tput civis
  play_shloader &
  loading_animation_pid="${!}"
}
shloader
