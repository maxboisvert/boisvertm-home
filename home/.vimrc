call plug#begin()
Plug $VIM_DEV . 'maxboisvert/vim-simple-complete'
Plug $VIM_DEV . 'maxboisvert/vim-simple-files'
Plug 'fatih/vim-go'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
call plug#end()

augroup vimrc
    autocmd!
    autocmd BufNewFile,BufRead Gemfile,Guardfile set filetype=ruby
    autocmd ColorScheme * hi LineNr ctermfg=darkgray | hi CursorLine cterm=NONE ctermbg=237
    autocmd FileType "go" setl noexpandtab
    autocmd FileType "java,python,vim,sh,go,typescript" setl shiftwidth=4 softtabstop=4 tabstop=4
augroup END

runtime! plugin/sensible.vim

" Options
colorscheme default
let g:is_bash = 1
let g:mapleader = ' '
let &grepprg="git grep -n"

set background=dark
set breakindent linebreak wrap
set clipboard^=unnamedplus,unnamed
set cursorline
set hidden
set ignorecase smartcase
set laststatus=1
set list listchars=tab:\ \ ,trail:·
set mouse=a
set number
set shiftwidth=2 softtabstop=2 tabstop=2 expandtab

" Mappings
noremap ; :
nnoremap <Backspace> <C-O>
nnoremap <Leader>g :GoDef<CR>
inoremap {<CR> {<CR>}<ESC>O
nnoremap <silent> <Leader>f :call SimpleFiles()<CR>
nnoremap <Leader>[ :let @+ = expand("%")<CR>

nnoremap j gj
nnoremap k gk

nnoremap <Down> :cclose<CR>
nnoremap <Left> :cp<CR>
nnoremap <Right> :cn<CR>
nnoremap <Up> :copen<CR>
