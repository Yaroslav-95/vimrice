
let mapleader =" "

" Check if vim-plug is installed, otherwise download and install
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
	silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
	\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/site/plugged')
	Plug 'junegunn/goyo.vim'
	Plug 'PotatoesMaster/i3-vim-syntax'
	Plug 'jreybert/vimagit'
	Plug 'tpope/vim-commentary'
	Plug 'junegunn/fzf'
	Plug 'preservim/nerdtree'
	Plug 'ervandew/supertab'
	Plug 'neomake/neomake'
	Plug 'jamessan/vim-gnupg'
	Plug 'majutsushi/tagbar'
	Plug 'rust-lang/rust.vim'
	Plug 'cespare/vim-toml'
	Plug 'pangloss/vim-javascript'
	Plug 'https://gitlab.com/HiPhish/info.vim'
	Plug 'neovim/nvim-lspconfig'
call plug#end()

" Some basics:
	set nocompatible
	filetype plugin on
	syntax on
	set foldmethod=syntax
	set omnifunc=syntaxcomplete#Complete
	set guicursor=n-v-sm:block,i-ci-c-ve:ver25,r-cr-o:block
	set cursorline
	set redrawtime=1000
	set relativenumber
	set scrolloff=5
	set colorcolumn=+1
	set textwidth=80
	set mouse=a
	set number

" Colors
	colorscheme ultramar
	let g:ultramar_italic=1
	if $COLORSCHEME == "light"
		set background=light
	endif
	set termguicolors
	function! ChangeBG()
		if &background == "light"
			set background=dark
			return
		endif
		set background=light
	endfunction
	map <F10> :call ChangeBG()<CR>

