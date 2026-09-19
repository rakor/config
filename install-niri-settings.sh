#!/bin/bash

filepath=`realpath $0`
current=`dirname $filepath`
for dir in niri fastfetch fish superfile kitty; do
	rm -r ~/.config/$dir
	ln -s $current/home/.config/$dir ~/.config/$dir
done

# Config of noctalia
for config in settings.toml state.toml; do
	rm ~/.local/state/noctalia/$config
	ln -s $current/home/.local/state/noctalia/$config ~/.local/state/noctalia/$config
done
