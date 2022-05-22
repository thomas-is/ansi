#!/bin/sh

## https://en.wikipedia.org/wiki/ANSI_escape_code

ESC() { printf "\033"; }                  # escape

RIS() { ESC; printf "c"; }                # reset to initial state
CSI() { ESC; printf "["; }                # control sequence introducer

CUU() { CSI; printf "${1:-0}A"; }         # cursor up
CUD() { CSI; printf "${1:-0}B"; }         # cursor down
CUF() { CSI; printf "${1:-0}C"; }         # cursor forward
CUB() { CSI; printf "${1:-0}D"; }         # cursor back
CNL() { CSI; printf "${1:-0}E"; }         # cursor next line
CPL() { CSI; printf "${1:-0}F"; }         # cursor previous line
CHA() { CSI; printf "${1:-0}G"; }         # cursor horizontal absolute
CUP() { CSI; printf "${1:-0};${2:-0}H"; } # cursor position
ED()  { CSI; printf "${1:-0}J"; }         # erase in display
EL()  { CSI; printf "${1:-0}K"; }         # erase in line
SU()  { CSI; printf "${1:-0}S"; }         # scroll up
SD()  { CSI; printf "${1:-0}T"; }         # scroll down
HVP() { CSI; printf "${1:-0};${2:-0}f"; } # horizontal vertical position
DSR() { CSI; printf "6n"; }               # device status report
SGR() { CSI; printf "${1:-0}m"; }         # select graphic rendition

NORMAL()    { SGR "0"; }
BOLD()      { SGR "1"; }
DIM()       { SGR "2"; }
ITALIC()    { SGR "3"; }
UNDERLINE() { SGR "4"; }
BLINK()     { SGR "5"; }
FASTBLINK() { SGR "6"; }
REVERSE()   { SGR "7"; }
HIDE()      { SGR "8"; }
STRIKE()    { SGR "9"; }
FG()        { SGR "38;5;${1:-0}"; }
BG()        { SGR "48;5;${1:-0}"; }
FG_RGB()    { SGR "38;2;${1:-255};${2:-255};${3:-255}"; }
BG_RGB()    { SGR "48;2;${1:-0};${2:-0};${3:-0}"; }
