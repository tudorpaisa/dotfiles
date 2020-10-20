call plug#begin('~/.config/nvim/plugged')
    Plug 'chriskempson/base16-vim'

    Plug 'scrooloose/nerdtree'
    Plug 'scrooloose/nerdcommenter'
    Plug 'tpope/vim-surround'

    Plug 'jalvesaq/Nvim-R', { 'for': 'R' }
    "Plug 'lervag/vimtex'
    Plug 'derekwyatt/vim-scala'
    Plug 'OmniSharp/omnisharp-vim'

    Plug 'vim-pandoc/vim-pandoc'
    Plug 'vim-pandoc/vim-pandoc-syntax' 
    Plug 'vimwiki/vimwiki'
    Plug 'iamcco/mathjax-support-for-mkdp'
    Plug 'iamcco/markdown-preview.vim'

    Plug 'google/vim-maktaba'
    Plug 'google/vim-codefmt'
    Plug 'google/vim-glaive'

    Plug 'leafgarland/typescript-vim'
    Plug 'peitalin/vim-jsx-typescript'

    "Plug 'w0rp/ale'

    Plug 'majutsushi/tagbar'

    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

    "Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
    
    "Plug 'xavierd/clang_complete'
    "Plug 'zchee/deoplete-jedi', { 'do': 'pip3 install --user -U jedi pynvim' }
    "Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

    "Plug 'autozimu/LanguageClient-neovim', {
    "    \ 'branch': 'next',
    "    \ 'do': 'bash install.sh',
    "    \ }

    Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

"" General
    set encoding=utf8
    set number                          " Show line numbers
    set linebreak                       " Break lines at word (needs Wrap lines)

    set showmatch                       " Highlight matching brace
    set nospell                         " Enable spell-checking
    set visualbell                      " Use visual bell (no beeping)
     
    set hlsearch                        " Highlight all search results
    set smartcase                       " Enable smart-case search
    set ignorecase                      " Always case-insensitive
    set incsearch                       " Searches for strings incrementally
     
    set autoindent                      " Auto-indent new lines
    set expandtab                       " Use spaces instead of tabs
    set shiftwidth=4                    " Number of auto-indent spaces
    set smartindent                     " Enable smart-indent
    set smarttab                        " Enable smart-tabs
    set softtabstop=4                   " Number of spaces per Tab

    set previewheight=10                " Set preview/scratch height
    "set previewwindow

    " Enable folding
    set foldmethod=indent
    set foldlevel=99
     
    set ruler                           " Show row and column ruler information
    set backspace=indent,eol,start      " Backspace behaviour

    filetype plugin on                  " Enable filetype plugins
    filetype indent on                  " Enable filetype indent

    set autoread
    set hidden

    au InsertLeave * set nopaste        " Workaround for disabling Paste mode

"""---KEY MAPPING---"""
    nnoremap <C-P> :Files<CR>
    nnoremap <C-T> :tabnew<CR>
    " Switch to the next tab
    nnoremap <Tab> :tabnext<CR>

    imap ;cn [CITATION NEEDED]

    " Autocomplete parentheses
    "inoremap " ""<left>
    "inoremap ' ''<left>
    "inoremap ( ()<left>
    "inoremap [ []<left>
    "inoremap { {}<left>

    nnoremap <C-H> <C-W><C-H>
    nnoremap <C-J> <C-W><C-J>
    nnoremap <C-K> <C-W><C-K>
    nnoremap <C-L> <C-W><C-L>

    " Remap ESC to :noh _AFTER_ vim has started
    autocmd VimEnter * nnoremap <Esc> :noh<CR>

"""---COMMANDS---"""
    " Rpdf      -> Read PDF files in vim buffer
    command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> - |fmt -csw78

    " Source ~/.Xresources when edited
    autocmd BufWritePost ~/.Xresources !xrdb ~/.Xresources

"""---THEMING---"""
    syntax enable
    if has('nvim')
        " https://github.com/neovim/neovim/wiki/FAQ
        set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
    endif
    set t_Co=16
    hi Search cterm=NONE ctermfg=black ctermbg=darkgrey
    hi Visual ctermfg=black ctermbg=darkgrey cterm=none

    " On Arch I used $XDG_CURRENT_DESKTOP
    let desktopenv = system('printf "%s" "$XDG_SESSION_DESKTOP"')

    colorscheme base16-default-dark

    " "Set background to 'transparent'
    hi Normal guibg=NONE ctermbg=NONE

    if desktopenv == 'KDE'
        set termguicolors
        colorscheme base16-porple
    endif

    " "Make the spellchecker more bearable
    hi clear SpellBad
    hi SpellBad cterm=underline

"""---DICTIONARY---"""
    " For dictionary completion
    " $ sudo pacman -S words
    set dictionary+=/usr/share/dict/british-english

