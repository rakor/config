"Kommentare in der vimrc werden mit " eingeleitet!
"
"Schaltet die volle VIM-Funktionalität frei
set nocp

"Aktiviert Syntax-Highlighting. 
syntax on

"Backspace über das Zeilenende hinaus
set backspace=2

"Zeilen bei 72 brechen
set tw=72

"Tablaenge setzen auf # Zeichen
set ts=4

"Suchetreffer während der Eingabe hervorheben.
set incsearch

"Suchtreffer hervorheben
set hlsearch

"kein Piepsen bei Fehlern
set noerrorbells

"Zeilennummer anzeigen
set ruler

"Befehle im Befehlsmodus beim Tippen anzeigen
set showcmd

set ls=2
set statusline=%F\ %m%r%y%=%l-%v/%L

"Um statt Tabs Spaces zu setzen
"set expandtab
"set softtabstop=4 "Länge der 'softtabstops'

"let g:GPGDefaultRecipients = ["MAILADRESSE"]
autocmd FileType perl set tw=0

autocmd FileType c set tw=0
autocmd FileType c set autowrite

"Setze GVIM Schrift
set gfn=Monospace\ 8

