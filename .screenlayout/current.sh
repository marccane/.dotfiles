#!/bin/sh
c='xrandr --output eDP-1 --mode 1920x1080 --pos 3840x0 --rotate normal --output HDMI-1 --off --output DP-1 --off --output DP-2 --off --output DP-1-1 --mode 1920x1080 --pos 1920x0 --rotate normal -r 74.97 --output DP-1-2 --off --output DP-1-3 --mode 1920x1080 --pos 0x0 --rotate normal -r 74.97'
toggleFilename="/tmp/screenLayoutForceApplyWorkaround"

if [ -e "$toggleFilename" ]; then
    echo executant 1
    rm "$toggleFilename"
    c2="${c/ 0x0 / 0x1 }" #modificació tonta perquè detecti config diferent i forci l'aplicació d'aquesta
else
    echo executant 2
    touch "$toggleFilename"
    c2=$c #comanda sense modificar
fi

$($c2) #executar comanda possiblement modificada
