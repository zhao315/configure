call plug#begin('~/.config/nvim/plugged')

Plug 'preservim/nerdtree'

Plug 'itchyny/lightline.vim'

Plug 'preservim/nerdcommenter'

Plug 'Yggdroot/indentLine'  

Plug 'jiangmiao/auto-pairs'

Plug 'tpope/vim-surround'

Plug 'terryma/vim-multiple-cursors'

Plug 'machakann/vim-highlightedyank'

Plug 'tweekmonster/impsort.vim' 

Plug 'majutsushi/tagbar'

Plug 'lervag/vimtex', {'for': ['tex']}

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi'

Plug 'davidhalter/jedi-vim'

Plug 'neomake/neomake'

Plug 'tmhedberg/SimpylFold'

Plug 'ervandew/supertab'

Plug 'lifepillar/vim-solarized8'
" Initialize plugin system
call plug#end()



" <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
" mapping <<<
let g:mapleader=','

inoremap jk <ESC>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

nnoremap <leader><space> :noh<CR>

inoremap <F10> <Nop>
" >>>

" setting <<<
syntax on
set wildmenu
set wildmode=list:longest,full
set hidden

set ignorecase
set incsearch
set smartcase
set scrolloff=5

set number
augroup relative_number
	autocmd!
	autocmd InsertEnter * : set norelativenumber
	autocmd InsertLeave * : set relativenumber
augroup END
set relativenumber

set cursorline
set hlsearch

set termguicolors

au BufNewFile,BufRead *.py
			\ set tabstop=4 |
			\ set softtabstop=4 |
			\ set shiftwidth=4 |
			\ set textwidth=79 |
			\ set expandtab |
			\ set autoindent |
			\ set fileformat=unix
let python_highlight_all = 1
" >>> 

" compiler <<<
" C++ compiler 
nnoremap <F5> <Esc>:w<CR>:!g++ -std=c++11 % -o /tmp/a.out && /tmp/a.out<CR>

" Python compiler
" map <F6> :call PRUN()<CR>
inoremap <F6> <Nop>
nnoremap <F6> :call PRUN()<CR>
func! PRUN()
	exec "w"
	if &filetype == 'python'
		exec "!time python3 %"
	endif
endfunc
" >>>

" Latex <<<
" setlocal spell spelllang=en_us
setlocal spelllang=en_us
autocmd BufNewFile,BufRead *.tex setlocal spell
autocmd BufNewFile,BufRead *.tex setlocal textwidth=80
let g:tex_indent_items=0
nnoremap <silent> <F9> :set spell!<cr>
" inoremap <silent> <F9> <C-0>:set spell!<cr>
"
" >>>
" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>



" <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
" nerdtree <<<
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" >>>

" lightline <<<
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
" >>>

" nerdcommenter <<<
map <F2> <leader>ci
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1
" >>>

" indentLine <<<
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
" >>>

" vim-multiple-cursors <<<
let g:multi_cursor_use_default_mapping=0
" 
let g:multi_cursor_start_word_key      = '<C-m>'
let g:multi_cursor_select_all_word_key = '<A-m>'
let g:multi_cursor_next_key            = '<C-m>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

func! Multiple_cursors_before()
      if deoplete#is_enabled()
        call deoplete#disable()
        let g:deoplete_is_enable_before_multi_cursors = 1
      else
        let g:deoplete_is_enable_before_multi_cursors = 0
      endif
    endfunc
    func! Multiple_cursors_after()
      if g:deoplete_is_enable_before_multi_cursors
        call deoplete#enable()
      endif
    endfunc
" >>>

" vim-highlightedyank <<<
let g:highlightedyank_highlight_duration = -1
" >>>

" impsort.vim <<<
autocmd BufWritePre *.py ImpSort!
" >>>

" tagbar <<<
nmap <F3> :TagbarToggle<CR>
" >>>

" deoplete.nvim <<<
let g:deoplete#enable_at_startup = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
set splitright
inoremap <expr><tab> pumvisible() ? "\<C-n>" : "\<tab>"
" >>>

" deoplete-jedi <<<
let g:deoplete#sources#jedi#enable_typeinfo=0
let g:deoplete#sources#jedi#show_docstring=0
" >>>

" ultisnips <<<
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" >>>

" jedi-vim <<<
let g:jedi#completions_enabled = 0
let g:jedi#use_splits_not_buffers = 'right'
" >>>

" neomake <<<
let g:neomake_python_enabled_makers = ['pylint']
map <F4> :Neomake<CR>
" >>>

" SimpylFold <<<
set foldmethod=syntax
set foldlevel=20
nnoremap <space> za
" nnoremap <A-space> zR
" >>>

" supertab <<<
let g:SuperTabDefaultCompletionType = "<c-n>"
" let g:SuperTabContextDefaultCompletionType = "<c-n>"
" >>>

" sonokai <<<
if (has("termguicolors"))
  set termguicolors
endif

" Theme
set background=dark
highlight Comment cterm=italic
colorscheme solarized8_flat
" >>>
" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

