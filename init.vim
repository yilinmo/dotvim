let g:python3_host_prog='/home/yilin/anaconda3/bin/python'

call plug#begin('~/.vim/plugged')

Plug 'lervag/vimtex'
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'
let g:vimtex_quickfix_latexlog = {
			\ 'overfull' : 0,
			\ 'underfull' : 0,
			\ 'packages' : {
			\   'default' : 0,
			\ },
			\}

Plug 'jnurmine/Zenburn'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'tpope/vim-fugitive'

Plug 'vim-airline/vim-airline'

Plug 'easymotion/vim-easymotion'

Plug 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsSnippetDirectories=["UltiSnips", "my_snippets"]

Plug 'honza/vim-snippets'

Plug 'scrooloose/nerdtree'
map <Leader>p :NERDTreeToggle<CR>

Plug 'Yggdroot/LeaderF'
let g:Lf_DefaultMode = 'NameOnly'
let g:Lf_ShortcutF = '<Leader>e'

Plug 'kassio/neoterm'
call plug#end()

colorscheme zenburn

inoremap <silent><expr> <TAB>
			\ pumvisible() ? coc#_select_confirm() :
			\ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

autocmd FileType tex let b:coc_pairs = [["$", "$"]]
autocmd FileType tex let b:coc_pairs_disabled = ["`", "'","<"]
autocmd FileType tex setlocal spell spelllang=en_us

let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

au VimEnter,BufRead,BufNewFile *.jl set filetype=julia

let g:neoterm_default_mod='belowright' " open terminal in bottom split
let g:neoterm_size=16 " terminal split size
let g:neoterm_autoscroll=1 " scroll to the bottom when running a command
nnoremap <leader><cr> :TREPLSendLine<cr>j " send current line and move down
vnoremap <leader><cr> :TREPLSendSelection<cr> " send current selection

if (has("termguicolors"))
  set termguicolors
endif