" Set screen title
	let &titlestring = "vim - " . expand("%:t")
	if &term == "screen"
		set t_ts=^[k
		set t_fs=^[\
	endif
	set title
	au BufEnter * let &titlestring = "vim - " . expand("%t")

" Functions for git branch name on statusline
	function! GitBranch()
	return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
	endfunction
	function! StatuslineGit()
	let l:branchname = GitBranch()
	return strlen(l:branchname) > 0?'   '.l:branchname.' ':''
	endfunction

" Statusline
	let laststatus=2
	set statusline=
	set statusline+=%#CursorLineNR#
	set statusline+=%{StatuslineGit()}
	set statusline+=%#StatusLine#
	set statusline+=%<
	set statusline+=\ %f%r%m
	set statusline+=%=
	set statusline+=\ %l:%v/%L
	set statusline+=\ 
	set statusline+=%#StatusLineNC#
	set statusline+=\ %Y
	set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
	set statusline+=\[%{&fileformat}\]
	set statusline+=\ 

" default indentation
	filetype plugin indent on
	set noexpandtab
	set copyindent
	set preserveindent
	set softtabstop=0
	set tabstop=4
	set shiftwidth=4

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
	set splitbelow
	set splitright

" To avoid switching between keyboards
	set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯХЪБЮ;ABCDEFGHIJKLMNOPQRSTUVWXYZ{}<>,фисвуапршолдьтщзйкыегмцчняхъэ;abcdefghijklmnopqrstuvwxyz[]'

" Toggle relative line numbers
	map <leader>e :set invrelativenumber<CR>
	map <leader>у :set invrelativenumber<CR>

" Shortcutting split navigation, saving a keypress:
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

" Open the selected text in a split (i.e. should be a file).
	map <leader>o "oyaW:sp <C-R>o<CR>
	xnoremap <leader>o "oy<esc>:sp <C-R>o<CR>
	vnoremap <leader>o "oy<esc>:sp <C-R>o<CR>

" Replace all is aliased to S.
	nnoremap S :%s//g<Left><Left>
	nnoremap Ы :%s//g<Left><Left>

" Compile document
	map <leader>c :!doccompiler <c-r>%<CR>
	map <leader>с :!doccompiler <c-r>%<CR>

" Spell-check set to F2:
	map <F2> :setlocal spell! spelllang=en_us,es,ru<CR>

" Save changes
	noremap <leader>s :update<CR>
	noremap <leader>ы :update<CR>

" Copy to clipboard
	vnoremap  <leader>y  "+y
	nnoremap  <leader>Y  "+yg_
	nnoremap  <leader>y  "+y
	nnoremap  <leader>yy  "+yy
" with russian layout
	vnoremap  <leader>н  "+y
	nnoremap  <leader>Н  "+yg_
	nnoremap  <leader>н  "+y
	nnoremap  <leader>нн  "+yy

" Paste from clipboard
	nnoremap <leader>p "+p
	nnoremap <leader>P "+P
	vnoremap <leader>p "+p
	vnoremap <leader>P "+P
" with russian layout
	nnoremap <leader>з "+p
	nnoremap <leader>З "+P
	vnoremap <leader>з "+p
	vnoremap <leader>З "+P

" Enable autocompletion:
	set wildmode=list:longest,full
	set wildmenu

" Automatically deletes all tralling whitespace on save.
	"autocmd BufWritePre * %s/\s\+$//e

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
	autocmd VimLeave *.tex !texclear %

" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" C-T for new tab
	nnoremap <C-t> :tabe<Space>

" Navigating with guides
	inoremap <leader><Tab> <Esc>/<++><Enter>"_c4l
	vnoremap <leader><Tab> <Esc>/<++><Enter>"_c4l
	map <leader><Tab> <Esc>/<++><Enter>"_c4l
	inoremap ;gui <++>
	inoremap жпгш <++>
	inoremap ñgui <++>

" Replace ex mode with gq
	map Q gq
" with russian layout
	map Й gq

" For normal mode when can't remap caps to escape
	inoremap jw <Esc>
	inoremap wj <Esc>

" SuperTab
	let g:SuperTabDefaultCompletionType = "context"
	let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"

" NERDTree
	map <leader>r :NERDTreeToggle<CR>
	map <leader>к :NERDTreeToggle<CR>

" FZF
	map <leader>f :FZF<CR>
	map <leader>а :FZF<CR>

" Open new terminal in current directory
	map <leader>t :!setsid $TERMINAL &<CR>
	map <leader>е :!setsid $TERMINAL &<CR>

" Tagbar
	map <F3> :TagbarToggle<CR>

" Goyo
	let g:goyo_width = 100
	map <leader>g :Goyo<CR>

" LSP
	set omnifunc=v:lua.vim.lsp.omnifunc
	lua require('lspconfig').clangd.setup{filetypes = { "c", "cpp", "objc", "objcpp", "ch" }}
	lua require('lspconfig').gopls.setup{}
	lua require('lspconfig').pylsp.setup{}
	lua require('lspconfig').rls.setup{}
	lua require('lspconfig').tsserver.setup{}

" LSP keybinds
	nmap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
	nmap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
	nmap <silent> gK <cmd>lua vim.lsp.buf.hover()<CR>
	nmap <silent> gz <cmd>lua vim.lsp.buf.references()<CR>
	nmap <silent> <leader>n <cmd>lua vim.lsp.buf.rename()<CR>
	nmap <silent> <leader>b <cmd>lua vim.lsp.buf.formatting()<CR>
	nmap <silent> <leader>a <cmd>lua vim.lsp.buf.code_action()<CR>
	nmap <silent> ]g <cmd>lua vim.diagnostic.goto_next()<CR>
	nmap <silent> [g <cmd>lua vim.diagnostic.goto_prev()<CR>

" File format preferences
	" MFing neovim overrding my omnifunc with whatever ccomplete is
	autocmd FileType c,ch,header,cpp setlocal omnifunc=v:lua.vim.lsp.omnifunc
	" No Rust, spaces is not superior to tabs, 100 lines is too much
	autocmd FileType rust setlocal noet ci pi sts=0 ts=4 sw=4 tw=80
	autocmd FileType meson setlocal noet ci pi sts=0 ts=4 sw=4 tw=80
	autocmd FileType tex setlocal spell spelllang=en_us,es,ru tw=80 |
				\ let b:SuperTabContextDefaultCompletionType = "<c-p>"
	autocmd FileType text setlocal spell spelllang=en_us,es,ru tw=80 |
				\ let b:SuperTabContextDefaultCompletionType = "<c-p>"
	autocmd FileType mail setlocal spell spelllang=en_us,es,ru tw=72 |
				\ let b:SuperTabContextDefaultCompletionType = "<c-p>"
	autocmd FileType markdown setlocal spell spelllang=en_us,es,ru tw=80 |
				\ let b:SuperTabContextDefaultCompletionType = "<c-p>"

" For project-specific configuration
	set exrc
	set secure
