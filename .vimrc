syntax enable 
set number 
set expandtab
set tabstop=2 shiftwidth=2

autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType python set omnifunc=pythoncomplete#Complete ts=4 sw=4
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS ts=2 sw=2 smartindent expandtab
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete " may require ruby compiled in

set tagstack 
set tagrelative
set tags=./tags,tags
set title


" save/quit commands
noremap <C-S> :w<CR>
inoremap <C-S> <ESC>:w<CR>a
noremap <C-Q> :wq<CR>
noremap <S-C-Q> :q!<CR>
nmap <C-\> :sp<CR><C-]>
noremap gs :sp<CR>gf
noremap gv :vs<CR>gf

" default is to open help, which is annoying (close to the escape key =)
" now no-op
map <F1> <Nop>
imap <F1> <Nop>

map <F3> gqap
map <C-J> gqap

" deletion by word
" BUGS: C-Del on a one-char word at beginning of line jumps to next line, then
" 			deletes
"		C-BS when starting after space after word, deletes space and word as it
"			should, but when starting directly after word, doesn't delete space
" 			word
" 		C-BS doesn't work on last word of paragraph .. ??????
inoremap <C-BS> <ESC>ldbi
inoremap <C-Del> <ESC>ldwi

" in some GVIM's, hitting shift-bs results in "<S-Del>"
inoremap <S-BS> <BS>

" to replace the original <C-A> increment operator
noremap <C-C> <C-A>

" Readline-like shortcuts
imap <C-e> <end>
noremap <C-e> <end>
imap <C-a> <home>
noremap <C-a> <home>

"" Copy and Paste!
" <C-V> in visual mode originally selects a visual block, so remap that first
vnoremap v <C-V>
" then map familiar cut/copy/paste commands in visual mode
vnoremap <C-X> "+x
vnoremap <C-C> "+y
noremap <C-V> "+gP
vnoremap <C-V> "+gP

" doesn't work for some reason...
" Switch from buffer to buffer with ctrl-tab, shift-ctrl-tab
"nnoremap <C-Tab> :bnext<CR>
"nnoremap <S-C-Tab> :bprevious<CR>


set nobackup " needed on workstation machines now, some annoying global setting
set textwidth=80 " break lines at 80 chars


"hi Comment    term=bold       ctermfg=Cyan        guifg=LightBlue 
"hi Constant   term=underline  ctermfg=Yellow      guifg=Yellow      gui=underline
"hi Identifier term=underline  ctermfg=LightCyan   guifg=LightCyan 
"hi Statement  term=bold       ctermfg=Red         guifg=Red      gui=bold
"hi PreProc    term=underline  ctermfg=Magenta     guifg=Purple 
"hi Type       term=underline  ctermfg=Green       guifg=Green   gui=bold 
"hi Special    term=bold       ctermfg=Blue        guifg=Blue  gui=underline
""hi Comment      term=none       ctermfg=blue    guifg=Gray
""hi Constant	    term=underline  ctermfg=yellow  guifg=Yellow
""hi Identifier	term=underline  ctermfg=cyan    guifg=Yell
""hi Statement    term=bold       ctermfg=white   guifg=White
""hi PreProc      term=underline  ctermfg=magenta guifg=Magenta
""hi Type         term=underline  ctermfg=white   guifg=White
""hi Special      term=bold       ctermfg=green   guifg=#7f7fff
""hi Nontext      term=bold       ctermfg=red	    guifg=Red
"
"
"
"hi Comment      cterm=none	gui=none
"hi Constant     cterm=none	gui=none
"hi Identifier   cterm=bold	gui=bold
"hi Statement    cterm=bold	gui=bold
"hi PreProc      cterm=bold	gui=bold
"hi Type         cterm=bold	gui=bold
"hi Special      cterm=bold	gui=none
"hi NonText	    cterm=bold	gui=none
"
"hi xmlTag ctermfg=blue cterm=bold guifg=white
"hi xmlTagName ctermfg=blue cterm=bold guifg=white
"hi xmlEndTag ctermfg=blue cterm=bold guifg=white
"colorscheme darkblue
""hi Normal       guifg=LightGray      guibg=Black
""hi Normal       ctermfg=LightGray    ctermbg=black
"colorscheme greens
"colorscheme koehler

