
let mapleader = ","

" Check if vim-plug is installed, otherwise download and install
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
	silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
	\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/site/plugged')
	Plug 'junegunn/goyo.vim'
	Plug 'PotatoesMaster/i3-vim-syntax'
	Plug 'tpope/vim-commentary'
	Plug 'junegunn/fzf'
	Plug 'junegunn/fzf.vim'
	Plug 'preservim/nerdtree'
	Plug 'ervandew/supertab'
	Plug 'jamessan/vim-gnupg'
	Plug 'majutsushi/tagbar'
	Plug 'rust-lang/rust.vim'
	Plug 'cespare/vim-toml'
	Plug 'pangloss/vim-javascript'
	Plug 'ap/vim-css-color'
	Plug 'https://gitlab.com/HiPhish/info.vim'
	Plug 'rhysd/git-messenger.vim'
	Plug 'tpope/vim-ragtag'
	Plug 'mmarchini/bpftrace.vim'
	Plug 'junkblocker/git-time-lapse'
	if has('nvim-0.6')
		Plug 'neovim/nvim-lspconfig'
		Plug 'ojroques/nvim-lspfuzzy'
	endif
	if has('nvim-0.9')
		Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	endif
call plug#end()

" Some basics:
	set nocompatible
	filetype plugin on
	syntax on
	set foldmethod=syntax
	set omnifunc=syntaxcomplete#Complete
	set completeopt=menuone,noinsert
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
	let g:ultramar_italic=1
	let g:ultramar_opaque_bg=0
	colorscheme ultramar
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
	let g:markdown_fenced_languages = ['c', 'go', 'sh', 'bash=sh', 'python', 'html', 'css', 'javascript']

" Set screen title
	set title
	" let &titlestring = "NVIM - " . expand("%:t")
	" if &term == "screen"
	" 	set t_ts=^[k
	" 	set t_fs=^[\
	" endif
	" au BufEnter * let &titlestring = "NVIM - " . expand("%t")

" Functions for git branch name on statusline
	function! GitBranch()
	return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
	endfunction
	function! StatuslineGit()
	let l:branchname = GitBranch()
	return strlen(l:branchname) > 0?'   '.l:branchname.' ':''
	endfunction

" git-messenger settings
	let g:git_messenger_floating_win_opts = { 'border': 'single' }
	let g:git_messenger_popup_content_margins = v:false
	hi! link diffAdded DiffAdd
	hi! link diffRemoved DiffDelete
	hi! link diffWordsAdded DiffText
	hi! link diffWordsRemoved DiffText

" Statusline
	let laststatus=2
	set statusline=
	set statusline+=%#SignColumn#
	set statusline+=%{StatuslineGit()}
	set statusline+=%#StatusLine#
	set statusline+=%<
	set statusline+=\ %f%r%m
	set statusline+=%=
	set statusline+=\ %l/%L,%c%V
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
	vnoremap  <leader>н  "+y
	nnoremap  <leader>Н  "+yg_
	nnoremap  <leader>н  "+y
	nnoremap  <leader>нн  "+yy

" Copy everything in the buffer to clipboard
	nnoremap <leader>ya :%y +<CR>
	nnoremap <leader>нф :%y +<CR>

" Paste from clipboard
	nnoremap <leader>p "+p
	nnoremap <leader>P "+P
	vnoremap <leader>p "+p
	vnoremap <leader>P "+P
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
	autocmd FileType * setlocal formatoptions-=o

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
	let g:fzf_preview_window = ['hidden,right,50%,<70(hidden,up,40%)', 'ctrl-\']
	map <leader>f :Files<CR>
	map <leader>а :Files<CR>
	map <leader>F :Rg 
	map <leader>А :Rg 

" Open new terminal in current directory
	map <leader>t :!setsid $TERMINAL &<CR>
	map <leader>е :!setsid $TERMINAL &<CR>

" Tagbar
	map <F3> :TagbarToggle<CR>

" Goyo
	let g:goyo_width = 100
	let g:goyo_linenr = 1
	map <leader>gg :Goyo<CR>

" Insert datetime
	map <leader>d :r!date +"\%Y-\%m-\%dT\%H:\%M:\%S"<CR>kJ
	map <leader>в :r!date +"\%Y-\%m-\%dT\%H:\%M:\%S"<CR>kJ

" Hack to open all folds in current scope recursively
	nmap <leader>z zCzO
	nmap <leader>я zCzO

" LSP
	if has('nvim-0.6')
		set omnifunc=v:lua.vim.lsp.omnifunc
		lua require('lspconfig').clangd.setup{filetypes = { "c", "cpp", "objc", "objcpp", "ch" }}
		lua require('lspconfig').gopls.setup{}
		lua require('lspconfig').pylsp.setup{}
		lua require('lspconfig').rls.setup{}
		lua require('lspconfig').quick_lint_js.setup{}
		lua require('lspfuzzy').setup{}
	endif

" LSP keybinds
	nmap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
	nmap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
	nmap <silent> gK <cmd>lua vim.lsp.buf.hover()<CR>
	nmap <silent> gz <cmd>lua vim.lsp.buf.references()<CR>
	nmap <silent> <leader>n <cmd>lua vim.lsp.buf.rename()<CR>
	nmap <silent> <leader>b <cmd>lua vim.lsp.buf.format()<CR>
	nmap <silent> <leader>a <cmd>lua vim.lsp.buf.code_action()<CR>
	nmap <silent> <leader>qw <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
	nmap <silent> <leader>qd <cmd>lua vim.lsp.buf.document_symbol()<CR>
	nmap <silent> <leader>l <cmd>lua vim.diagnostic.setloclist()<CR>
	nmap <silent> ]g <cmd>lua vim.diagnostic.goto_next()<CR>
	nmap <silent> [g <cmd>lua vim.diagnostic.goto_prev()<CR>

" Treesitter
	if has('nvim-0.9')
		" XXX: neovim's built-in C et al treesitter parsers are better, although
		" not ideal either.
		lua require('nvim-treesitter.configs').setup{ ensure_installed = {  "go", "rust", "python", "lua", "comment" }, highlight = { enable = true, disable = { "c", "cpp", "vim", "make" } }}
		set foldmethod=expr
		set foldexpr=nvim_treesitter#foldexpr()
	endif

" Termdebugger keybinds
	nmap <silent> <leader>gn <cmd>:Over<CR>
	nmap <silent> <leader>gs <cmd>:Step<CR>
	nmap <silent> <leader>gc <cmd>:Continue<CR>
	nmap <silent> <leader>gu <cmd>:Until<CR>
	nmap <silent> <leader>gb <cmd>:Break<CR>
	nmap <silent> <leader>gC <cmd>:Clear<CR>

" File format preferences
	" MFing neovim overrding my omnifunc with whatever ccomplete is
	autocmd FileType c,ch,header,cpp setlocal omnifunc=v:lua.vim.lsp.omnifunc fdm=syntax
	" No, Rust, spaces is not superior to tabs, 100 lines is too much
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

" C indentation rules
	set cino=:0l1

" For project-specific configuration
	set exrc
	set secure
