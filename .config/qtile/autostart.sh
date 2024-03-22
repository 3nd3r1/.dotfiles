#! /bin/bash	

if [ "$(hostname)" == "elx-5cg2183zp2" ];
then
    xinput --set-prop 11 337 -0.8 &
    feh --bg-fill $HOME/Pictures/Wallpapers/office.png &
    $HOME/.screenlayout/extendOffice.sh &
else
    feh --bg-fill $HOME/Pictures/Wallpapers/pain.jpg &
    $HOME/.screenlayout/extend.sh & 
fi
picom &
barrier &
blueman-tray &
