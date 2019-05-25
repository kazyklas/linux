"#############################
"# Creator: Tomas Klas
"# Date: 2019-03-01
"# Contact: tomas.klas@datamole.cz
"#############################

" Number of lines
set number

" Tab size
set tabstop=3

" Finding files 
set path+=**

" Syntax enable
syntax enable
set nocompatible
filetype plugin indent on

" Plugins 
execute pathogen#infect()
map <C-o> :NERDTreeToggle<CR>
set laststatus=2


" Python
au BufEnter,BufRead *.py setlocal smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

" C++ comments
set comments=sl:/*,mb:\ *,elx:\ */

" Doxygen comments
let g:DoxygenToolkit_authorName="John Doe <john@doe.com>"

" nice line 
set cursorline

" auto complete twin symbols
inoremap ( ()<Esc>:let leavechar=")"<CR>i
inoremap [ []<Esc>:let leavechar="]"<CR>i
inoremap { {}<Esc>:let leavechar="}"<CR>i
inoremap " ""<Esc>:let leavechar="""<CR>i
inoremap ' ''<Esc>:let leavechar="'"<CR>i


" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

" smart TAB
set smarttab		"smart tab
set autoindent			"set auto indent
set smartindent			"set smart indent

