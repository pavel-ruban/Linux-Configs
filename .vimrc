" External sources.
"source ~/.vim/autotag.vim
source ~/.vim/tools.vim
source ~/.vim/foldtext.vim
syntax on
"colorscheme customhick
colorscheme hemisu
set t_Co=256
set nobackup
set ignorecase
set hlsearch
set incsearch
set expandtab
"set tags=~/prj/lotep/site/tags
"set tags=~/prj/lex4me/tags
"set tags=~/prj/geopolis/tags
"set tags=/http/le360/public/tags
"set tags=/http/tehnovosti/tags
"set tags=~/php-tags/tags
set tags=/http/skimium/tags
set shiftwidth=2
set ai
set ts=2
set number
set autochdir
set background=dark
set mouse=a

" Mappings :
" Press Space to turn off highlighting and clear any message already displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
nmap cp :let @" = expand("%")<CR>
nmap <S-F9> <Plug>ToggleProject
nnoremap <silent> <S-F8> :TlistToggle <CR>
nnoremap <S-F4> :%s/\s\+$//<CR>
nnoremap <S-F3> :!tail -n 30 /var/log/httpd/error.log <CR>
nnoremap <C-S-Insert> :OScan paste <CR>
nnoremap <M-C-End> :FufChangeList <CR>
"nmap nm :OScan changes <CR><CR>
nmap <M-C-PageDown> :FufTag<cr>

com! -complete=file -nargs=* Edit silent! exec "!vim --servername " . v:servername . " --remote-silent <args>"
"imap { {<cr>.<cr>}<up><left><del><space><space>
"nmap <S-F9>  :new ~/.vimprojects <CR>
"command! -nargs=2 G :vimgrep /<args>/ ~/prj/geopolis/sites/all/<args> | :copen


" Vatiables :

let Tlist_Exit_OnlyWindow = 1
let Tlist_Compact_Format  = 0
let s:tlist_def_php_settings = 'php;c:class;d:constant;v:variable;f:function'
let Tlist_Use_SingleClick = 0
let Tlist_Use_Right_Window = 1
let Tlist_Sort_Type = "name"
let Tlist_WinWidth = 60
let Tlist_Show_One_File = 1
let Tlist_GainFocus_On_ToggleOpen = 0
let Tlist_Auto_Highlight_Tag = 1
let Tlist_Enable_Fold_Column = 0
let g:proj_flags = "imstF"
set guioptions+=e " включаем none-gui табы
set guioptions-=r " отключаем правый scrollbar
set guioptions-=R " отключаем правый scrollbar при вертикальном разделении окна
set guioptions-=b " отключаем нижний scrollbar
set guioptions-=l " отключаем левый scrollbar
set guioptions-=L " отключаем левый scrollbar при вертикальном разделении окна
set guioptions-=T " отключаем панель инструментов
set guioptions-=m " отключаем меню
set guioptions-=a
set guioptions-=A
set guioptions-=aA
set guifont=Ubuntu\ Mono\ 16
set nolinebreak
call pathogen#infect()
"let g:vdebug_options = {"port":9001}
au! BufReadPost quickfix source ~/.vim/ftplugin/qf_fold.vim

" Taglist window width.
let g:Tlist_WinWidth=55
autocmd BufWritePost,FileWritePost * exe "%s/\\s\\+$//e | %s/\\t/  /ge"
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 4
nmap 8t @=Php_foreach()<CR>
nmap 8p @=Php_tag()<CR>
nmap 8i @=Php_html_if()<CR>
nmap 8I @=Php_if()<CR>
nmap 8c @=Php_comment()<CR>
let g:checksyntax = {
\ "auto" : 0
\}
let g:vdebug_options = {
\ "port" : 9000,
\ "server" : 'terminal',
\ "timeout" : 20,
\ "on_close" : 'detach',
\ "break_on_open" : 1,
\ "ide_key" : '',
\ "path_maps" : {},
\ "debug_window_level" : 0,
\ "debug_file_level" : 0,
\ "debug_file" : "",
\ "watch_window_style" : 'expanded',
\ "marker_default" : '⬦',
\ "marker_closed_tree" : '▸',
\ "marker_open_tree" : '▾'
\}
let g:grep_path_custom="/http/skimium/sites/all"
filetype plugin on
set clipboard=unnamedplus,unnamed,autoselect
au BufLeave * let b:winview = winsaveview()
au BufRead * if(exists('b:winview')) | call winrestview(b:winview) | exe "normal! zz" | endif

"au WinEnter * let path = getcwd() | let netrwWinNum = bufwinnr('NetrwTreeListing') |
"\ if (netrwWinNum != -1) | let curbufnum = bufnr('%') | exe netrwWinNum . ' wincmd w'
"\ | let curwinnum = bufwinnr(curbufnum) | exe "e " . path | exe curwinnum . ' wincm w' | endif

"au BufRead * call AutoNetrwLocate()
"au WinEnter * call AutoNetrwLocate()
nmap <leader>a call AutoNetrwLocate()

" set log
"set verbosefile=~/.vimlog
"set verbose=2000

nmap <leader>a :call AutoNetrwLocate()<cr>
let g:zcaprg = '/usr/bin/zca'
let g:netrw_retmap = 0
let g:netrw_mousemaps = 0

