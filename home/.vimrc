"Schaltet die volle VIM-Funktionalität frei
set nocp

"Einige Spezialitaeten fuer Windowssysteme
if has("win32") || has("win64")
    source $VIMRUNTIME/vimrc_example.vim
    source $VIMRUNTIME/mswin.vim
    behave mswin 
    "Open GVim im Vollbild
    au GUIEnter * simalt ~x
endif

"Diffs nebeneinander sauber anzeigen
set diffopt=vertical,filler

"Krypto mit blowfish
if v:version >= 704
    set cm=blowfish2
endif

"Immer dunkler Hintergrund
set background=dark

"Farbscheme desert ist gut lesbar
colorscheme desert

"Aktiviert Syntax-Highlighting. 
syntax on

"Backspace über das Zeilenende hinaus
set backspace=2

"Zeilen bei 72 brechen
set tw=72

"Immer X Zeilen vor/nach dem Cursor anzeigen
set so=5

"Tablaenge setzen auf # Zeichen
set ts=4

"RegExp magisch machen
set magic

"Suchetreffer während der Eingabe hervorheben.
set incsearch

"Suchtreffer hervorheben
set hlsearch

"Keine Gross/Kleinschreibung
set ignorecase

"kein Piepsen bei Fehlern
set noerrorbells

"Lieber flackern als piepsen
set visualbell

"Zeilennummer anzeigen
set ruler

"Befehle im Befehlsmodus beim Tippen anzeigen
set showcmd

"Schoenere Vervollstaendigung von Befehlen
set wildmenu

"Statuszeile immer anzeigen
set ls=2

"Statuszeile setzen
set statusline=%F\ %m%r%y%=%l-%v/%L

"Zeilennummern anzeigen
set number

"let g:GPGDefaultRecipients = ["MAILADRESSE"]

"Um statt Tabs Spaces zu setzen
set expandtab

"Laenge der 'softtabstops'
set softtabstop=4 

"Laenge der shifts
set shiftwidth=4

"Tabs sind vier Zeichen lang
set tabstop=4

"Automatisch einruecken
set autoindent

"Intelligentes einruecken
set smartindent

"Setze GVIM Schrift
set gfn=Monospace\ 8

"Folding
set fdm=syntax
set nofoldenable 

"Lade Dateispezifische Plugins
filetype plugin on

"=========================================
"Einstellungen fuer bestimmte Dateiformate
"=========================================
autocmd FileType perl set tw=0
autocmd FileType c set tw=0
autocmd FileType c set autowrite
autocmd FileType csv set tw=0
autocmd FileType csv set nowrap 


"Definiere einige Tasten nur fuer Android-Tablet
"imap << <ESC>
"map! <F1> !
"map <F1> !
"map! <F2> "
"map <F2> "
"map <F4> $
"map! <F4> $
"map <F9> (
"map! <F9> (
"map <F10> )
"map! <F10> )
