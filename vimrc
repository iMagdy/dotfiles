
execute pathogen#infect()

set autoread
let g:airline_powerline_fonts = 1



colorscheme atom-dark 

" nmap <c-n> :NERDTreeToggle<CR>
map <c-x> <Plug>(easymotion-s)
map <Leader>n <plug>NERDTreeTabsToggle<CR>

" ColorStepper Keys
nmap <F6> <Plug>ColorstepPrev
nmap <F7> <Plug>ColorstepNext
nmap <S-F7> <Plug>ColorstepReload

" Tagbar
map <c-t> :TagbarToggle<CR>


filetype plugin indent on

set autoread

":autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))

set t_Co=256

let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'objc' : ['->', '.'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,objcpp' : ['->', '.', '::'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,d,python,perl6,scala,vb,elixir,go' : ['.'],
  \   'vim' : ['re![_a-zA-Z]+[_\w]*\.'],
  \   'ruby' : ['.', '::'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \ }


"let g:ycm_key_list_select_completion = ['<C-TAB>', '<Down']
"let g:ycm_key_list_previous_completion = ['<C-S-TAB', '<Up>']
"let g:SuperTabDefaultCompletionType = '<C-Tab>'


" Toggle comments
nmap <leader>c :TComment<CR>
""Toggle comments as a block
nmap <leader>= :TCommentBlock<CR>

" MacVim
"  set guifont=Source\ Code\ Pro\:h11 
" set guifont=Fira\ Code:h11
set guifont=Input:h11
set guioptions-=r
set guioptions-=L
set guioptions-=e
set clipboard=unnamed

set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set linespace=3

"semicolumn plugin
autocmd FileType javascript,css nnoremap <silent> <Leader>; :call cosco#commaOrSemiColon()<CR>
autocmd FileType javascript,css inoremap <silent> <Leader>; <c-o>:call cosco#commaOrSemiColon()<CR>emap <C-;> <c-o>:call cosco#commaOrSemiColon()<CR>

"vim-multi-cursor
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-m>'
let g:multi_cursor_quit_key='<Esc>'

"Ag
let g:ag_working_path_mode="r"
let g:ag_prg="/usr/local/bin/ag --vimgrep"

"IndentLine
let g:indentLine_char = "┆"


" let g:indentLine_char = '|'
let g:indentLine_color_gui = '#555555'

"Window navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Closing windows
nmap <c-w><c-q> :q<CR> 

nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk

"newline without insert mode
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

"Auto close brackets
imap <C-Return> <CR><CR><C-o>k<Tab>   

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

set lcs=tab:→\ ,trail:·,eol:¬,nbsp:_


" Win Resizing
set winheight=30
set winminheight=5
nnoremap <silent> + :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3)<CR>
 """]"" """"" " " " """"" " " "



