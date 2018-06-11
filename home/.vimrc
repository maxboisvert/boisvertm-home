call plug#begin()
Plug $VIM_DEV . 'maxboisvert/vim-simple-complete'
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'fatih/vim-go'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
Plug 'vim-scripts/gitignore'
call plug#end()

augroup vimrc | autocmd! | augroup END
autocmd vimrc BufEnter * if (winnr("$") == 1 && &buftype != "") | q | endif
autocmd vimrc BufNewFile,BufRead Gemfile,Guardfile set filetype=ruby
autocmd vimrc BufReadPost * silent! normal! g`"
autocmd vimrc ColorScheme * hi LineNr ctermfg=darkgray | hi CursorLine cterm=NONE ctermbg=237
autocmd vimrc FileType "go" setl noexpandtab
autocmd vimrc FileType "java,python,vim,sh,go,typescript" setl shiftwidth=4 softtabstop=4 tabstop=4
if !len(argv())
    set viminfo+=n.vim-viminfo-local
    autocmd vimrc VimEnter * nested silent! e #<1
endif

runtime! plugin/sensible.vim

" options
colorscheme default
let g:is_bash = 1
let g:mapleader = ' '

" indent/wrap
set expandtab
set shiftwidth=2 softtabstop=2 tabstop=2
set breakindent linebreak wrap

" ui
set background=dark
set number
set cursorline
set mouse=a
set laststatus=1
set grepprg=ag\ --vimgrep
set list listchars=tab:\ \ ,trail:·

" state
set clipboard^=unnamedplus,unnamed
set hidden

" Mappings
noremap ; :
nnoremap <Backspace> <C-O>
nnoremap <Leader>\ :NERDTreeToggle<CR>
nnoremap <Leader>g :GoDef<CR>

nnoremap j gj
nnoremap k gk

nnoremap <Down> :cclose<CR>
nnoremap <Left> :cp<CR>
nnoremap <Right> :cn<CR>
nnoremap <Up> :copen<CR>

nnoremap <Leader>/ :BLines<CR>
nnoremap <Leader>a :Find<CR>
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>h :History<CR>

" Commands
command CopyFilename let @+ = expand("%")
command! -bang -nargs=* Find call fzf#vim#ag(<q-args>, $AG_IGNORE, <bang>0)
