# ~/.bashrc: executed by bash(1) for non-login shells.

# Note: PS1 and umask are already set in /etc/profile. You should not
# need this unless you want different defaults for root.
#PS1='[ROOT] ${debian_chroot:+($debian_chroot)}\h:\w\$ '
#PS1="\[$(tput setaf 1)\][ROOT] \h\[$(tput setaf 3)\]:\w\[$(tput setaf 6)\]\\$ \[$(tput sgr0)\]"
PS1="\n\[\e[49;7;31m\][ROOT]\[\e[49;0;31m\] \h\[\e[49;0;33m\]:\w\[\e[49;0;36m\]\\$ \[\e[0m\]"
# umask 022

# You may uncomment the following lines if you want `ls' to be colorized:
 export LS_OPTIONS='--color=auto'
 eval "`dircolors`"
 alias ls='ls $LS_OPTIONS'
 alias ll='ls $LS_OPTIONS -l'
 alias l='ls $LS_OPTIONS -lAh'
#
# Some more alias to avoid making mistakes:
# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'
#alias ll='ls -lh'
PATH="$PATH:/root/bin"
