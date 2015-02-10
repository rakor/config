# .cshrc - csh resource script, read at beginning of execution by each shell
#
# see also csh(1), environ(7).

alias h		history 25
alias j		jobs -l
alias la	ls -a
alias lf	ls -FAG
alias ll	ls -lAhG
alias ren	xtermcontrol --title

# A righteous umask
umask 22

set path = (/sbin /bin /usr/sbin /usr/bin /usr/games /usr/local/sbin /usr/local/bin $HOME/bin)

setenv	EDITOR	    vim
setenv  PAGER       less
setenv	BLOCKSIZE	K
setenv  CLICOLOR
setenv 	LANG de_DE.UTF-8

if ($?prompt) then
	# An interactive shell -- set some stuff up
	set prompt="\n%{\033[0;32m%}%n@%m:%{\033[0;33m%}%~%{\033[1;36m%}>%{\033\[0;37m%} "
	set promptchars = "%#"
	set autolist
	set filec
    set nobeep
	set history = 1000
	set savehist = (1000 merge)
	set mail = (/var/mail/$USER)
	if ( $?tcsh ) then
		bindkey "^W" backward-delete-word
		bindkey -k up history-search-backward
		bindkey -k down history-search-forward
        bindkey -v
	endif
endif
