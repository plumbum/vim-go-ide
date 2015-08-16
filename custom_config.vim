
set statusline=%{HasPaste()}%F%m%r%h%w\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]\ %{fugitive#statusline()} 

"------------------------------------------------------------------------------
" Syntastic
"------------------------------------------------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*


"------------------------------------------------------------------------------
" Neosnippet
"------------------------------------------------------------------------------
let g:go_snippet_engine = "neosnippet"
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

"------------------------------------------------------------------------------
" TagBar
"------------------------------------------------------------------------------
let g:tagbar_left = 0       " Display window left
let g:tagbar_width = 30     " Window width
let g:tagbar_iconchars = ['▶', '◢']     " display arrows instead +/-
let g:tagbar_sort = 0       " sorting disabled

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

nmap <silent> <F3> :TagbarToggle<CR>
imap <silent> <F3> <Esc>:TagbarToggle<CR>

nmap <silent> <S-F3> :NERDTreeToggle<CR>
imap <silent> <S-F3> <Esc>:NERDTreeToggle<CR>

nmap <leader>O :TagbarToggle<CR>


"------------------------------------------------------------------------------
" Clipboard shortcuts
"------------------------------------------------------------------------------
" Copy to global clipboard 
vmap <C-c> "+yi
nmap <C-c> "+y
" Paste from global clipboard
imap <S-Insert> <esc>"+gpa
nmap <S-Insert> "+gP
" Paste from mouse clipboard
imap <C-M-V> <esc>"*gpa
nmap <C-M-V> "*gP

"------------------------------------------------------------------------------
" Edit buffers
"------------------------------------------------------------------------------
" Close current buffer
imap <C-F4> <Esc>:bd<CR>a
nmap <C-F4> :bd<CR>

" Previous buffer
imap <F5> <Esc>:bp!<CR>a
nmap <F5> :bp!<CR>

" Next buffer
imap <F6> <Esc>:bn!<CR>a
nmap <F6> :bn!<CR>

"------------------------------------------------------------------------------
" Tabs
"------------------------------------------------------------------------------
imap <M-=> <Esc>:tabnew<CR>a
nmap <M-=> :tabnew<CR>
imap <M--> <Esc>:tabclose<CR>a
nmap <M--> :tabclose<CR>
imap <M-1> <Esc>:tabnext<Space>1<CR>a
nmap <M-1> :tabnext<Space>1<CR>
imap <M-2> <Esc>:tabnext<Space>2<CR>a
nmap <M-2> :tabnext<Space>2<CR>
imap <M-3> <Esc>:tabnext<Space>3<CR>a
nmap <M-3> :tabnext<Space>3<CR>
imap <M-4> <Esc>:tabnext<Space>4<CR>a
nmap <M-4> :tabnext<Space>4<CR>
imap <M-5> <Esc>:tabnext<Space>5<CR>a
nmap <M-5> :tabnext<Space>5<CR>
imap <M-6> <Esc>:tabnext<Space>6<CR>a
nmap <M-6> :tabnext<Space>6<CR>
imap <M-7> <Esc>:tabnext<Space>7<CR>a
nmap <M-7> :tabnext<Space>7<CR>
imap <M-8> <Esc>:tabnext<Space>8<CR>a
nmap <M-8> :tabnext<Space>8<CR>
imap <M-9> <Esc>:tabnext<Space>9<CR>a
nmap <M-9> :tabnext<Space>9<CR>
imap <M-0> <Esc>:tabnext<Space>10<CR>a
nmap <M-0> :tabnext<Space>10<CR>

imap <M-Left> <Esc>:tabprev<CR>a
nmap <M-Left> :tabprev<CR>
imap <M-Right> <Esc>:tabnext<CR>a
nmap <M-Right> :tabnext<CR>


"------------------------------------------------------------------------------
" По Ctrl-Enter переходит к файлу на имени которого стоит курсор
"------------------------------------------------------------------------------
imap <C-CR> <Esc>:e<Space><C-R><C-A><CR>
nmap <C-CR> :e<Space><C-R><C-A><CR>


"------------------------------------------------------------------------------
" tags generator
"------------------------------------------------------------------------------

au FileType go imap <C-F12> <Esc>:!gotags -R -sort -silent -f ctags . $GOPATH $GOROOT<CR>a
au FileType go nmap <C-F12> :!gotags -R -sort -silent -f ctags . $GOPATH $GOROOT<CR>

"------------------------------------------------------------------------------
" GUI setup
"------------------------------------------------------------------------------
if has("gui_running")
    set guifont=Droid\ Sans\ Mono\ 10
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L  "remove left-hand scroll bar
endif


