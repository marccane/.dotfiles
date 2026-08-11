#!/bin/bash

# Change this one value to set which layout runs when no argument is given.
DEFAULT_LOCATION=1

# 1=claitec1, 2=claitec2
LOCATION=${1:-$DEFAULT_LOCATION}

case "$LOCATION" in
  1)
    ~/.screenlayout/claitec1.sh
    # historicament l'script claitec1 ja the el rate integrat i no ho trec de moment
    ;;
  2)
    ~/.screenlayout/claitec2.sh
    sleep 1
    xrandr --output DP-1-1 --mode 1920x1080 --rate 74.97 --output DP-1-2 --mode 1920x1080 --rate 100.00
    #--mode força l'aplicació de la config
    ;;
  *)
    echo "Usage: $0 [1|2]"
    echo "  1 = claitec1 layout$([ "$DEFAULT_LOCATION" = 1 ] && echo ' (default)')"
    echo "  2 = claitec2 layout$([ "$DEFAULT_LOCATION" = 2 ] && echo ' (default)')"
    exit 1
    ;;
esac