set nowrap
set ruler showmatch smartindent autoindent
"set cindent
set scrolloff=1 backspace=2
set whichwrap=<,>,[,],h,l
set list
set listchars=tab:\ \ ,trail:·
set mouse=a
set fileformat=unix
set cinkeys=0{,0},:,!^F,o,O,e
set nojoinspaces
"set nohlsearch
set viminfo='0,\"100,

set fo=tcroqnl
syn sync fromstart

set guifont=Menlo-Regular:h12

" On LaTeX files don't use indenting.
au BufNewFile,BufRead *.tex set noautoindent nosmartindent nocindent

" JsUnit tests
au BufNewFile,BufRead *_test.html,*_test_template.html set syn=javascript

" On Makefiles, don't expand tabs.
au BufNewFile,BufRead *Make* set noexpandtab

" In perl, don't expand tabs.
au BufNewFile,BufRead *.pl set noexpandtab

" On text files, don't expand tabs or do auto C indenting
au BufNewFile,BufRead *.txt set noexpandtab nocindent

" On CPP and H files, match spotify client C++ style
au BufNewFile,BufRead *.cc,*.cpp,*.h set expandtab ts=2 sw=2

au BufNewFile,BufRead *.nc set noexpandtab filetype=nc syn=nc

" uSmalltalk for cs152, lisp is the best-looking match i found..
au BufNewFile,BufRead *.smt set syn=lisp

" for cs182
au BufNewFile,BufRead *.in,*.lsp,*.lisp set syn=lisp expandtab

" gdesklet display files
au BufNewFile,BufRead *.display set syn=python noexpandtab

au BufNewFile,BufRead *.py set nocindent expandtab ts=2 sw=2 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class 

au BufNewFile,BufRead xorg.conf* set noexpandtab

au BufNewFile,BufRead *.sml set shiftwidth=2

au BufNewFile,BufRead *.djhtml set filetype=htmldjango sw=2 ts=2

au BufNewFile,BufRead COMMIT_EDITMSG set textwidth=70

"au Filetype html,xml,xsl,php,inc source /usr/share/vim/vimfiles/plugin/closetag.vim

au Filetype php,inc set shiftwidth=2 tabstop=2 syntax=php

" On CGI files, determine type by reading in a line.
fun! CGICheck()
    let l = getline(nextnonblank(1))
    if l =~ 'php'
	set syn=php
    elseif l =~ 'perl'
	set syn=perl
    endif
endfun

au BufRead *.cgi	call CGICheck()

" define a function to figlet stuff in :)
" like :r!cd ~/figlet221; ./figlet TEXT

augroup cprog
    au!
augroup end

filetype plugin on
set grepprg=grep\ -nH\ $*\ /dev/null

"function WQHelper()
"    let x = confirm("Current Mode is Insert-Mode!\n Would you like ':wq'?"," &Yes \n &No",1,1)
"    if x == 1
"    silent! :wq
"    else
"        "???
"    endif
"endfunction
"iab wq <bs><esc>:call WQHelper()<CR>

set modeline

autocmd InsertEnter * syn clear EOLWS | syn match EOLWS excludenl /\s\+\%#\@!$/
autocmd InsertLeave * syn clear EOLWS | syn match EOLWS excludenl /\s\+$/
highlight EOLWS ctermbg=red guibg=red

function! <SID>StripTrailingWhitespace()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
nmap <silent> <Leader><space> :call <SID>StripTrailingWhitespace()<CR>

call pathogen#infect()

" highlight tabs and trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\t\+\|\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\t\|\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\t\|\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\t\|\s\+$/
autocmd BufWinLeave * call clearmatches()

" Style for ruby files in tinker.io
au BufNewFile,BufRead *.rb highlight clear ExtraWhitespace
au BufNewFile,BufRead *.txt highlight clear ExtraWhitespace

set background=dark
"let g:solarized_termcolors = 256
"let g:solarized_termtrans = 1
" colorscheme solarized

set noequalalways " splitting windows shouldn't bounce

map <C-n> :NERDTreeToggle<CR>
map ,n :NERDTreeFind<CR>
let NERDTreeIgnore = ['\.pyc$', '\.swp$']
set wildignore+=*.pyc,dist/**,node_modules/**,components/**

augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc so $MYVIMRC
augroup END

let g:vim_svelte_plugin_use_typescript = 1
