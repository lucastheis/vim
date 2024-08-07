" plugins
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'SirVer/ultisnips'
Plugin 'VundleVim/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'godlygeek/tabular'
Plugin 'honza/vim-snippets'
Plugin 'mdomke/python-syntax'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'ryanoasis/vim-devicons'
Plugin 'vim-airline/vim-airline'
Plugin 'ycm-core/YouCompleteMe'
call vundle#end()
filetype plugin indent on

" gui
if has("gui_running")
	set guioptions=egm
	set guifont=JetBrainsMonoNLNFM-Regular:h14  " https://github.com/ryanoasis/nerd-fonts/releases
	set columns=120
	au GUIEnter * win 120 40

	" syntax highlighting
	colorscheme jellybeans
	hi VertSplit guibg=bg guifg=gray15
	set fillchars=vert:\│
else
	colorscheme ir_black
end

" settings
syntax on
set antialias
set autoindent
set backspace=2
set backupdir=/tmp
set cursorline
set directory=/tmp
set completeopt=longest,menuone
set complete=.,w,b,u,t
set copyindent
set encoding=utf-8
set fileencoding=utf-8
set foldmethod=manual
set formatoptions+=a
set ignorecase
set incsearch
set lcs=tab:››,trail:·
set list
set nocindent
set nocompatible
set noexpandtab
set nohls
set noswapfile
set nowrap
set number
set path=./**,../include/**,/usr/include/**,/opt/local/include/**
set ruler
set nospell
set shell=/bin/zsh
set shiftwidth=4
set smartcase
set tabstop=4
set softtabstop=4
set textwidth=100

" python (ftplugin, python-syntax)
if !exists('g:python_indent')
	let g:python_indent = {}
endif
let g:python_indent.closed_paren_align_last_line = v:false
let g:pyindent_open_paren = 'shiftwidth()'
let g:python_recommended_style = 1
let g:python_highlight_operators = 1
let g:python_highlight_class_vars = 1
let g:python_highlight_operators = 1
let g:python_highlight_builtin_objs = 1
au FileType python setlocal expandtab

" mappings
vm < <gv
vm > >gv
nm < v<gv<Esc>
nm > v>gv<Esc>
cm <C-j> <Esc>
im <C-j> <Esc>
no H ^
no L $
no K 3k
no J 3j
no D J
no cc :w<CR>:make<CR>
no gf <C-W>gf
no + /{<CR>Nv%zf
no <S-m> :cp<CR>
no <C-m> :cw<CR>
no \q :set hlsearch!<CR>
no \g :GitGutterToggle<CR>
no <C-n> :NERDTreeToggle<CR>
no mT :-tabmove<CR>
no mt :+tabmove<CR>

" highlight overlong lines
highlight rightMargin guifg=lightred

" UltiSnips
let g:UltiSnipsExpandTrigger="<C-CR>"

" GitGutter
hi clear SignColumn
autocmd BufWritePost * GitGutter
hi GitGutterAdd ctermfg=2 guifg=green
hi GitGutterChange ctermfg=3 guifg=yellow
hi GitGutterDelete ctermfg=1 guifg=red
hi GitGutterChangeDelete ctermfg=4 guifg=yellow

" YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'

" vim-airline
let g:airline_powerline_fonts = 1

" commenting
au BufEnter,FileType *.h vn # :s/^/\/\//<CR>gv:s/^\/\/\/\/ \@!//<CR>
au BufEnter,FileType *.cpp vn # :s/^/\/\//<CR>gv:s/^\/\/\/\/ \@!//<CR>
au BufEnter,FileType *.hpp vn # :s/^/\/\//<CR>gv:s/^\/\/\/\/ \@!//<CR>
au BufEnter,FileType *.css vn # :s/^/\/\//<CR>gv:s/^\/\/\/\/ \@!//<CR>
au BufEnter,FileType *.py vn # :s/^/#/<CR>gv:s/^## \@!//<CR>
au BufEnter,FileType *.sh vn # :s/^/#/<CR>gv:s/^## \@!//<CR>
au BufEnter,FileType *.yaml vn # :s/^/#/<CR>gv:s/^## \@!//<CR>
au BufEnter,FileType *.tex vn # :s/^/%/<CR>gv:s/^%% \@!//<CR>
au BufEnter,FileType *.m vn # :s/^/%/<CR>gv:s/^%% \@!//<CR>
au BufEnter,FileType *.html vn # :s/^\(\s*\)\(.*\)$/\1<!--\2-->/<CR>:s/<!--<!--//<CR>:s/-->-->/<CR>
au BufEnter,FileType *.vimrc vn # :s/^/"/<CR>gv:s/^"" \@!//<CR>

" enable doxygen syntax highlighting
au BufEnter,FileType *.cpp set syntax=cpp.doxygen
au BufEnter,FileType *.h set syntax=cpp.doxygen

" enable protobuf syntax highlighting
au BufEnter,FileType *.prototxt set syntax=proto
