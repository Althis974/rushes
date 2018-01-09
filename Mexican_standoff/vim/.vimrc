" *********************basics*********************

:sy on
:set nu
:set ru

" *********************required*********************

" non-recursive mapping in insert mode

:inoremap ( ()<ESC>i
:inoremap { {<CR>}<ESC>i

" auto indent

:set autoindent
:set cindent

" params for backup files

:set backup
:set backupdir=~/.vim

" highligth wsp

:let c_space_errors = 1