"---THESAURUS---"
    let g:tq_language=['en']
    let g:tq_enabled_backends=['thesaurus_com', 'openoffice_en', 'mthesaur_txt']
    let g:tq_mthesaur_file='~/.config/nvim/thesaurus/mthesaur.txt'
    let g:tq_map_keys=0
    nnoremap <unique> <Leader>ts :ThesaurusQueryReplaceCurrentWord<CR>
    vnoremap <unique> <Leader>ts "ky:ThesaurusQueryReplace <C-r>k<CR>
    nnoremap <LocalLeader>ts :ThesaurusQueryReplaceCurrentWord<CR>
    vnoremap <LocalLeader>ts "ky:ThesaurusQueryReplace <C-r>k<CR>

"""---WINDOWS/BUFFERS---"""

    " If you prefer the Omni-Completion tip window to close when a selection is
    " made, these lines close it on movement in insert mode or when leaving
    " insert mode

    "autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
    "autocmd InsertLeave * if pumvisible() == 0|pclose|endif

    " Better alternative
    "autocmd CompleteDone * pclose

    " Switch completion with tab
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"

    "" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

"""---FILE TYPES---"""

"---C++---"
    autocmd FileType cpp nnoremap <leader>m :exec '!clang++' shellescape(@%, 1)<CR> :exec '!./a.out' <CR>

"---C#---"
    "let g:OmniSharp_serve_use_mono = 1
    let g:OmniSharp_server_stdio = 1

"---HTML & Friends---"
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd FileType js setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd FileType vue setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd FileType ts setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd FileType jsx setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd FileType tsx setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab

"---Python---"
    "let s:python_version = 3
    "autocmd filetype python set omnifunc=python3complete#Complete
    let g:python3_host_prog = '/usr/bin/python'

    autocmd FileType python nnoremap <buffer> <F6> :exec '!python' shellescape(@%, 1)<cr>

"--SCALA--"
    " Set filetype for scala
    au BufRead,BufNewFile *.sbt set filetype=scala

"--MARKDOWN--"

    autocmd FileType markdown nnoremap <leader>m :call jobstart('pandoc -s '.expand('%').' -o '.expand('%:t:r').'.pdf')<CR><CR>
    autocmd FileType markdown nnoremap <leader>o :call jobstart('xdg-open '.expand('%:t:r').'.pdf')<CR><CR>
    ":exec '!xdg-open' expand('%:t:r').'.pdf'<CR>
    "autocmd FileType markdown nnoremap <leader>M :exec '!pandoc -o' substitute(shellescape(@%, 1), '\.md', '\.pdf', '') shellescape(@%,1)<CR> :exec '!xdg-open' substitute(shellescape(@%, 1), '\.md', '\.pdf', '')<CR>

    " path to the chrome or the command to open chrome(or other modern browsers)
    " if set, g:mkdp_browserfunc would be ignored
    let g:mkdp_path_to_chrome = ""

    " callback vim function to open browser, the only param is the url to open
    let g:mkdp_browserfunc = 'MKDP_browserfunc_default'

    " set to 1, the vim will open the preview window once enter the markdown
    " buffer
    let g:mkdp_auto_start = 0

    " set to 1, the vim will auto open preview window when you edit the
    " markdown file
    let g:mkdp_auto_open = 0

    " set to 1, the vim will auto close current preview window when change
    " from markdown buffer to another buffer
    let g:mkdp_auto_close = 1

    " set to 1, the vim will just refresh markdown when save the buffer or
    " leave from insert mode, default 0 is auto refresh markdown as you edit or
    " move the cursor
    let g:mkdp_refresh_slow = 0

    " set to 1, the MarkdownPreview command can be use for all files,
    " by default it just can be use in markdown file
    let g:mkdp_command_for_global = 0

    " set to 1, preview server available to others in your network
    " by default, the server only listens on localhost (127.0.0.1)
    let g:mkdp_open_to_the_world = 0

    let g:pandoc#syntax#conceal#use = 1
    let g:pandoc#syntax#conceal#blacklist = ['inlinecode']
    let g:pandoc#spell#enabled = 1

    " Markdowns are markdowns. Let's make sure we are on the same page
    autocmd BufEnter,BufRead,BufNewFile *.md set filetype=markdown

"""---PLUGINS---"""

"---VimWiki---"
    "let g:vimwiki_ext2syntax = {'.md' : 'markdown',
                               "\ '.markdown': 'markdown',
                               "\ '.mdown': 'markdown'}
    let g:vimwiki_list = [{'ext': '.md',
			 \ 'syntax': 'markdown',
                         \ 'path': '~/notes/'
                         \ }]

    " Disable vimwiki's table mappings to preserve <TAB> completion
    let g:vimwiki_table_mappings = 0

    au FileType vimwiki set syntax=pandoc
    au FileType markdown set syntax=pandoc
    nmap <Leader>wn <Plug>VimwikiNextLink
    nmap <Leader>wp <Plug>VimwikiPrevLink

