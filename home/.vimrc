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
colorscheme molokai

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

"Mit strg-down in eine neue Zeile
ino [1;5B <ESC>o
nn [1;5B o
"Mit strg-up eine neue Zeile hoch
ino [1;5A <ESC>O
nn [1;5A O

"Zugehörige Klammern nur leicht blau färben
hi MatchParen cterm=none ctermbg=none ctermfg=blue

"Tabnavigation
nmap <C-t> :tabnew <CR>
nmap <C-l> gt
nmap <C-h> gT
nmap <C-Right> gt
nmap <C-Left> gT

"Quickfixlist und Errorolist
map <C-j> :lnext<CR>
map <C-k> :lprevious<CR>
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

"=========================================
"Einstellungen fuer bestimmte Dateiformate
"=========================================
autocmd FileType perl set tw=0
autocmd FileType c set tw=0
autocmd FileType c set autowrite
autocmd FileType csv set tw=0
autocmd FileType csv set nowrap 

"Automatismen fuer Go
"====================
"Automatisch speichern wenn :make (bzw. GoBuild, GoRun,..) aufgerufen wird
autocmd FileType go set autowrite
"Automatische Klammern
autocmd FileType go inoremap {      {}<Left>
autocmd FileType go inoremap {<CR>  {<CR>}<Esc>O
autocmd FileType go inoremap {{     {
autocmd FileType go inoremap {}     {}
autocmd FileType go inoremap (      ()<Left>
autocmd FileType go inoremap (<CR>  (<CR>)<Esc>O
autocmd FileType go inoremap ((     (
autocmd FileType go inoremap ()     ()
autocmd FileType go inoremap [      []<Left>
autocmd FileType go inoremap [<CR>  [<CR>]<Esc>O
autocmd FileType go inoremap [[     [
autocmd FileType go inoremap []     []
"Autovervollständigung
autocmd FileType go inoremap iferr if err != nil {<CR>}<ESC>O
autocmd FileType go colorscheme molokai

autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <F1> :GoDoc <CR> 
autocmd FileType go nmap <F2> :GoDocBrowser <CR>
autocmd FileType go nmap <F3> :GoRun <CR>
autocmd FileType go nmap <Leader>i <Plug>(go-info)

let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
"let g:go_auto_type_info = 1
set updatetime=100
let g:go_auto_sameids = 1



" Rechtschreibprüfung für bestimmte Dateitypen
au BufNewFile,BufRead,BufEnter   *.wiki    setlocal spell    spelllang=de_de
au BufNewFile,BufRead,BufEnter   *.md      setlocal spell    spelllang=de_de
au BufNewFile,BufRead,BufEnter   *.txt     setlocal spell    spelllang=de_de
au BufNewFile,BufRead,BufEnter   README    setlocal spell    spelllang=en_us
