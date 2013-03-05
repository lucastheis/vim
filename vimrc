" gui
if has("gui_running")
	set guioptions-=T
	set guioptions-=r
	set guioptions-=R
	set guioptions-=l
	set guioptions-=L
	set guioptions-=t
	set gfn=Menlo\ Regular:h12
	set columns=120
	au GUIEnter * win 120 40

	" syntax highlighting
	colorscheme Tomorrow-Night-Bright
else
	colorscheme ir_black
end

" settings
execute pathogen#infect()
syntax on
filetype plugin on
filetype indent on
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
set lcs=tab:››,trail:·
set nolist
set nocindent
set nocompatible
set nohls
set noswapfile
set nowrap
set number
set path=./**,../include/**,/usr/include/**,/opt/local/include/**
set ruler
set nospell
set shiftwidth=4
set smartcase
set tabstop=4
set textwidth=100

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

" highlight overlong lines
highlight rightMargin guifg=lightred

" commenting
au BufEnter,FileType *.h vn # :s/^/\/\//<CR>gv:s/^\/\/\/\/ \@!//<CR>
au BufEnter,FileType *.cpp vn # :s/^/\/\//<CR>gv:s/^\/\/\/\/ \@!//<CR>
au BufEnter,FileType *.py vn # :s/^/#/<CR>gv:s/^## \@!//<CR>
au BufEnter,FileType *.tex vn # :s/^/%/<CR>gv:s/^%% \@!//<CR>
au BufEnter,FileType *.m vn # :s/^/%/<CR>gv:s/^%% \@!//<CR>

" enable doxygen highlighting
au BufEnter,FileType *.cpp set syntax=cpp.doxygen
au BufEnter,FileType *.h set syntax=cpp.doxygen
