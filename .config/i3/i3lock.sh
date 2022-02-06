#!/bin/bash
 
#depends on: imagemagick, i3lock, scrot
#https://www.reddit.com/r/unixporn/comments/3358vu/i3lock_unixpornworthy_lock_screen/cqilnv3
 
IMAGE=/tmp/lockscreen.png
TEXT=/tmp/locktext.png
ICON=~/.config/i3/i3lock.png
 
scrot $IMAGE
convert $IMAGE -scale 10% -scale 1000% -fill black -colorize 50% $IMAGE
[ -f $TEXT ] || {
    convert -size 400x60 xc:black -font 'System San Fransisco' -pointsize 26 -fill white -gravity center -annotate +0+0 'Enter Password' $TEXT;
    convert $TEXT -alpha set -channel A -evaluate set 50% $TEXT;
}
convert $IMAGE $TEXT -gravity center -geometry +0+200 -composite $IMAGE
convert $IMAGE $ICON -gravity center -composite -matte $IMAGE
i3lock -u -i $IMAGE
rm $IMAGE
rm $TEXT