"---Conquer of Completion---"
    inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
    set statusline^=%{coc#status()}
    set keywordprg=:call\ <SID>show_documentation()

    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      else
        call CocAction('doHover')
      endif
    endfunction

    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

    "Command to use as 'keywordprg' when coc.nvim
    "is in use for a filetype
    command! -nargs=* CocKp call CocAction('doHover')

"---Deoplete---"
    "" Enable deoplete at startup
    "let g:deoplete#enable_at_startup = 1

    ""let g:deoplete#enable_ignore_case = 1
    ""let g:deoplete#enable_smart_case = 1

    "" Delimiters
    "let g:deoplete#delimiters = ['/', '.', '::', ':', '#', '->']

    "let g:deoplete#auto_complete_start_length = 1
    "let g:deoplete#auto_complete_delay = 0
    "let g:deoplete#max_list = 50

    ""Let only markdown files to have dictionaries
    "call deoplete#custom#option('ignore_sources', {'python': ['dictionary']})

    "call deoplete#custom#option(
    "            \ 'sources', {
    "                \ 'markdown': ['buffer', 'dictionary'],
    "                \ 'text': ['buffer', 'dictionary'],
    "                \ })

    "" VimTex Autocomplete
    "call deoplete#custom#var('omni', 'input_patterns', {
    "      \ 'tex': g:vimtex#re#deoplete
    "      \})

    "call deoplete#custom#source('_',  'max_menu_width', 0)
    "call deoplete#custom#source('_',  'max_abbr_width', 0)
    "call deoplete#custom#source('_',  'max_kind_width', 0)

    ""call deoplete#custom#source('dictionary', 'matchers', ['matcher_full_fuzzy'])
    "" If dictionary is already sorted, no need to sort it again.
    ""call deoplete#custom#source('dictionary', 'sorters', [])
    "" Do not complete too short words
    ""call deoplete#custom#source('dictionary', 'min_pattern_length', 2)

    "let g:deoplete#sources#jedi#ignore_errors = v:true
    "set conceallevel=0
    "let g:tex_conceal=''

"___Language Server Protocol___"
    let g:LanguageClient_serverCommands = {
        \ 'python': ['/usr/bin/pyls'],
        \ 'cpp': ['/usr/bin/ccls'],
        \ }
    let g:LanguageClient_hasSnippetSupport = 0
    let g:LanguageClient_useVirtualText = 0
    let g:LanguageClient_settingsPath = '/home/spacewhisky/.config/nvim/settings.json'

"---ALE---"
    let g:ale_linters = {
    \   'python': ['pylint', 'flake8'],
    \   'cs': ['OmniSharp']
    \}

"---YouCompleteMe---"
    let g:ycm_global_ycm_extra_conf = '~/.config/nvim/ycm/.ycm_extra_conf.py'
    let g:ycm_filetype_whitelist = {
        \"python": 1, "cpp":1, "tex":1, "text":1, "markdown":1,
        \}
    let g:ycm_path_to_python_interpreter = '/usr/bin/python'
    let g:ycm_filetype_blacklist = {}
    let g:ycm_autoclose_preview_window_after_completion=0
    autocmd filetype python set omnifunc=python3complete#Complete
    autocmd filetype python set completefunc=python3complete#Complete

    set tags+=/home/spacewhisky/cruft/tags
    let g:ycm_collect_identifiers_from_tags_files = 1

    if !exists('g:ycm_semantic_triggers')
        let g:ycm_semantic_triggers = {}
    endif
    "au VimEnter * let g:ycm_semantic_triggers.tex=g:vimtex#re#youcompleteme




"--NERDTree--"
    map <C-n> :NERDTreeToggle<CR>

"---NERDcommenter---"
    let g:NERDCompactSexyComs = 0
    let g:NERDDefaultAlign = 'left'

"---VimTex---"
    let g:vimtex_compiler_latexmk = {
                \ 'build_dir': './out/',
                \}
    let g:vimtex_quickfix_latexlog = {
                \ 'overfull' : 0,
                \ 'underfull' : 0,
                \ }

"---vim-codefmt---"
    augroup autoformat_settings
      "autocmd FileType bzl AutoFormatBuffer buildifier
      "autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
      "autocmd FileType dart AutoFormatBuffer dartfmt
      "autocmd FileType go AutoFormatBuffer gofmt
      "autocmd FileType gn AutoFormatBuffer gn
      autocmd FileType vue,javascript,html,css,sass,scss,less,json AutoFormatBuffer prettier
      "autocmd FileType java AutoFormatBuffer google-java-format
      "autocmd FileType python AutoFormatBuffer yapf
      " Alternative: autocmd FileType python AutoFormatBuffer autopep8
    augroup END

"---tagbar---"
    nmap <F8> :TagbarToggle<CR>
