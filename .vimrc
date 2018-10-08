set number
set mouse=a
set nowrap
set hlsearch
set backspace=indent,eol,start


":set copyindent
":set preserveindent
":set softtabstop=0
":set shiftwidth=4

"set tabstop=4
"set noexpandtab
"set shiftwidth=4
"let g:python_recommended_style = 0


"from https://dougblack.io/words/a-good-vimrc.html
"set showcmd             " show command in bottom bar
"set cursorline          " highlight current line
"set showmatch           " highlight matching [{()}]
"set incsearch           " search as characters are entered
"set foldenable          " enable folding
"set foldlevelstart=10   " open most folds by default
"set foldnestmax=10      " 10 nested fold max
"set foldmethod=indent   " fold based on indent level

"Copy:
"map <C-c> :B !pbcopy<CR>u

"Shell
set shell=/bin/zsh



"Plugins


"Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pyflakes']


"tmux window name
"autocmd BufEnter * call system('[ "$(tmux list-panes | wc -l)" -eq "1" ] && tmux rename-window ' . expand("%:t"))
"autocmd VimLeave * call system('[ "$(tmux list-panes | wc -l)" -eq "1" ] && ttmux rename-window ...')
"autocmd BufEnter * let &titlestring = ' ' . expand("%:t")

set title




