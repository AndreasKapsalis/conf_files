#Place under ~/.xinitrc
xrdb -merge -I$HOME ~/.Xresources
exec i3
