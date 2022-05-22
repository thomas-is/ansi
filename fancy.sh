#!/bin/sh


BASEDIR=$( realpath $(dirname $0) )
. $BASEDIR/codes.sh

OK=$( BOLD; FG 2; printf "*"; NORMAL)
KO=$( BOLD; FG 1; printf "x"; NORMAL)
printf "  waiting for connection\n" ''
for N in $( seq 1 2 )
do
  CPL; BOLD; FG 4; printf "%1s" '|' ; NORMAL; CNL; sleep 0.25
  CPL; BOLD; FG 4; printf "%1s" '/' ; NORMAL; CNL; sleep 0.25
  CPL; BOLD; FG 4; printf "%1s" '-' ; NORMAL; CNL; sleep 0.25
  CPL; BOLD; FG 4; printf "%1s" '\' ; NORMAL; CNL; sleep 0.25
done
CPL; EL; printf "%1s connected\n" $OK
sleep 3
CPL; EL; printf "%1s disconnected\n" $KO
