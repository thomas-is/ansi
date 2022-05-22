#!/bin/sh

BASEDIR=$( realpath $(dirname $0) )
. $BASEDIR/codes.sh

renderFG() { FG $1; printf " %3d " $1; NORMAL; }
renderCell() { BG $1; printf " %3d " $1; NORMAL; }

echo
printf "FG,BG\n"
for line in $( seq 0 1 )
do
  for col in $( seq 0 7 )
  do
    N=$(($line*8+$col))
    if [ $N -gt 0 ]; then
      FG 0
    fi
    renderCell $N
  done
  printf "\n"
done
for line in $( seq 0 5 )
do
  for col in $( seq 0 35 )
  do
    N=$(($line*36+$col+16))
    if [ $col -gt 17 ] ; then
      FG 0
    fi
    renderCell $N
  done
  printf "\n"
done
for N in $( seq 232 255 )
do
  if [ $N -gt 243 ] ; then
    FG 0
  fi
  renderCell $N
done
printf "\n"

echo
NORMAL    ; printf "NORMAL\n";    NORMAL
BOLD      ; printf "BOLD\n";      NORMAL
DIM       ; printf "DIM\n";       NORMAL
ITALIC    ; printf "ITALIC\n";    NORMAL
UNDERLINE ; printf "UNDERLINE\n"; NORMAL
BLINK     ; printf "BLINK\n";     NORMAL
FASTBLINK ; printf "FASTBLINK\n"; NORMAL
REVERSE   ; printf "REVERSE\n";   NORMAL
HIDE      ; printf "HIDE\n";      NORMAL
STRIKE    ; printf "STRIKE\n";    NORMAL
echo
