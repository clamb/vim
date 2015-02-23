" URL: http://vim.wikia.com/wiki/Example_vimrc
" Authors: http://vim.wikia.com/wiki/Vim_on_Freenode
" Description: A minimal, but feature rich, example .vimrc. If you are a
"              newbie, basing your first .vimrc on this file is a good choice.
"              If you're a more advanced user, building your own .vimrc based
"              on this file is still a good idea.

"------------------------------------------------------------
" Features {{{1
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Use the , as the leader since it is readily available in both fr_CH and
" en_US keyboard
let mapleader=" "

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
" filetype indent plugin on
filetype off " required by Vundle

" Setting up Vundle - the vim plugin handler
let iCanHazVundle = 1
let vundle_readme = expand('~/vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
  echo "Installing Vundle..."
  echo ""
  silent !mkdir -p ~/vim/bundle
  silent !git clone https://github.com/gmarik/vundle ~/vim/bundle/vundle
  let iCanHazVundle = 0
endif

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" let Vundle manage Vundle, required
Bundle 'gmarik/vundle'
Bundle 'Syntastic'
Bundle 'altercation/vim-colors-solarized'

" Plugins
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-surround'
Plugin 'bling/vim-airline'
Plugin 'SirVer/ultisnips'
Plugin 'edsono/vim-matchit'
Plugin 'honza/vim-snippets'
Plugin 'justinmk/vim-sneak'
Plugin 'kien/ctrlp.vim'
Plugin 'sjl/gundo.vim'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'rstacruz/sparkup'
Plugin 'godlygeek/tabular'
Plugin 'majutsushi/tagbar'

" Color schemes
Plugin 'tomasr/molokai'
Plugin 'flazz/vim-colorschemes'
Plugin 'morhetz/gruvbox'

Bundle "L9"
Bundle "FuzzyFinder"

Bundle "ack.vim"

if iCanHazVundle == 0
  echo "Installing Bundles, please ignore key map error messages"
  echo ""
  :BundleInstall
endif

" Setting up Vundle - the vim plugin bundler end

noremap <Leader>ç "ayiw:Ack <C-r>a<CR>
vnoremap <Leader>ç "ay:Ack <C-r>a<CR>


filetype plugin indent on " required


" Enable syntax highlighting
syntax on


"------------------------------------------------------------
" Must have options {{{1
"
" These are highly recommended options.

" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
set hidden

" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window as mentioned above, and/or either of the following options:
" set confirm
" set autowriteall

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline


"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent
set cindent
set cinoptions=:s,ps,ts,cs
set cinwords=if,else,while,do,for,foreach,switch,case

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Display line numbers on the left
set number
set relativenumber

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>


"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation settings according to personal preference.

" Indentation settings for using 2 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=2
set softtabstop=2
set expandtab

" Indentation settings for using hard tabs for indent. Display tabs as
" two characters wide.
"set shiftwidth=2
"set tabstop=2


"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>


"------------------------------------------------------------
colorscheme gruvbox

" Syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_php_checkers = ['php']

nmap <F8> :TagbarToggle<CR>
set background=dark

" Specific options
set incsearch
set nowritebackup
set nobackup
set modeline
set modelines=5

set fo+=o " Automatically insert the current comment leader after hitting 'o' or 'O' in Normal mode.
set fo-=r " Do not automatically insert a comment leader after an enter
set fo-=t " Do no auto-wrap text using textwidth (does not apply to comments)

set showmatch
set matchtime=5

set showcmd
set shortmess=atI

" Command and Auto commands
" Sudo write
comm! W exec 'w !sudo tee % > /dev/null' | e!

au BufRead,BufNewFile {Gemfile,Rakefile,Capfile,*.rake,config.ru} set ft=ruby
au BufRead,BufNewFile {*.md,*.mkd,*.markdown}                     set ft=markdown
au BufRead,BufNewFile {COMMIT_EDITMSG}                            set ft=gitcommit

" Restore position in file
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | execute "normal g'\"" | endif

" Edit vimrc
nnoremap <silent> <Leader>rs :source ~/.vimrc<CR>
nnoremap <silent> <Leader>rt :tabnew ~/.vimrc<CR>
nnoremap <silent> <Leader>re :e ~/.vimrc<CR>

map <S-CR> A<CR><ESC>
inoremap <S-CR> <ESC>A<CR>

map <silent> <Leader>2h :runtime! syntax/2html.vim<CR>

set guioptions-=T
set guioptions+=c

" This is for fuzzyfinder
let g:fuf_modesDisable = []
nnoremap <silent> <Leader>h :FufHelp<CR>
nnoremap <silent> <Leader>2 :FufFileWithCurrentBufferDir<CR>
nnoremap <silent> <Leader>@ :FufFile<CR>
nnoremap <silent> <Leader>3 :FufBuffer<CR>
nnoremap <silent> <Leader>4 :FufDirWithCurrentBufferDir<CR>
nnoremap <silent> <Leader>$ :FufDir<CR>
nnoremap <silent> <Leader>5 :FufChangeList<CR>
nnoremap <silent> <Leader>6 :FufMruFile<CR>
nnoremap <silent> <Leader>7 :FufLine<CR>
nnoremap <silent> <Leader>8 :FufBookmark<CR>
nnoremap <silent> <Leader>* :FuzzyFinderAddBookmark<CR><CR>
nnoremap <silent> <Leader>9 :FufTaggedFile<CR>
