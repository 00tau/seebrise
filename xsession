#!/bin/sh

# aesthetics
xsetroot -cursor_name left_ptr
xsetroot -solid '#010101'
xrdb ~/.Xresources

# multi monitor setup
#xrandr --auto --output DVI-I-1 --right-of DVI-I-2 --output DVI-I-2 --rotate left

# set the wallpaper
if [ -x /usr/bin/feh ] ; then
    sh ~/.fehbg
    #eval $(cat ~/.fehbg)
fi

# hide the mouse pointer when not needed
if [ -x /usr/bin/unclutter ] ; then
    unclutter &
fi

# activate compositing
if [ -x /usr/bin/compton ] ; then
    compton -cC -r 5 -I 0.02 -O 0.02 -D 2 -i 1.0 -e 0.6 -m 0.9 -C -f &
fi

# path
export EDITOR=/usr/bin/vim
export PATH=/home/thomas/anaconda3/bin:/home/thomas/.config/herbstluftwm:/home/thomas/.config/seebrise:$PATH

# keyboard
setxkbmap kp kinesis # typematrix

# exec
exec dbus-launch herbstluftwm
