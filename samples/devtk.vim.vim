set sw=2
set ts=2
set et
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions+=c

map <F6> :tabnext
map <S-F6> :tabprev
map <C-F6> :tabnew
map <S-F3> :tabnew:edit .
map <F3> :Exploregg
map <S-F3> :Texplore

nmap <F12> :exe "mksession! " . v:this_session<CR>
nmap <C-F12> :mksession! $DEVTK_VIM_SESSIONS/
nmap <S-F12> :so $DEVTK_VIM_SESSIONS/

function! ProjectRelativePath()
  return substitute(expand('%:p'), $DEVTK_PROJECT_PATH, "^", "")
endf

set titlestring=%{ProjectRelativePath()}%m

iab => ⇒ 
iab <- ←
iab -> →

autocmd BufWritePre *.scala :keepjumps :%s/\s\+$//e

set ssop+=resize
