#! /bin/bash	

if [ "$(hostname)" == "elx-5cg2183zp2" ];
then
    xinput --set-prop 11 337 -1 &
    $HOME/.screenlayout/extendOffice.sh &
else
    $HOME/.screenlayout/extend.sh & 
fi
picom &
barrier &
blueman-tray &
