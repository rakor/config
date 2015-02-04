"Kommentare in der vimrc werden mit " eingeleitet!
"
"Schaltet die volle VIM-Funktionalität frei
set nocp

"Definiere einige Tasten neu
imap << <ESC>
map! <F1> !
map <F1> ! 
map! <F2> "
map <F2> "
map <F4> $
map! <F4> $
map <F9> (
map! <F9> (
map <F10> )
map! <F10> )

"Krypto mit blowfish
set cm=blowfish2

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

"Statuszeile immer anzeigen
set ls=2

"Statuszeile setzen
set statusline=%F\ %m%r%y%=%l-%v/%L

"let g:GPGDefaultRecipients = ["MAILADRESSE"]

"===========================
"Einstellungen fuer Perl
"===========================
"Kein Zeilenumbruch
autocmd FileType perl set tw=0

"Um statt Tabs Spaces zu setzen
set expandtab
set softtabstop=4 "Laenge der 'softtabstops'

autocmd FileType c set tw=0
autocmd FileType c set autowrite

"Setze GVIM Schrift
set gfn=Monospace\ 8

