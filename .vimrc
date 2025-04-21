if 0
██████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████
██                                                                                                                                                          ██
██   ███    ███  █████  ██   ██ ███████     ██    ██ ██ ███    ███      ██████  ██████  ███████  █████  ████████      █████   ██████   █████  ██ ███    ██  ██
██   ████  ████ ██   ██ ██  ██  ██          ██    ██ ██ ████  ████     ██       ██   ██ ██      ██   ██    ██        ██   ██ ██       ██   ██ ██ ████   ██  ██
██   ██ ████ ██ ███████ █████   █████       ██    ██ ██ ██ ████ ██     ██   ███ ██████  █████   ███████    ██        ███████ ██   ███ ███████ ██ ██ ██  ██  ██
██   ██  ██  ██ ██   ██ ██  ██  ██           ██  ██  ██ ██  ██  ██     ██    ██ ██   ██ ██      ██   ██    ██        ██   ██ ██    ██ ██   ██ ██ ██  ██ ██  ██
██   ██      ██ ██   ██ ██   ██ ███████       ████   ██ ██      ██      ██████  ██   ██ ███████ ██   ██    ██        ██   ██  ██████  ██   ██ ██ ██   ████  ██
██                                                                                                                                                          ██
██████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████
endif

""""""""""""""""""""""
"      Settings      "
""""""""""""""""""""""
filetype on " Enable filetype plugin
filetype plugin on
filetype indent off
set nocompatible " We use Vim, not Vi
set ttyfast " Faster redraw
set lazyredraw " Don't redraw statusline when switching between vim modes
set shortmess=tsIAW " No intro when starting Vim
set expandtab " Insert spaces instead of tabs
set smarttab " Insert spaces according to shiftwidth
set softtabstop=2 " ... and insert 2 spaces
set shiftwidth=2 " Indent with 2 spaces
set incsearch " Search as typing
set hlsearch " Highlight search results
set cursorline " Highlight the cursor line
set virtualedit=onemore " Allow the cursor to move just past the end of the line
set history=10000 " Maximum 10000 undo
set wildmenu " Better command-line completion
set wildignorecase " Ignore case when command-line completion
set clipboard=unnamed,unnamedplus
set selection=exclusive " Don't select char under cursor
set mouse=a
set autoindent " auto indent
set nosmartindent " no smart indent
set noshowmode " Don't display the current mode
set gdefault " The substitute flag g is on
set hidden " Hide the buffer instead of closing when switching
set backspace=indent,eol,start " The normal behaviour of backspace
set showtabline=2 " Always show tabs
set laststatus=2 " Always show status bar
set whichwrap=<,>,[,] " Alow arrow keys move to previous/next line
set updatetime=1000 " How long will vim backup a file
set autoread " Auto reload content if it changed outside of vim
set tabpagemax=5000 " Max tab pages
set ignorecase " case insensitive but case sensitive in command mode
set showbreak=>\
set mousemodel=extend " Disable right click popup in Gvim
set mousefocus " Focus on mouse hovered
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,gbk,big5,utf-16le,utf-16be,default,latin1
set langmenu=en_US.UTF-8 " Set Gvim menu language
let $LANG='en' " Set $LANG variable
set fileformats=unix,dos,mac " Set for terminal vim
set synmaxcol=600 " Don't try to highlight lines with over 600 characters
set smartcase& " After 8.0.1238, smartcase should be on. But we'll see.
set sidescroll=0 " Leave 0 character when scrolling vertically
set sidescrolloff=5 " Leave 5 characters when scrolling horizontally
set nowrap " Don't wrap text
set cmdheight=2 "Avoiding the Hit ENTER to continue prompts
set guioptions-=T " Don't show toolbar in Gvim
set guioptions-=t " Don't show tearoff menu items
let g:netrw_list_hide='' " Show all hidden files when using file explorer
let g:netrw_hide=0 " Show all hidden files when using file explorer
let g:netrw_sizestyle="H" " Human-readable file size in file explorer
let g:netrw_liststyle=1 " Like 'ls -al' in file explorer
let g:netrw_timefmt="" " Don't display time in file explorer
let g:vertical_jump=&scroll*4/3 " Jump when Ctrl up/down triggered
if !has('nvim') " Neovim doesn't support viminfo
  set viminfo+=n$HOME/.vim/.viminfo " .viminfo location
endif
if has("gui_running") && filereadable(expand(("$VIMRUNTIME/delmenu.vim")))
  source $VIMRUNTIME/delmenu.vim " Reload Menu.vim
  source $VIMRUNTIME/menu.vim
endif
if has("mouse_sgr")
  set ttymouse=sgr " Faster mouse in tty, xterm patch version >= 277
elseif has("mouse_xterm")
  set ttymouse=xterm2 " Faster mouse in tty, xterm patch version from 95 to 276
endif
if filereadable("/proc/self/cgroup")
  call system("cat /proc/self/cgroup | grep -q docker")
  let g:isDocker = v:shell_error == 0 ? 1 : 0
endif
if (executable("gpm") || executable("/usr/sbin/gpm") || executable("/sbin/gpm")) && !exists("$DISPLAY") && !exists("$DESKTOP_SESSION") && !g:isDocker
  set ttymouse=xterm " Reset to xterm in order to use GPM mouse
endif
if !has("win32") && !has("win64") && !has("gui_running") && executable("sh") && executable("stty")
  " Make sure Ctrl-S, Ctrl-Q and Ctrl-V are working
  silent !sh -c "stty -ixon -ixoff ; stty lnext '^-' stop undef start undef -ixon" > /dev/null 2>&1
endif
if has("nvim")
  set inccommand=nosplit " incsearch for subtitutions
endif
set guicursor=a:ver25-Cursor/lCursor-blinkon0 " disable cursor flashing
let g:SYSPERL = "perl"
if has("unix")
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    let g:SYSPERL = "/usr/bin/perl"
  endif
endif
autocmd VimEnter * set noerrorbells " Disable Gvim error sound
autocmd VimEnter * set vb t_vb= | set t_vb= " Disable Gvim visual bell
autocmd BufRead,BufNewFile,BufWritePost,BufEnter,FileType,ColorScheme * set iskeyword=a-z,A-Z,48-57,_
autocmd BufRead,BufNewFile,BufWritePost,BufEnter,FileType,ColorScheme * set formatoptions-=cro " Prevent vim inserting new comment lines
" autocmd BufRead,BufNewFile,BufWritePost,BufAdd,BufEnter,FileType,ColorScheme *.{ts,tsx,jsx} setlocal filetype=javascript
autocmd BufRead,BufNewFile,BufWritePost,BufAdd,BufEnter,FileType,ColorScheme *.{dockerfile,Dockerfile} setlocal filetype=dockerfile
au VimResized * let g:vertical_jump=&scroll*4/3
au FileType vim,sh,zsh,python setlocal fileformat=unix
au FileType make,go setlocal fileformat=unix | call IndentTab(8)
au FileType help,man nmap <buffer> <CR> <C-]> | nmap <buffer> <C-n> :cn<CR> | nmap <buffer> <C-p> :cp<CR>
" Highlight code area in markdown
" let g:markdown_fenced_languages = getcompletion('', 'filetype')
let g:markdown_fenced_languages =
\[
  \"c","cpp","java","javascript","ruby","python","vim",
  \"css","html","xml","json","cmake","yaml","toml","sh","conf",
  \"zsh","tmux","debsources","resolv","sudoers","make","diff",
  \"dosbatch","dosini","bash=sh","js=javascript","go","sql",
  \"dockerfile","lua","gitconfig","rust","cs","typescript"
\]

if (v:version == 802 && has("patch2734")) || has('patch-8.2.2734') || v:version > 802
  call add(g:markdown_fenced_languages, "ps1")
endif

if &diff
  set number
  set nocursorline
else
  " Open all cmd args in new tabs
  silent tab all
endif

" Open help in new tabs
cnoreabbrev help <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'tab help' : 'help')<CR>
cnoreabbrev h <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'tab help' : 'h')<CR>
cnoreabbrev edit <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'tabedit' : 'edit')<CR>
cnoreabbrev e <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'tabedit' : 'e')<CR>

" Modified from https://github.com/Khouba/indent-detector.vim
function! InitIndentVariable(var, value)
  if !exists(a:var)
    if type(a:value) == type("")
      exec 'let ' . a:var . ' = ' . "'" . a:value . "'"
    else
      exec 'let ' . a:var . ' = ' . a:value
    endif
  endif
endfunction

function! IndentDetectorSearchNearby(pat)
  return search(a:pat, 'Wnc', 0, 20) > 0 || search(a:pat, 'Wnb', 0, 20) > 0
endfunction

function! IndentDetectorDetect(autoadjust)
  let leadtab = IndentDetectorSearchNearby('^\t')
  let leadspace = IndentDetectorSearchNearby('^ ')
  if leadtab + leadspace < 2 && IndentDetectorSearchNearby('^\(\t\+ \| \+\t\)') == 0
    if leadtab
      if a:autoadjust
        exec 'setl noexpandtab nosmarttab tabstop='.b:Indent_Detector_tabstop.' shiftwidth='.b:Indent_Detector_shiftwidth.' softtabstop='.b:Indent_Detector_softtabstop
      endif
      setl noexpandtab
      setl softtabstop=0
      setl tabstop=8
      setl shiftwidth=8
      return 'tab'
    elseif leadspace
      let spacenum = 0
      if IndentDetectorSearchNearby('^ [^\t ]')
        let spacenum = 1
      elseif IndentDetectorSearchNearby('^  [^\t ]')
        let spacenum = 2
      elseif IndentDetectorSearchNearby('^   [^\t ]')
        let spacenum = 3
      elseif IndentDetectorSearchNearby('^    [^\t ]')
        let spacenum = 4
      elseif IndentDetectorSearchNearby('^     [^\t ]')
        let spacenum = 5
      elseif IndentDetectorSearchNearby('^      [^\t ]')
        let spacenum = 6
      elseif IndentDetectorSearchNearby('^       [^\t ]')
        let spacenum = 7
      elseif IndentDetectorSearchNearby('^        [^\t ]')
        let spacenum = 8
      endif
      if a:autoadjust
        let n = spacenum ? spacenum : b:Indent_Detector_shiftwidth
        exec 'setl expandtab smarttab tabstop='.n.' shiftwidth='.n.' softtabstop='.n
      endif
      setl expandtab
      execute "setl softtabstop=". (spacenum ? spacenum : &softtabstop)
      execute "setl shiftwidth=". (spacenum ? spacenum : &shiftwidth)
      return 'space'.(spacenum ? spacenum : '>8')
    else
      if &expandtab
        return 'space'.&softtabstop
      else
        call IndentTab(8)
        return 'tab'.&tabstop
      endif
    endif
  else
    return 'mixed'
  endif
endfunction

function! GetIndent()
  if !exists('b:fileIndent')
    call InitIndentVariable('b:Indent_Detector_tabstop', &tabstop)
    call InitIndentVariable('b:Indent_Detector_shiftwidth', &shiftwidth)
    call InitIndentVariable('b:Indent_Detector_softtabstop', &softtabstop)
    let b:fileIndent = IndentDetectorDetect(0)
  endif
  return b:fileIndent
endfunction
autocmd BufRead,BufNewFile,BufWritePost,BufAdd,BufNew,FileType * exe "if exists('b:fileIndent') | unlet b:fileIndent | endif" | call GetIndent()

""" Prevent lag when hitting ESC
set ttimeoutlen=10
set timeoutlen=10
au InsertEnter * set ignorecase

""" When opening a file : - Reopen at last position - Display info
function! GetFileInfo()
  let time = strftime("%T")
  let file = expand('%:p')
  let permissions = getfperm(file)
  echom file . " saved at " . time | redraw
  call ConsoleLog(" " . GetFileSize() . ", " . time . ", " . permissions)
endfunction
function! GetFileSize()
  let bytes = getfsize(expand('%:p'))
  if bytes <= 0
     return ""
  elseif bytes > 1024*1000*1000
    return (bytes / 1024*1000*1000) . "GB"
  elseif bytes > 1024*1000
    return (bytes / 1024*1000) . "MB"
  elseif bytes > 1024
    return (bytes / 1024) . "KB"
  else
     return bytes . "B"
  endif
endfunction
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
""" Custom backup and swap files
let myVimDir = expand("$HOME/.vim")
let myBackupDir = myVimDir . '/backup'
let mySwapDir = myVimDir . '/swap'
let myUndoDir = myVimDir . '/undo'
function! EnsureDirExists (dir)
  if !isdirectory(a:dir)
    call mkdir(a:dir,'p')
  endif
endfunction
call EnsureDirExists(myVimDir)
call EnsureDirExists(myBackupDir)
call EnsureDirExists(mySwapDir)
call EnsureDirExists(myUndoDir)
set backup
set backupskip=/tmp/*
set backupext=.bak
let &directory = mySwapDir
let &backupdir = myBackupDir
let &undodir = myUndoDir
set writebackup

" Helper functions
function! CreateShortcut(keys, cmd, where, ...)
  let keys = "<" . a:keys . ">"
  if a:where =~ "i"
    let i = (index(a:000,"noTrailingIInInsert") > -1) ? "" : "i"
    let e = (index(a:000,"noLeadingESCInInsert") > -1) ? "" : "<ESC>"
    execute "inoremap " . keys . " " . e .  a:cmd . i
  endif
  if a:where =~ "n"
    execute "nnoremap " . keys . " " . a:cmd
  endif
  if a:where =~ "v"
    let k = (index(a:000,"restoreSelectionAfter") > -1) ? "gv" : ""
    let c = a:cmd
    if index(a:000,"cmdInVisual") > -1
      let c = ":<C-u>" . strpart(a:cmd,1)
    endif
    execute "vnoremap " . keys . " " . c . k
  endif
endfunction
function! TabIsEmpty()
  return winnr('$') == 1 && len(expand('%')) == 0 && line2byte(line('$') + 1) <= 2
endfunction
function! ModifiedQCheck()
  if &modified
    if (confirm("YOU HAVE UNSAVED CHANGES! Wanna quit anyway?", "&Yes\n&No", 2)==1)
      q!
    endif
  else
    silent q
  endif
endfunction
function! FileQuit()
  if has("gui_running")
    " help file is not in the buffer list, specially treated
    if (&filetype=="help")
      q
      return
    elseif TabIsEmpty() == 1
      silent q!
      return
    endif
  endif

  if TabIsEmpty() == 1
    silent q!
  else
    call ModifiedQCheck()
  endif
endfunction
function! FileSave()
  call SavePos()
  let @/ = "" " Clear searching highlight
  if (v:version == 704 && has("patch150")) || has('patch-7.4.150') || v:version > 704
    keeppatterns %s/\s\+$//e " Keep last searching history
  else
    %s/\s\+$//e
    call histdel("search", -1) " Remove last searching history
  endif
  let cantSave = "echo \"Can't save the file: \" . v:exception | return"
  let notSaved = "redraw | echo 'This buffer was NOT saved!' | return"
  try
    silent w
  catch /:E45:\|:E505:\|:E212:/
    if (confirm("This buffer is read only! Wanna save it anyway?", "&Yes\n&No", 2)==1)
      try
        silent w!
      catch /:E212:/
        if (confirm("Can't open the file, do you want to save it as root?", "&Yes\n&No", 2)==1)
          try
            w !sudo tee % > /dev/null
            edit!
          catch
            exe cantSave
          endtry
        else
          exe notSaved
        endif
      catch
        exe cantSave
      endtry
    else
      exe notSaved
    endif
  catch /:E32:/
    if (confirm("This buffer has no file to be saved in! Wanna choose it?", "&Yes\n&No", 2)==1)
      execute has("gui_running") ? 'browse confirm saveas %:p:h' : 'call feedkeys("\<ESC>:w ")'
    else
      exe notSaved
    endif
  catch
    exe cantSave
  endtry
  let time = strftime("%T")
  let file = expand('%:p')
  let permissions = getfperm(file)
  echom file . " saved at " . time | redraw
  call ConsoleLog(" Saved " . GetFileSize() . ", " . time . ", " . permissions)
  try
    call setpos(".", b:savepos)
  catch /:E20:/
    call ConsoleInfo(" E20: Mark not set, please try again. ")
  endtry
endfunction
function! OpenLastBufferInNewTab()
  redir => ls_output
  silent exec 'ls'
  redir END
  let ListBuffers = reverse(split(ls_output, "\n"))
  for line in ListBuffers
    let title = split(line, "\"")[1]
    if title !~  "\[No Name"
      execute "tabnew +" . split(line, " ")[0] . "buf"
      break
    endif
  endfor
endfunction
function! OpenNetrw()
  if TabIsEmpty() == 1 || winnr("$") != 1
    execute has("gui_running") ? "browse confirm e %:p:h" : "Explore %:p:h"
  else
    execute has("gui_running") ? "browse confirm tabe %:p:h" : "Texplore %:p:h"
  endif
endfunction
function! MenuNetrw()
  let c = input("What to you want to do? (M)ake a dir, Make a (F)ile, (R)ename, (D)elete : ")
  if (c == "m" || c == "M")
    normal! d
  elseif (c == "f" || c == "F")
    normal! %
  elseif (c == "r" || c == "R")
    normal! R
  elseif (c == "d" || c == "D")
    normal! D
  endif
endfunction
function! SavePos()
  let b:savepos = getpos(".")
endfunction
function! DeleteLine()
  let savepos = getpos(".")
  normal! "_dd
  call setpos(".", savepos)
endfunction
function! PasteInsertMode()
  normal! gP
  return ''
endfunction
function! PasteClipboardInsertMode()
  normal! "+gP
  return ''
endfunction

" Usefull shortcuts for entering insert mode
nnoremap <CR> i<CR>
nnoremap <Backspace> i<Backspace>
nnoremap <Space> i<Space>
nnoremap <silent> " i"
nnoremap <silent> ' i'
nnoremap <silent> [ i[<C-r>=AutoPair("]")<CR>
nnoremap <silent> ] i]
nnoremap <silent> { i{<C-r>=AutoPair("}")<CR>
nnoremap <silent> } i}
nnoremap <silent> ( i(<C-r>=AutoPair(")")<CR>
nnoremap <silent> ) i)
nnoremap <silent> < i<
nnoremap <silent> > i>
nnoremap <silent> . i.
nnoremap <silent> , i,
nnoremap <silent> ; i;
nnoremap <silent> + i+
nnoremap <silent> = i=
nnoremap <silent> ` i`
nnoremap <silent> ~ i~
nnoremap <silent> & i&
nnoremap <silent> * i*
nnoremap <silent> ! i!
nnoremap <silent> @ i@
nnoremap <silent> # i#
nnoremap <silent> % i%
nnoremap <silent> ^ i^
nnoremap <silent> \ i\
nnoremap <silent> _ i_
nnoremap <silent> <Bar> i<Bar>

" Vim undo too much
inoremap <Space> <Space><C-g>u
inoremap <CR> <CR><C-g>u
inoremap <Tab> <Tab><C-g>u

" Disable middle mouse button
nnoremap <MiddleMouse> <Nop>
inoremap <MiddleMouse> <Nop>
vnoremap <MiddleMouse> <Nop>
nnoremap <2-MiddleMouse> <Nop>
inoremap <2-MiddleMouse> <Nop>
vnoremap <2-MiddleMouse> <Nop>
nnoremap <3-MiddleMouse> <Nop>
inoremap <3-MiddleMouse> <Nop>
vnoremap <3-MiddleMouse> <Nop>
nnoremap <4-MiddleMouse> <Nop>
inoremap <4-MiddleMouse> <Nop>
vnoremap <4-MiddleMouse> <Nop>

" Disable Replace mode
nnoremap R <Nop>
nnoremap r <Nop>

" Meta LeftMouse is block selecting
noremap  <M-LeftMouse> <4-LeftMouse>
inoremap <M-LeftMouse> <4-LeftMouse>
onoremap <M-LeftMouse> <C-C><4-LeftMouse>
noremap  <M-LeftDrag>  <LeftDrag>
inoremap <M-LeftDrag>  <LeftDrag>
onoremap <M-LeftDrag>  <C-C><LeftDrag>

" Ctrl LeftMouse is block selecting
noremap  <C-LeftMouse> <4-LeftMouse>
inoremap <C-LeftMouse> <4-LeftMouse>
onoremap <C-LeftMouse> <C-C><4-LeftMouse>
noremap  <C-LeftDrag>  <LeftDrag>
inoremap <C-LeftDrag>  <LeftDrag>
onoremap <C-LeftDrag>  <C-C><LeftDrag>

" Ctrl RightMouse is block selecting
noremap  <C-RightMouse> <4-LeftMouse>
inoremap <C-RightMouse> <4-LeftMouse>
onoremap <C-RightMouse> <C-C><4-LeftMouse>
noremap  <C-RightDrag>  <LeftDrag>
inoremap <C-RightDrag>  <LeftDrag>
onoremap <C-RightDrag>  <C-C><LeftDrag>

" RightMouse is block selecting
noremap  <RightMouse> <4-LeftMouse>
inoremap <RightMouse> <4-LeftMouse>
onoremap <RightMouse> <C-C><4-LeftMouse>
noremap  <RightDrag>  <LeftDrag>
inoremap <RightDrag>  <LeftDrag>
onoremap <RightDrag>  <C-C><LeftDrag>

" RightMouse double clicking moves cursor to the other side
noremap <2-RightMouse> <2-LeftMouse>o

" Ctrl A - Begin Line
call CreateShortcut("C-a", "0", "nv")
inoremap <C-a> <Home>

" Ctrl E - End Line
call CreateShortcut("C-e", "$l", "nv")
inoremap <C-e> <End>

if !has("gui_running") && has("clipboard")
  set clipboard=
  " Remap Ctrl C
  nnoremap <silent> <C-c> mjV"+yV`j<ESC>i
  inoremap <silent> <C-c> <C-\><C-o>mj<C-o>V"+y<C-o>V<C-o><C-o>`j<ESC>i
  vnoremap <silent> <C-c> "+y<ESC>gv
  cnoremap <C-c> <C-y>
  " Remap Ctrl X
  nnoremap <silent> <C-x>       :call SavePos()<CR>V"+x<CR>i
  inoremap <silent> <C-x>  <C-o>:call SavePos()<CR><ESC>V"+x:call setpos(".", b:savepos)<CR>i<C-g>u
  vnoremap <silent> <C-x> "+ygv"_d
  cnoremap <C-x> <C-y><C-e><C-u>
  " Remap Ctrl V
  nnoremap <silent> <C-v> "+gPi<C-g>u
  vnoremap <silent> <C-v> "_d"+gP
  inoremap <silent> <C-v> <C-r>=PasteClipboardInsertMode()<CR><C-g>u
  cnoremap <C-v> <C-r>+
elseif !has("gui_running") && !has("clipboard")
  " Ctrl C - Copy
  call CreateShortcut("C-c", "mjYV`j", "ni")
  vnoremap <silent> <C-c> y<ESC>gv

  " Ctrl X - Cut
  nnoremap <silent> <C-x>       :call SavePos()<CR>:call setpos(".", b:savepos)<CR>i
  inoremap <silent> <C-x>  <C-o>:call SavePos()<CR>:call setpos(".", b:savepos)<CR>i<C-g>u
  vnoremap <silent> <C-x> d
  cnoremap <C-x> <C-y><C-e><C-u>

  " Ctrl V - Paste from vim clipboard
  " inoremap <silent> <C-v> <C-o>:normal! gP<CR><C-g>u
  nnoremap <silent> <C-v> gPi<C-g>u
  vnoremap <silent> <C-v> "_dgP
  inoremap <silent> <C-v> <C-r>=PasteInsertMode()<CR><C-g>u
  cnoremap <C-v> <C-r>"
endif

" Insert - Paste
cnoremap <Insert> <C-r>"

" Ctrl S - Save
nnoremap <silent> <C-s> :call FileSave()<CR>
inoremap <expr> <silent> <C-s> pumvisible() ? "\<C-y>\<C-g>u\<C-o>:call FileSave()\<CR>" : "\<C-g>u\<C-O>:call FileSave()\<CR>"
vnoremap <silent> <C-s> <ESC>:call FileSave()<CR>
cnoremap <C-s> <C-c>:call FileSave()<CR>

" Home - Go To Begin of the Line
call CreateShortcut("Home", "^", "inv")

" End - Go To End of the Line
call CreateShortcut("End", "$l", "inv")

" Ctrl K - Delete Line
nnoremap <silent> <C-k> :call DeleteLine()<CR>
inoremap <silent> <C-k> <C-o>:call DeleteLine()<CR><C-g>u
vnoremap <silent> <C-k> :d _<CR>

" Ctrl D - Duplicate Line
nnoremap <silent> <C-d> mj:t.<CR>`jji
inoremap <expr> <silent> <C-d> pumvisible() ? "\<C-y>\<C-O>mj\<ESC>:t.\<CR>`jji\<C-g>u" : "\<C-O>mj\<ESC>:t.\<CR>`jji\<C-g>u"
vnoremap <C-d> yP<ESC>gv

" Ctrl Q - Visual block selection
nnoremap <C-q> <C-v>
inoremap <C-q> <C-o><C-v>
vnoremap <C-q> <ESC>

" Ctrl Left - Move a word
call CreateShortcut("C-Left", "b", "n")

" Ctrl Right - Move a word
call CreateShortcut("C-Right", "w", "n")

" Ctrl Up - Pageup, &scroll = half of screen lines
execute 'nnoremap <silent> <C-Up> '.g:vertical_jump.'k'
execute 'inoremap <silent> <C-Up> <C-\><C-O>'.g:vertical_jump.'k'
execute 'vnoremap <silent> <C-Up> '.g:vertical_jump.'k'

" Ctrl Down - Pagedown
execute 'nnoremap <silent> <C-Down> '.g:vertical_jump.'j'
execute 'inoremap <silent> <C-Down> <C-\><C-O>'.g:vertical_jump.'j'
execute 'vnoremap <silent> <C-Down> '.g:vertical_jump.'j'

" Pageup - Pageup
execute 'nnoremap <silent> <PageUp> '.g:vertical_jump.'k'
execute 'inoremap <silent> <PageUp> <C-\><C-O>'.g:vertical_jump.'k'
execute 'vnoremap <silent> <PageUp> '.g:vertical_jump.'k'

" Pagedown - Pagedown
execute 'nnoremap <silent> <PageDown> '.g:vertical_jump.'j'
execute 'inoremap <silent> <PageDown> <C-\><C-O>'.g:vertical_jump.'j'
execute 'vnoremap <silent> <PageDown> '.g:vertical_jump.'j'

" Shift Left - Select mode
nnoremap <S-Left> v<Left>
inoremap <S-Left> <C-o>v<Left>
nnoremap <ESC>[1;2D v<Left>
inoremap <ESC>[1;2D <C-o>v<Left>
vnoremap <ESC>[1;2D <S-Left>

" Shift Right - Select mode
nnoremap <S-Right> v<Right>
inoremap <S-Right> <C-o>v<Right>
nnoremap <ESC>[1;2C v<Right>
inoremap <ESC>[1;2C <C-o>v<Right>
vnoremap <ESC>[1;2C <S-Right>

" Shift Up - Select mode + Pageup
execute 'nnoremap <silent> <S-Up> v'.g:vertical_jump.'k'
execute 'inoremap <silent> <S-Up> <C-\><C-O>v'.g:vertical_jump.'k'
execute 'vnoremap <silent> <S-Up> '.g:vertical_jump.'k'
execute 'nnoremap <silent> <ESC>[1;2A v'.g:vertical_jump.'k'
execute 'inoremap <silent> <ESC>[1;2A <C-\><C-O>v'.g:vertical_jump.'k'
execute 'vnoremap <silent> <ESC>[1;2A '.g:vertical_jump.'k'

" Shift Down - Select mode + Pagedown
execute 'nnoremap <silent> <S-Down> v'.g:vertical_jump.'j'
execute 'inoremap <silent> <S-Down> <C-\><C-O>v'.g:vertical_jump.'j'
execute 'vnoremap <silent> <S-Down> '.g:vertical_jump.'j'
execute 'nnoremap <silent> <ESC>[1;2B v'.g:vertical_jump.'j'
execute 'inoremap <silent> <ESC>[1;2B <C-\><C-O>v'.g:vertical_jump.'j'
execute 'vnoremap <silent> <ESC>[1;2B '.g:vertical_jump.'j'

" Ctrl F - Find
nnoremap <C-f> :noh<CR>:redraw<CR>:set ignorecase<CR>/
inoremap <C-f> <Esc><Esc>:noh<CR><Esc>:redraw<CR><Esc>:set ignorecase<CR>/
vnoremap <C-f> <Esc><Esc>:noh<CR><Esc>:redraw<CR><Esc>:set ignorecase<CR>/\%V

" Ctrl R - Search and Replace
nnoremap <C-r> :noh<CR>:redraw<CR>:set noignorecase<CR>:%s/
inoremap <C-r> <Esc><Esc>:noh<CR><Esc>:redraw<CR><Esc>:set noignorecase<CR><Esc>:%s/
vnoremap <C-r> <Esc><Esc>:noh<CR><Esc>:redraw<CR><Esc>:set noignorecase<CR><Esc>:'<,'>s/\%V

" Ctrl G - Select all
call CreateShortcut("C-g", "ggVG", "inv")

" Ctrl L - Visual line selection
call CreateShortcut("C-l", "V", "n")
inoremap <C-l> <C-\><C-O>V
vnoremap <C-l> <ESC>

" Ctrl U - Move up Line
nnoremap <silent> <C-u> mj:<C-u>silent! move-2<CR>`j
inoremap <silent> <C-u> <C-\><C-O>mj<C-O>:<C-u>silent! move-2<CR><C-O>`j<C-g>u
vnoremap <silent> <C-u> :<C-u>silent! '<,'>move-2<CR><ESC>gv

" Ctrl J - Move down Line
nnoremap <silent> <C-j> mj:<C-u>silent! move+<CR>`j
inoremap <silent> <C-j> <C-\><C-O>mj<C-O>:<C-u>silent! move+<CR><C-O>`j<C-g>u
vnoremap <silent> <C-j> :<C-u>silent! '<,'>move'>+<CR><ESC>gv

" Ctrl Pageup - Move up Line booster
" nnoremap <silent> <C-PageUp> mj:<C-u>silent! move-16<CR>`j
" inoremap <silent> <C-PageUp> <C-\><C-O>mj<C-O>:<C-u>silent! move-16<CR><C-O>`j<C-g>u
" vnoremap <silent> <C-PageUp> :<C-u>silent! '<,'>move-16<CR><ESC>gv

" Ctrl Pagedown - Move down Line boosted
" nnoremap <silent> <C-PageDown> mj:<C-u>silent! move+15<CR>`j
" inoremap <silent> <C-PageDown> <C-\><C-O>mj<C-O>:<C-u>silent! move+15<CR><C-O>`j<C-g>u
" vnoremap <silent> <C-PageDown> :<C-u>silent! '<,'>move'>+15<CR><ESC>gv

" Ctrl W - Quit
nnoremap <silent> <C-w> :call FileQuit()<CR>
inoremap <silent> <C-w> <C-o>:call FileQuit()<CR>
vnoremap <silent> <C-w> <ESC>:call FileQuit()<CR>
cnoremap <C-w> <C-c>:call FileQuit()<CR>
nnoremap <silent> q :call FileQuit()<CR>
nnoremap <silent> Q :call FileQuit()<CR>

" Tab - Indent
call CreateShortcut("Tab", ">>", "n")
call CreateShortcut("Tab", ">", "v", "restoreSelectionAfter")

" Shift Tab - UnIndent
call CreateShortcut("S-Tab", "<<", "in")
call CreateShortcut("S-Tab", "<", "v", "restoreSelectionAfter")

" Ctrl Z - Undo
nnoremap <C-z> u
inoremap <C-z> <C-o>u
vnoremap <C-z> <ESC>u
cnoremap <C-z> <C-c>u

" Ctrl Y - Redo
nnoremap <C-y> <C-r>
inoremap <C-y> <C-o><C-r>
cnoremap <C-y> <C-c><C-r>

" Ctrl T - New tab
call CreateShortcut("C-t", ":tabnew<CR>", "inv", "noTrailingIInInsert", "cmdInVisual")
call CreateShortcut("M-t", ":tabnew<CR>", "inv", "noTrailingIInInsert", "cmdInVisual")
nnoremap <ESC><ESC>t :tabnew<CR>
inoremap <ESC><ESC>t <C-o>:tabnew<CR>
cnoremap <ESC><ESC>t <C-c>:tabnew<CR>
vnoremap <ESC><ESC>t <Esc>:tabnew<CR>
nnoremap <ESC>t :tabnew<CR>
inoremap <ESC>t <C-o>:tabnew<CR>
cnoremap <ESC>t <C-c>:tabnew<CR>
vnoremap <ESC>t <Esc>:tabnew<CR>


" Ctrl N - Next occurrence
nnoremap <C-n> n.l
inoremap <C-n> <C-o>n<C-o>.<C-o>l
vnoremap <C-n> yb/<C-r>"<CR>cgn

" Ctrl P - Previous occurrence
nnoremap <C-p> N.l
inoremap <C-p> <C-o>N<C-o>.<C-o>l
vnoremap <C-p> yb/<C-r>"<CR>cgN

" Terminal Alt Backspace kill a word
nnoremap <Esc><BS> i<C-w><C-g>u
inoremap <Esc><BS> <C-w><C-g>u
vnoremap <Esc><BS> "_di<C-g>u
cnoremap <Esc><BS> <C-w>

" Terminal Alt Right - Next word
" execute "set <M-C>=\e[1;3C"
nnoremap <ESC><ESC>OC w
inoremap <ESC><ESC>OC <C-Right>
cnoremap <ESC><ESC>OC <C-Right>
vnoremap <ESC><ESC>OC <S-Right>
nnoremap <ESC>[1;3C w
inoremap <ESC>[1;3C <C-Right>
cnoremap <ESC>[1;3C <C-Right>
vnoremap <ESC>[1;3C <S-Right>
nnoremap <ESC><ESC>[C w
inoremap <ESC><ESC>[C <C-Right>
cnoremap <ESC><ESC>[C <C-Right>
vnoremap <ESC><ESC>[C <S-Right>
nnoremap <ESC>[1;5C w
inoremap <ESC>[1;5C <C-Right>
cnoremap <ESC>[1;5C <C-Right>
vnoremap <ESC>[1;5C <S-Right>
nnoremap <ESC>[1;9C w
inoremap <ESC>[1;9C <C-Right>
cnoremap <ESC>[1;9C <C-Right>
vnoremap <ESC>[1;9C <S-Right>

" Terminal Alt Left - Previous word
" execute "set <M-D>=\e[1;3D"
nnoremap <ESC><ESC>OD b
inoremap <ESC><ESC>OD <C-Left>
cnoremap <ESC><ESC>OD <C-Left>
vnoremap <ESC><ESC>OD <S-Left>
nnoremap <ESC>[1;3D b
inoremap <ESC>[1;3D <C-Left>
cnoremap <ESC>[1;3D <C-Left>
vnoremap <ESC>[1;3D <S-Left>
nnoremap <ESC><ESC>[D b
inoremap <ESC><ESC>[D <C-Left>
cnoremap <ESC><ESC>[D <C-Left>
vnoremap <ESC><ESC>[D <S-Left>
nnoremap <ESC>[1;5D b
inoremap <ESC>[1;5D <C-Left>
cnoremap <ESC>[1;5D <C-Left>
vnoremap <ESC>[1;5D <S-Left>
nnoremap <ESC>[1;9D b
inoremap <ESC>[1;9D <C-Left>
cnoremap <ESC>[1;9D <C-Left>
vnoremap <ESC>[1;9D <S-Left>

" Terminal Alt Up - Multiple UP keys
execute 'nnoremap <silent> <ESC><ESC>OA '.g:vertical_jump.'k'
execute 'inoremap <silent> <ESC><ESC>OA <C-\><C-O>'.g:vertical_jump.'k'
execute 'vnoremap <silent> <ESC><ESC>OA '.g:vertical_jump.'k'
execute 'nnoremap <silent> <ESC>[1;3A '.g:vertical_jump.'k'
execute 'inoremap <silent> <ESC>[1;3A <C-\><C-O>'.g:vertical_jump.'k'
execute 'vnoremap <silent> <ESC>[1;3A '.g:vertical_jump.'k'
execute 'nnoremap <silent> <ESC><ESC>[A '.g:vertical_jump.'k'
execute 'inoremap <silent> <ESC><ESC>[A <C-\><C-O>'.g:vertical_jump.'k'
execute 'vnoremap <silent> <ESC><ESC>[A '.g:vertical_jump.'k'
execute 'nnoremap <silent> <ESC>[1;5A '.g:vertical_jump.'k'
execute 'inoremap <silent> <ESC>[1;5A <C-\><C-O>'.g:vertical_jump.'k'
execute 'vnoremap <silent> <ESC>[1;5A '.g:vertical_jump.'k'
execute 'nnoremap <silent> <ESC>[1;9A '.g:vertical_jump.'k'
execute 'inoremap <silent> <ESC>[1;9A <C-\><C-O>'.g:vertical_jump.'k'
execute 'vnoremap <silent> <ESC>[1;9A '.g:vertical_jump.'k'

" Terminal Alt Down - Multiple DOWN keys
execute 'nnoremap <silent> <ESC><ESC>OB '.g:vertical_jump.'j'
execute 'inoremap <silent> <ESC><ESC>OB <C-\><C-O>'.g:vertical_jump.'j'
execute 'vnoremap <silent> <ESC><ESC>OB '.g:vertical_jump.'j'
execute 'nnoremap <silent> <ESC>[1;3B '.g:vertical_jump.'j'
execute 'inoremap <silent> <ESC>[1;3B <C-\><C-O>'.g:vertical_jump.'j'
execute 'vnoremap <silent> <ESC>[1;3B '.g:vertical_jump.'j'
execute 'nnoremap <silent> <ESC><ESC>[B '.g:vertical_jump.'j'
execute 'inoremap <silent> <ESC><ESC>[B <C-\><C-O>'.g:vertical_jump.'j'
execute 'vnoremap <silent> <ESC><ESC>[B '.g:vertical_jump.'j'
execute 'nnoremap <silent> <ESC>[1;5B '.g:vertical_jump.'j'
execute 'inoremap <silent> <ESC>[1;5B <C-\><C-O>'.g:vertical_jump.'j'
execute 'vnoremap <silent> <ESC>[1;5B '.g:vertical_jump.'j'
execute 'nnoremap <silent> <ESC>[1;9B '.g:vertical_jump.'j'
execute 'inoremap <silent> <ESC>[1;9B <C-\><C-O>'.g:vertical_jump.'j'
execute 'vnoremap <silent> <ESC>[1;9B '.g:vertical_jump.'j'

" Delete selected characters before Entering the insert mode
nnoremap <C-Del> "_dwi
inoremap <C-Del> <C-o>"_dw<C-g>u
vnoremap <C-BS> "_di

" Alt - Backspace kill a word
nnoremap <A-BS> i<C-w><C-g>u
inoremap <A-BS> <C-w><C-g>u
vnoremap <A-BS> "_d
cnoremap <A-BS> <C-w>

" Alt - Arrow, Move like Ctrl keys, in case Ctrl key is not working
execute 'nnoremap <silent> <A-Up> '.g:vertical_jump.'k'
execute 'inoremap <silent> <A-Up> <C-\><C-O>'.g:vertical_jump.'k'
execute 'vnoremap <silent> <A-Up> '.g:vertical_jump.'k'
execute 'nnoremap <silent> <A-Down> '.g:vertical_jump.'j'
execute 'inoremap <silent> <A-Down> <C-\><C-O>'.g:vertical_jump.'j'
execute 'vnoremap <silent> <A-Down> '.g:vertical_jump.'j'
nnoremap <A-Right> w
inoremap <A-Right> <C-Right>
cnoremap <A-Right> <C-Right>
vnoremap <A-Right> <S-Right>
nnoremap <A-Left> b
inoremap <A-Left> <C-Left>
cnoremap <A-Left> <C-Left>
vnoremap <A-Left> <S-Left>

" Ctrl Left - Previous 5 column
vnoremap <C-Left> <S-Left>

" Ctrl Right - Next 5 column
vnoremap <C-Right> <S-Right>

" Ctrl O - Netrw (:Explore)
call CreateShortcut("C-o",":call OpenNetrw()<CR>", "inv", "noTrailingIInInsert", "cmdInVisual")

" Byobu key binding
call CreateShortcut("F2", ":tabnew<CR>", "inv")
call CreateShortcut("F3", ":tabp<CR>", "inv")
call CreateShortcut("F4", ":tabn<CR>", "inv")

" Ctrl \ is toggling comments
nnoremap <silent> <C-\> :call ToggleComment()<CR>
inoremap <silent> <C-\> <C-o>:call ToggleComment()<CR>
vnoremap <silent> <C-\> :call ToggleComment()<CR>

inoremap <C-b> <C-w><C-g>u
nnoremap <C-b> i<C-w><C-g>u
cnoremap <C-b> <C-w>
nnoremap <Del> i<Del>

" minus key is folding/unfolding code
nnoremap - zi

" Useful command mode mapping
cnoremap <C-k> <C-e><C-u>
cnoremap <C-f> <C-c>:noh<CR>:redraw<CR>/
cnoremap <C-r> <C-c>:noh<CR>:redraw<CR>:%s/
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

""" Case insensitive when entering command mode
nnoremap : :noh<CR>:redraw<CR>:set ignorecase<CR>:
nnoremap / :noh<CR>:redraw<CR>:set noignorecase<CR>/

inoremap <C-CR> <C-o>o<C-g>u
nnoremap <C-CR> o<C-g>u
inoremap <C-BS> <C-g>u<C-W>
nnoremap <C-BS> i<C-g>u<C-W>
cnoremap <C-BS> <C-w>
inoremap <C-_> <C-W><C-g>u
nnoremap <C-_> i<C-W><C-g>u
cnoremap <C-_> <C-w>
vnoremap <bar> I
vnoremap <Space> "_di<Space><C-g>u
vnoremap <CR> "_di<CR><C-g>u
vnoremap <BS> "_di<C-g>u

function! WrapSelection(c1, c2)
  " Disable auto indention temporary
  let l:ind=&indentexpr
  setlocal indentexpr=
  execute "normal! `<i".a:c1
  execute "normal! `>a".a:c2
  normal! l
  execute "setlocal indentexpr=".l:ind
endfunction
function! AutoPair(ac)
  redraw
  let c = nr2char(getchar())
  if c == "\<CR>"
    return "\<CR>".a:ac."\<C-o>O\<C-g>u"
  else
    call feedkeys(c)
  endif
  return ""
endfunction

vnoremap <silent> ` <ESC>:call WrapSelection("`","`")<CR>
vnoremap <silent> ( <ESC>:call WrapSelection("(",")")<CR>
vnoremap <silent> [ <ESC>:call WrapSelection("[","]")<CR>
vnoremap <silent> { <ESC>:call WrapSelection("{","}")<CR>
vnoremap <silent> ) <ESC>:call WrapSelection("(",")")<CR>
vnoremap <silent> ] <ESC>:call WrapSelection("[","]")<CR>
vnoremap <silent> } <ESC>:call WrapSelection("{","}")<CR>
vnoremap <silent> ' <ESC>:call WrapSelection("'","'")<CR>
vnoremap <silent> " <ESC>:call WrapSelection("\"","\"")<CR>
vnoremap <silent> < <ESC>:call WrapSelection("<",">")<CR>
vnoremap <silent> > <ESC>:call WrapSelection("<",">")<CR>
vnoremap <silent> / <ESC>:call WrapSelection("/","/")<CR>
vnoremap <silent> \ <ESC>:call WrapSelection("\\","\\")<CR>
inoremap <silent> { {<C-r>=AutoPair("}")<CR>
inoremap <silent> [ [<C-r>=AutoPair("]")<CR>
inoremap <silent> ( (<C-r>=AutoPair(")")<CR>

" Commenting blocks of code.
autocmd FileType c,cpp,java,go      let b:comment_leader = '\/\/'
autocmd FileType javascript         let b:comment_leader = '\/\/'
autocmd FileType arduino,groovy     let b:comment_leader = '\/\/'
autocmd FileType registry           let b:comment_leader = ';'
autocmd FileType dosini             let b:comment_leader = '#'
autocmd FileType dosbatch           let b:comment_leader = '::'
autocmd FileType sh,fish,ps1        let b:comment_leader = '#'
autocmd FileType ruby,python        let b:comment_leader = '#'
autocmd FileType conf,fstab         let b:comment_leader = '#'
autocmd FileType tmux,zsh           let b:comment_leader = '#'
autocmd FileType sshconfig          let b:comment_leader = '#'
autocmd FileType make,cmake         let b:comment_leader = '#'
autocmd FileType debsources,desktop let b:comment_leader = '#'
autocmd FileType xdefaults          let b:comment_leader = '!'
autocmd FileType dockerfile         let b:comment_leader = '#'
autocmd FileType jproperties        let b:comment_leader = '#'
autocmd FileType gitconfig          let b:comment_leader = '#'
autocmd FileType yaml,toml          let b:comment_leader = '#'
autocmd FileType matlab,tex         let b:comment_leader = '%'
autocmd FileType vim                let b:comment_leader = '"'
autocmd FileType sql,lua            let b:comment_leader = '--'
autocmd FileType css                let b:comment_leader = '\/\*'   |   let b:comment_ender = '\*\/'
autocmd FileType html,xml,markdown  let b:comment_leader = '<!--'   |   let b:comment_ender = '-->'

function! ToggleComment()
  if exists('b:comment_leader')
    if getline(".") =~ '^' . b:comment_leader
      " Uncomment the line
      execute 'silent s/^' . b:comment_leader .'\( \)\?//g'
      if exists('b:comment_ender')
        execute 'silent s/ ' . b:comment_ender .'$//g'
      endif
    elseif getline(".") =~ '^\s*$'
      " Empty lines: ignore
    else
      " Comment the line
      execute 'silent s/^/' . b:comment_leader .' /g'
      if exists('b:comment_ender')
        execute 'silent s/$/\ ' . b:comment_ender .'/g'
      endif
    endif
  else
    echom "Unknown comment's symbols for filetype"
  endif
endfunction

" autocmd Filetype * setlocal omnifunc=syntaxcomplete#Complete
autocmd FileType * exe 'setlocal dictionary+=$VIMRUNTIME/syntax/'.&filetype.'.vim'
set completeopt=menuone
set complete=.,w,b,t
set complete+=k " Rescan files in the 'dictionary' option
if (v:version == 704 && has("patch314")) || has('patch-7.4.314') || v:version > 704
  set shortmess+=c " Disable autocomplete WarningMsg
endif
if (v:version == 704 && has("patch1570")) || has('patch-7.4.1570') || v:version > 704
  set shortmess+=F " Disable file info on start
endif
let autocomp=1
let g:CharSet = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_"
inoremap <silent> <F10> <C-\><C-O>:call ToggleAutoComplete()<CR>
vnoremap <silent> <F10> <ESC>:call ToggleAutoComplete()<CR>
nnoremap <silent> <F10>      :call ToggleAutoComplete()<CR>
inoremap <expr> <Tab>  pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <CR>   pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <Down> pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>   pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <ESC>  pumvisible() ? "\<C-e>\<C-g>u" : "\<ESC>"
inoremap <ESC>A <Up>
inoremap <ESC>B <Down>
inoremap <ESC>C <Right>
inoremap <ESC>D <Left>

function! ToggleAutoComplete()
  if g:autocomp
    for l:char in split(g:CharSet, '\zs')
      execute "inoremap <silent> <expr> ".l:char." pumvisible() ? '".l:char."' : '".l:char."\<C-n>\<C-p>'"
    endfor
  else
    for l:char in split(g:CharSet, '\zs')
      execute "inoremap ".l:char." ".l:char
    endfor
  endif
  let g:autocomp=g:autocomp ? 0 : 1
endfunction
call ToggleAutoComplete()
command! AutoCompleteEnable  let g:autocomp=1 | call ToggleAutoComplete()
command! AutoCompleteDisable let g:autocomp=0 | call ToggleAutoComplete()

command! SshPasteEnable  let g:autocomp=0 | call ToggleAutoComplete() | set paste
command! SshPasteDisable let g:autocomp=1 | call ToggleAutoComplete() | set nopaste

function! SshPaste()
  inoremap <silent> [ [
  inoremap <silent> { {
  inoremap <silent> ( (
  set noautoindent
  set nosmartindent
  set nocindent
  let g:autocomp=0 | call ToggleAutoComplete()
endfunction

if exists("$SSH_CLIENT") || exists("$SSH_TTY") || exists("g:isDocker")
  " Disable paste and completion when using ssh
  call SshPaste()
endif

let g:netrw_banner=0 " Hide banner
" let g:netrw_list_hide='\(^\|\s\s\)\zs\.\S\+' " Hide hidden files
autocmd FileType netrw call KeysInNetrw()
function! KeysInNetrw() " Map keys in file explorer
  " Right to enter
  nmap <buffer> <Right> <CR>
  " Left to go up
  nmap <buffer> <Left> -
  " l - Display info
  nmap <buffer> l qf
  " C-k - Delete files/directories
  nmap <buffer> <C-k> D
  vmap <buffer> <C-k> D
  " v - Enter to visual mode to select files
  nmap <buffer> v V
  " Backspace - go back
  nmap <buffer> <BS> u
  " Space to enter
  nmap <buffer> <Space> <CR>
  " Tab to go down an entry
  nmap <buffer> <Tab> j
endfunction

""" Custom commands

" :UndoCloseTab - To undo close tab
command! UndoCloseTab call OpenLastBufferInNewTab()

""" Colors and Statusline

let defaultAccentColor=161
let defaultAccentColor16=12
let colorsAndModes= {
  \ 'i' : 39,
  \ 'v' : 82,
  \ 'V' : 226,
  \ '' : 208,
  \ 't' : 208
\}
let colorsAndModes16= {
  \ 'i' : 11,
  \ 'v' : 10,
  \ 'V' : 14,
  \ '' : 14,
  \ 't' : 14
\}
let defaultAccentColorGui='#D7005F'
let colorsAndModesGui= {
  \ 'i' : '#00AFFF',
  \ 'v' : '#5FFF00',
  \ 'V' : '#FFFF00',
  \ '' : '#FF8700',
  \ 't' : '#FF8700'
\}
function! LastAccentColor()
  if !exists('b:lastMode')
    let b:lastMode = g:currentmode[mode()]
    if &t_Co == "16" | call ChangeAccentColor16() | else | call ChangeAccentColor() | endif
  elseif b:lastMode != g:currentmode[mode()]
    let b:lastMode = g:currentmode[mode()]
    if &t_Co == "16" | call ChangeAccentColor16() | else | call ChangeAccentColor() | endif
  endif
  return ''
endfunction
" autocmd CursorHold,CursorHoldI * call LastAccentColor()
function! ChangeAccentColor()
  let accentColor=get(g:colorsAndModes, mode(), g:defaultAccentColor)
  let accentColorGui=get(g:colorsAndModesGui, mode(), g:defaultAccentColorGui)
  execute 'hi! User1 ctermfg=0 guifg=#000000 ctermbg=' . accentColor . ' guibg=' . accentColorGui
  execute 'hi! User2 ctermbg=0 guibg=#2E3436 ctermfg=' . accentColor . ' guifg=' . accentColorGui
  execute 'hi! User3 ctermfg=0 guifg=#000000 cterm=NONE gui=NONE ctermbg=' . accentColor . ' guibg=' . accentColorGui
  execute 'hi! TabLineSel ctermfg=0 guifg=#000000 cterm=NONE gui=NONE ctermbg=' . accentColor . ' guibg=' . accentColorGui
  execute 'hi! TabLine ctermbg=233 cterm=NONE gui=NONE ctermfg=' . accentColor
  execute 'hi! CursorLineNr ctermfg=' . accentColor . ' guifg=' . accentColorGui
  return ''
endfunction
function! ChangeAccentColor16()
  let accentColor=get(g:colorsAndModes16, mode(), g:defaultAccentColor16)
  let accentColorGui=get(g:colorsAndModesGui, mode(), g:defaultAccentColorGui)
  execute 'hi! User1 ctermfg=0 ctermbg=' . accentColor
  execute 'hi! User2 ctermbg=0 ctermfg=' . accentColor
  execute 'hi! User3 ctermfg=0 cterm=NONE ctermbg=' . accentColor
  execute 'hi! TabLineSel ctermfg=0 cterm=NONE ctermbg=' . accentColor
  execute 'hi! TabLine ctermbg=0 ctermfg=' . accentColor
  execute 'hi! CursorLineNr ctermfg=' . accentColor
  return ''
endfunction

" Modified from https://github.com/google/vim-searchindex
function! SearchCount()
  if @/ == ""
    return '0/0 on 0 lines'
  endif
  " both :s and search() modify cursor position
  let win_view = winsaveview()
  " folds affect range of ex commands (issue #4)
  let save_foldenable = &foldenable
  set nofoldenable

  let in_line = MatchInLine()

  let cache_key = [b:changedtick, @/]
  if exists('b:searchindex_cache_key') && b:searchindex_cache_key ==# cache_key
    let before = MatchesAbove(b:searchindex_cache_val)
    let total = b:searchindex_cache_val[-1]
  else
    let gflag = &gdefault ? '' : 'g'
    let before = (line('.') == 1 ? 0 : MatchesInRange('1,-1'))
    let total = before + MatchesInRange(',$')
    redir => cnt
      silent! exe '%s/' . @/ . '//ne' . gflag
    redir END
    let b:cacheTotalLine = matchstr( matchstr(cnt, '\w\+'), '\d\+' )
  endif

  let b:searchindex_cache_val = [line('.'), before, total]
  let b:searchindex_cache_key = cache_key

  let &foldenable = save_foldenable
  call winrestview(win_view)
  if !exists('b:cacheTotalLine') || b:cacheTotalLine==0 | let b:cacheTotalLine=0 | endif
  " return [before + in_line, total]
  let endS = (b:cacheTotalLine == '1') ? "" : "s"
  return before + in_line . '/' . total . ' on ' . b:cacheTotalLine . ' line' . endS
endfunction
function MatchesAbove(cached_values)
  " avoid wrapping range at the beginning of file
  if line('.') == 1 | return 0 | endif

  let [old_line, old_result, total] = a:cached_values
  " Find the nearest point from which we can restart match counting (top,
  " bottom, or previously cached line).
  let line = line('.')
  let to_top = line
  let to_old = abs(line - old_line)
  let to_bottom = line('$') - line
  let min_dist = min([to_top, to_old, to_bottom])

  if min_dist == to_top
    return MatchesInRange('1,.-1')
  elseif min_dist == to_bottom
    return total - MatchesInRange(',$')
  " otherwise, min_dist == to_old, we just need to check relative line order
  elseif old_line < line
    return old_result + MatchesInRange(old_line . ',-1')
  elseif old_line > line
    return old_result - MatchesInRange(',' . (old_line - 1))
  else " old_line == line
    return old_result
  endif
endfunction
function! MatchInLine()
  let line = line('.')
  let col = col('.')
  let star_search = 0

  normal! 0
  let matches = 0
  let s_opt = 'c'
  " The count might be off in edge cases (e.g. regexes that allow empty match,
  " like 'a*'). Unfortunately, Vim's searching functions are so inconsistent
  " that I can't fix this.
  try
    while search(@/, s_opt, line) && col('.') <= col
      let matches += 1
      let s_opt = ''
    endwhile
  catch /:E866:/
  endtry

  return matches
endfunction
function! MatchesInRange(range)
  " Use :s///n to search efficiently in large files. Although calling search()
  " in the loop would be cleaner (see issue #18), it is also much slower.
  let gflag = &gdefault ? '' : 'g'
  let saved_marks = [ getpos("'["), getpos("']") ]
  let output = ''
  redir => output
    silent! execute 'keepjumps ' . a:range . 's//~/en' . gflag
  redir END
  call setpos("'[", saved_marks[0])
  call setpos("']", saved_marks[1])
  return str2nr(matchstr(output, '\d\+'))
endfunction

function! ReadOnly()
  return (&readonly || !&modifiable) ? 'Read Only ' : ''
endfunction
"  Get all mode in :h mode()
let g:currentmode={
    \ 'n'  : 'Normal',
    \ 'no' : 'N·Operator Pending',
    \ 'v'  : 'Visual',
    \ 'V'  : 'V·Line',
    \ '' : 'VBlock',
    \ 's'  : 'Select',
    \ 'S'  : 'S·Line',
    \ '^S' : 'S·Block',
    \ 'i'  : 'Insert',
    \ 'ic' : 'Insert',
    \ 'ix' : 'Insert',
    \ 'R'  : 'Replace',
    \ 'Rc' : 'Replace',
    \ 'Rv' : 'VReplace',
    \ 'Rx' : 'Replace',
    \ 'c'  : 'Command',
    \ 'cv' : 'Vim Ex',
    \ 'ce' : 'Ex',
    \ 'r'  : 'Prompt',
    \ 'rm' : 'More',
    \ 'r?' : 'Confirm',
    \ '!'  : 'Shell',
    \ 't'  : 'Terminal'
\}
set statusline=
set statusline+=%{LastAccentColor()}
set statusline+=%1*\ ***%{toupper(g:currentmode[mode()])}***\  " Current mode
set statusline+=%2*\ %<%F\  " Filepath
set statusline+=%2*\ [%{SearchCount()}] " Nth of N when searching
set statusline+=%2*\ %= " To the right
set statusline+=%2*\ %{toupper((&fenc!=''?&fenc:&enc))}\[%{&ff}] " Encoding & Fileformat
set statusline+=%2*\ %{GetIndent()} " Filetype
set statusline+=%2*\ [%{&filetype}] " Filetype
set statusline+=%2*\ %{ReadOnly()} " ReadOnly Flags
set statusline+=%1*\ \%l/%L(%P)-%c\  " Position

function! SyntaxMonokai()

  """""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Modified from tomasr Molokai on Github              "
  "                                                     "
  """""""""""""""""""""""""""""""""""""""""""""""""""""""

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " If terminal true colors are supported                                        "
  "                                                                              "
  " 00 black         #1B1D1E  rgb( 27,   29,   30), 233, rgb%{ 11,   11,     12} "
  " 01 dark red      #E90000  rgb(233,    0,    0), 160, rgb%{ 91,    0,      0} "
  " 02 dark green    #00AF00  rgb(  0,  175,    0), 034, rgb%{  0,   69,      0} "
  " 03 dark yellow   #F4BF75  rgb(244,  191,  117), 011, rgb%{ 96,   75,     46} "
  " 04 dark blue     #00AFFF  rgb(  0,  175,  255), 081, rgb%{ 40,   85,     94} "
  " 05 dark magenta  #AE81FF  rgb(174,  129,  255), 135, rgb%{ 68,   51,    100} "
  " 06 dark cyan     #A1EFE4  rgb(161,  239,  228), 014, rgb%{ 63,   94,     89} "
  " 07 light gray    #F8F8F2  rgb(248,  248,  242), 252, rgb%{ 97,   97,     95} "
  " 08 dark gray     #7E8E91  rgb(126,  142,  145), 059, rgb%{ 49,   56,     57} "
  " 09 light red     #F92672  rgb(249,   38,  114), 161, rgb%{ 98,   15,     45} "
  " 10 light green   #A6E22E  rgb(166,  226,   46), 118, rgb%{ 65,   89,     18} "
  " 11 light yellow  #FFFF00  rgb(255,  255,    0), 144, rgb%{100,  100,      0} "
  " 12 light blue    #66D9EF  rgb(102,  217,  239), 039, rgb%{ 40,   85,     94} "
  " 13 light magenta #AE81FF  rgb(174,  129,  255), 135, rgb%{ 68,   51,    100} "
  " 14 light cyan    #A1EFE4  rgb(161,  239,  228), 014, rgb%{ 63,   94,     89} "
  " 15 white         #F8F8F2  rgb(248,  248,  242), 252, rgb%{ 97,   97,     95} "
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  try
    set background=light
    syntax enable " Enable syntax highlights
  catch /:E484:\|:E185:/
    " E484: Syntax files not found, using HighlightGlobal"
    autocmd BufRead,BufNewFile,BufWritePost,FileType,ColorScheme * call HighlightGlobal()
    call HighlightGlobal()
  endtry
"   set background=dark
  highlight clear
  syntax reset
  set t_Co=256

  let g:is_bash=1 " Tell $VIMRUNTIME/syntax/sh.vim that I am using bash
  let python_highlight_all = 1 " Tell $VIMRUNTIME/syntax/python.vim to highlight all

  " Normal is the background color
  " hi Normal ctermfg=252 ctermbg=233 cterm=NONE guifg=#F8F8F2 guibg=#1B1D1E gui=NONE
  hi Normal guifg=#F8F8F2 guibg=#1B1D1E gui=NONE
  " Visual is the selection color
  hi Visual ctermfg=255 ctermbg=39 cterm=NONE guifg=White guibg=#00AFFF gui=NONE
  " Pmenu is the popup autocomplete color
  hi Pmenu ctermfg=255 ctermbg=39 cterm=NONE guifg=White guibg=#00AFFF
  hi PmenuSel ctermfg=39 ctermbg=255 cterm=NONE guifg=#00AFFF guibg=White

  hi Green      ctermfg=34 ctermbg=NONE cterm=NONE guifg=#00AF00 guibg=NONE gui=NONE
  hi iGreen     ctermfg=0 ctermbg=34 cterm=NONE guifg=#000000 guibg=#00AF00 gui=NONE
  hi Blue       ctermfg=39 ctermbg=NONE cterm=NONE guifg=#00AFFF guibg=NONE gui=NONE
  hi iBlue      ctermfg=0 ctermbg=39 cterm=NONE guifg=#000000 guibg=#00AFFF gui=NONE
  hi Search     ctermfg=59 ctermbg=226 cterm=NONE guibg=yellow guifg=black  gui=NONE
  hi IncSearch  ctermfg=255 ctermbg=34  cterm=NONE guibg=#00FF00 guifg=black gui=NONE

  " Init StatusLine colors
  if !exists('b:lastMode') | let b:lastMode = g:currentmode[mode()] | call ChangeAccentColor() | endif

  hi Boolean              ctermfg=135     guifg=#AE81FF
  hi Character            ctermfg=144     guifg=#E6DB74
  hi ColorColumn          ctermbg=236     guibg=#232526
  hi Comment              ctermfg=59      guifg=#7E8E91
  hi Conditional          ctermfg=161     cterm=none      guifg=#F92672     gui=none
  hi Constant             ctermfg=135     cterm=none      guifg=#AE81FF     gui=none
  hi Cursor               ctermfg=16      ctermbg=253     guifg=#000000     guibg=#F8F8F0
  hi CursorColumn         ctermbg=236     guibg=#293739
  hi CursorLine           ctermbg=234     cterm=none      guibg=#293739
  hi Debug                ctermfg=225     cterm=none      guifg=#BCA3A3     gui=none
  hi Define               ctermfg=81      guifg=#66D9EF
  hi Delimiter            ctermfg=241     guifg=#8F8F8F
  hi DiffAdd              ctermfg=118     guifg=#A6E22E   ctermbg=239       guibg=#4C4745
  hi DiffDelete           ctermfg=161     cterm=none      guifg=#F92672     gui=none            ctermbg=239       guibg=#4C4745
  hi DiffChange           ctermfg=181     ctermbg=239     guifg=#89807D     guibg=#4C4745
  hi DiffText             cterm=none      ctermbg=208     gui=none          guibg=#FD971F       ctermfg=233       guifg=#1B1D1E
  hi Directory            ctermfg=81      cterm=none      guifg=#66D9EF     gui=none
  hi Error                ctermfg=255     ctermbg=196     guifg=#E6DB74     guibg=#FF3333
  hi ErrorMsg             ctermfg=199     ctermbg=16      cterm=none        guifg=#F92672       guibg=#232526     gui=none
  hi Exception            ctermfg=118     cterm=none      guifg=#A6E22E     gui=none
  hi Float                ctermfg=135     guifg=#AE81FF
  hi FoldColumn           ctermfg=67      ctermbg=16      guifg=#465457     guibg=#000000
  hi Folded               ctermfg=242     ctermbg=235     cterm=NONE        guifg=#7E8E91       guibg=#272822     gui=NONE
  hi Function             ctermfg=118     guifg=#A6E22E
  hi Identifier           ctermfg=208     cterm=none      guifg=#FD971F
  hi Ignore               ctermfg=244     ctermbg=232     guifg=#808080     guibg=bg
  hi Keyword              ctermfg=161     cterm=none      guifg=#F92672     gui=none
  hi Label                ctermfg=229     cterm=none      guifg=#E6DB74     gui=none
  hi LineNr               ctermfg=250     ctermbg=236     guifg=#465457     guibg=#232526
  hi Macro                ctermfg=193     guifg=#C4BE89   gui=none
  hi MatchParen           ctermfg=233     ctermbg=208     cterm=none        guifg=#000000       guibg=#FD971F     gui=none
  hi MoreMsg              ctermfg=229     guifg=#E6DB74
  hi NonText              ctermfg=59      guifg=#465457
  hi Number               ctermfg=135     guifg=#AE81FF
  hi Operator             ctermfg=161     guifg=#F92672
  hi PmenuSbar            ctermbg=232     guibg=#080808
  hi PmenuThumb           ctermfg=81      guifg=#66D9EF
  hi PreCondit            ctermfg=118     cterm=none      guifg=#A6E22E     gui=none
  hi PreProc              ctermfg=118     cterm=none      guifg=#A6E22E
  hi Question             ctermfg=81      guifg=#66D9EF
  hi Repeat               ctermfg=161     cterm=none      guifg=#F92672     gui=none
  hi SignColumn           ctermfg=118     ctermbg=235     guifg=#A6E22E     guibg=#232526
  hi Special              ctermfg=81      guifg=#66D9EF   guibg=bg          gui=none
  hi SpecialChar          ctermfg=161     cterm=none      guifg=#F92672     gui=none
  hi SpecialComment       ctermfg=245     cterm=none      guifg=#7E8E91     gui=none
  hi SpecialKey           ctermfg=81      guifg=#66D9EF   gui=none
  hi SpellBad             ctermbg=52      cterm=underline
  hi SpellCap             ctermbg=17      cterm=underline
  hi SpellLocal           ctermbg=17      cterm=underline
  hi Statement            ctermfg=161     cterm=none      guifg=#F92672     gui=none
  hi StatusLine           ctermfg=238     ctermbg=253     guifg=#455354     guibg=fg
  hi StatusLineNC         ctermfg=244     ctermbg=232     guifg=#808080     guibg=#080808
  hi StorageClass         ctermfg=208     guifg=#FD971F   gui=none
  hi String               ctermfg=144     guifg=#E6DB74
  hi Structure            ctermfg=81      guifg=#66D9EF
  hi TabLineFill          cterm=none      ctermbg=none    guifg=#1B1D1E     guibg=#1B1D1E
  hi Tag                  ctermfg=161     guifg=#F92672   gui=none
  hi Title                ctermfg=166     guifg=#EF5939
  hi Todo                 ctermfg=231     ctermbg=232     cterm=none        guifg=#FFFFFF       guibg=bg        gui=none
  hi Type                 ctermfg=81      cterm=none      guifg=#66D9EF     gui=none
  hi Typedef              ctermfg=81      guifg=#66D9EF
  hi Underlined           ctermfg=244     cterm=underline guifg=#808080     gui=underline
  hi VertSplit            ctermfg=244     ctermbg=232     cterm=none        guifg=#808080       guibg=#080808   gui=none
  hi WarningMsg           ctermfg=231     ctermbg=238     cterm=none        guifg=#FFFFFF       guibg=#333333   gui=none
  hi WildMenu             ctermfg=81      ctermbg=16      guifg=#66D9EF     guibg=#000000
  hi iCursor              guifg=#000000   guibg=#F8F8F0

  hi def link diffAdded       Function
  hi def link diffRemoved     Conditional
  hi def link diffChanged     Define

  if has("win32unix") || ( !has("gui_running") && ( has("win32") && has("win64") ) ) && !has("nvim")
    if !executable("uname")
      " Powershell
      call SyntaxMonokai16color()
    elseif &shell =~ "cmd.exe" || &shell =~ "command.com" || &shell =~ "powershell"
      " CMD or Powershell, I guess :)
      call SyntaxMonokai16color()
    endif
  endif
endfunction
call SyntaxMonokai()

function! SyntaxMonokai16color()

  " 16 Colors monokai-like theme

  highlight clear
  syntax reset
  set t_Co=16

  " Normal is the background color
  " hi Normal ctermfg=7 ctermbg=0 cterm=NONE
  " Visual is the selection color
  hi Visual ctermfg=15 ctermbg=3 cterm=NONE
  " Pmenu is the popup autocomplete color
  hi Pmenu ctermfg=7 ctermbg=2 cterm=NONE
  hi PmenuSel ctermfg=2 ctermbg=7 cterm=NONE

  hi Green      ctermfg=10 ctermbg=NONE cterm=NONE
  hi iGreen     ctermfg=0 ctermbg=10 cterm=NONE
  hi Blue       ctermfg=11 ctermbg=NONE cterm=NONE
  hi iBlue      ctermfg=0 ctermbg=11 cterm=NONE
  hi Search     ctermfg=8 ctermbg=14 cterm=NONE
  hi IncSearch  ctermfg=7 ctermbg=10  cterm=NONE

  " Init StatusLine colors
  call ChangeAccentColor16()

  hi Boolean              ctermfg=13
  hi Character            ctermfg=11
  hi ColorColumn          ctermbg=0
  hi Comment              ctermfg=8
  hi Conditional          ctermfg=12      cterm=none
  hi Constant             ctermfg=13      cterm=none
  hi Cursor               ctermfg=0       ctermbg=7
  hi CursorColumn         ctermbg=0
  hi CursorLine           ctermbg=1       cterm=none
  hi Debug                ctermfg=15      cterm=none
  hi Define               ctermfg=11
  hi Delimiter            ctermfg=8
  hi DiffAdd              ctermfg=10      ctermbg=8
  hi DiffDelete           ctermfg=12      ctermbg=8
  hi DiffChange           ctermfg=8       ctermbg=5
  hi DiffText             ctermfg=0       ctermbg=14
  hi Directory            ctermfg=11      cterm=none
  hi Error                ctermfg=7       ctermbg=12
  hi ErrorMsg             ctermfg=12      ctermbg=0      cterm=none
  hi Exception            ctermfg=10      cterm=none
  hi Float                ctermfg=13
  hi FoldColumn           ctermfg=11      ctermbg=0
  hi Folded               ctermfg=8       ctermbg=0     cterm=NONE
  hi Function             ctermfg=10
  hi Identifier           ctermfg=14      cterm=none
  hi Ignore               ctermfg=8       ctermbg=0
  hi Keyword              ctermfg=12      cterm=none
  hi Label                ctermfg=14      cterm=none
  hi LineNr               ctermfg=7       ctermbg=0
  hi Macro                ctermfg=10
  hi MatchParen           ctermfg=0       ctermbg=14     cterm=none
  hi MoreMsg              ctermfg=14
  hi NonText              ctermfg=8
  hi Number               ctermfg=13
  hi Operator             ctermfg=12
  hi PmenuSbar            ctermbg=0
  hi PmenuThumb           ctermfg=11
  hi PreCondit            ctermfg=10      cterm=none
  hi PreProc              ctermfg=10      cterm=none
  hi Question             ctermfg=11
  hi Repeat               ctermfg=12      cterm=none
  hi SignColumn           ctermfg=10      ctermbg=0
  hi Special              ctermfg=11
  hi SpecialChar          ctermfg=12      cterm=none
  hi SpecialComment       ctermfg=8       cterm=none
  hi SpecialKey           ctermfg=11
  hi SpellBad             ctermbg=52      cterm=underline
  hi SpellCap             ctermbg=17      cterm=underline
  hi SpellLocal           ctermbg=17      cterm=underline
  hi Statement            ctermfg=12      cterm=none
  hi StatusLine           ctermfg=0       ctermbg=7
  hi StatusLineNC         ctermfg=8       ctermbg=0
  hi StorageClass         ctermfg=14
  hi String               ctermfg=11
  hi Structure            ctermfg=11
  hi TabLineFill          cterm=none      ctermbg=none
  hi Tag                  ctermfg=12
  hi Title                ctermfg=14
  hi Todo                 ctermfg=15      ctermbg=0     cterm=none
  hi Type                 ctermfg=11      cterm=none
  hi Typedef              ctermfg=11
  hi Underlined           ctermfg=7       cterm=underline
  hi VertSplit            ctermfg=7       ctermbg=0     cterm=none
  hi WarningMsg           ctermfg=15      ctermbg=8     cterm=none
  hi WildMenu             ctermfg=11      ctermbg=0
endfunction

" :OpenDroppedFiles <Drop_Files_To_Vim>
function! OpenDroppedFiles(droppedFiles)
  execute "silent! argadd " . a:droppedFiles
  silent argdo set eventignore-=Syntax | tabedit
endfunction
command! -nargs=1 OpenDroppedFiles call OpenDroppedFiles(<f-args>)

if has("win32") || has("win64")
  let $PATH .= ';C:\ProgramData\Miniconda2' " choco install miniconda
  let $PATH .= ';C:\ProgramData\Miniconda3' " choco install miniconda3
"   set pythondll=python27.dll " set python2 dll name
"   set pythonthreedll=python36.dll " set python3 dll name
endif

if has("python")
python << EOF
import vim
import json
def FormatJSON(fmtlStart, fmtlEnd):
  fmtlStart = fmtlStart-1
  jsonStr = "\n".join(vim.current.buffer[fmtlStart:fmtlEnd])
  prettyJson = json.dumps(json.loads(jsonStr), sort_keys=False, indent=4, separators=(',', ': '), ensure_ascii=False).encode('utf8')
  vim.current.buffer[fmtlStart:fmtlEnd] = prettyJson.split('\n')
EOF
  " :'<,'>JsonBeautify
  command! -range=% JsonBeautify set filetype=json | python FormatJSON(<line1>, <line2>)
  nnoremenu Edit.Json.Beautify(UTF8)  ggVG:<C-u>'<,'>JsonBeautify<CR>
  inoremenu Edit.Json.Beautify(UTF8)  <ESC>ggVG:<C-u>'<,'>JsonBeautify<CR>
  vnoremenu Edit.Json.Beautify(UTF8)  :<C-u>'<,'>JsonBeautify<CR>
elseif has("python3")
python3 << EOF
import vim
import json
def FormatJSON(fmtlStart, fmtlEnd):
  fmtlStart = fmtlStart-1
  jsonStr = "\n".join(vim.current.buffer[fmtlStart:fmtlEnd])
  prettyJson = json.dumps(json.loads(jsonStr), sort_keys=False, indent=4, separators=(',', ': '), ensure_ascii=False)
  vim.current.buffer[fmtlStart:fmtlEnd] = prettyJson.split('\n')
EOF
  " :'<,'>JsonBeautify
  command! -range=% JsonBeautify set filetype=json | python3 FormatJSON(<line1>, <line2>)
  nnoremenu Edit.Json.Beautify(UTF8)  ggVG:<C-u>'<,'>JsonBeautify<CR>
  inoremenu Edit.Json.Beautify(UTF8)  <ESC>ggVG:<C-u>'<,'>JsonBeautify<CR>
  vnoremenu Edit.Json.Beautify(UTF8)  :<C-u>'<,'>JsonBeautify<CR>
else
  command! JsonBeautify set filetype=json | %!python -m json.tool
  nnoremenu Edit.Json.Beautify(cANSI) :%!python -m json.tool<CR>
  inoremenu Edit.Json.Beautify(cANSI) <ESC>:%!python -m json.tool<CR>
endif

function! JsonMinify()
  set filetype=json
  filetype indent on
  execute "%s/\\s\\+$//e"
  execute "%left"
  execute "%j!"
endfunction

nnoremenu Edit.Json.Minify    :call JsonMinify()<CR>
inoremenu Edit.Json.Minify    <ESC>:call JsonMinify()<CR>
command! JsonMinify           call JsonMinify()

" XML pretty by vim
function! XmlBeautify()
  call XmlMinify()
  setlocal filetype=xml
  filetype indent on
  setlocal smartindent
  execute "%s/></>\\r</e"
  normal! gg=G
  " Recolor the file again
  setlocal filetype=xml
endfunction

function! XmlMinify()
  setlocal filetype=xml
  execute "%s/>\\s\\+</></e"
  execute "%s/\\s\\+$//e"
  execute "%left"
  execute "%j!"
endfunction

nnoremenu Edit.XML.Beautify   :call XmlBeautify()<CR>
inoremenu Edit.XML.Beautify   <ESC>:call XmlBeautify()<CR>
nnoremenu Edit.XML.Minify     :call XmlMinify()<CR>
inoremenu Edit.XML.Minify     <ESC>:call XmlMinify()<CR>
command! XmlBeautify    execute "call XmlBeautify()"
command! XmlMinify      execute "call XmlMinify()"

function! Base64Encode()
  execute '%!'.g:SYSPERL.' -e "require MIME::Base64; my \$in; while (<STDIN>) { last if /^END\$/; \$in .= \$_; }; print MIME::Base64::encode_base64(\$in)"'
endfunction

function! Base64Decode()
  execute '%!'.g:SYSPERL.' -e "require MIME::Base64; my \$in; while (<STDIN>) { last if /^END\$/; \$in .= \$_; }; print MIME::Base64::decode_base64(\$in)"'
endfunction

function! Base64EncodeGzip()
  execute "%!gzip | base64"
endfunction

function! Base64DecodeGunzip()
  execute "%!base64 -d | gunzip"
endfunction

nnoremenu Edit.Base64.Encode   :call Base64Encode()<CR>
inoremenu Edit.Base64.Encode   <ESC>:call Base64Encode()<CR>
nnoremenu Edit.Base64.Encode   :call Base64Encode()<CR>
inoremenu Edit.Base64.Encode   <ESC>:call Base64Encode()<CR>
nnoremenu Edit.Base64.Decode   :call Base64Decode()<CR>
inoremenu Edit.Base64.Decode   <ESC>:call Base64Decode()<CR>
nnoremenu Edit.Base64.Decode   :call Base64Decode()<CR>
inoremenu Edit.Base64.Decode   <ESC>:call Base64Decode()<CR>
command! Base64Encode   execute "call Base64Encode()"
command! Base64Decode   execute "call Base64Decode()"
command! Base64EncodeGzip   execute "call Base64EncodeGzip()"
command! Base64DecodeGunzip   execute "call Base64DecodeGunzip()"

function! URLDecode()
  execute '%!'.g:SYSPERL.' -e "require URI::Escape; my \$in; while (<STDIN>) { last if /^END\$/; \$in .= \$_; }; print URI::Escape::uri_unescape(\$in)"'
endfunction

function! URLEncode()
  execute '%!'.g:SYSPERL.' -e "require URI::Escape; my \$in; while (<STDIN>) { last if /^END\$/; \$in .= \$_; }; print URI::Escape::uri_escape(\$in)"'
endfunction

nnoremenu Edit.URL.Decode   :call Base64Decode()<CR>
inoremenu Edit.URL.Decode   <ESC>:call Base64Decode()<CR>
nnoremenu Edit.URL.Decode   :call Base64Decode()<CR>
inoremenu Edit.URL.Decode   <ESC>:call Base64Decode()<CR>
nnoremenu Edit.URL.Encode   :call Base64Encode()<CR>
inoremenu Edit.URL.Encode   <ESC>:call Base64Encode()<CR>
nnoremenu Edit.URL.Encode   :call Base64Encode()<CR>
inoremenu Edit.URL.Encode   <ESC>:call Base64Encode()<CR>
command! URLDecode   execute "call URLDecode()"
command! URLEncode   execute "call URLEncode()"

" xxd command alias
command! -range=% XXD <line1>,<line2>%!xxd

" Merge selected to one line
nnoremenu Edit.Merge\ to\ one\ line  :%j!<CR>
inoremenu Edit.Merge\ to\ one\ line  <ESC>:%j!<CR>
vnoremenu Edit.Merge\ to\ one\ line  gv:%j!<CR>
command! -range=% MergeToOneLine <line1>,<line2>%j!

" Remove something
nnoremenu Edit.Remove.Empty\ lines          :g/^$/de<CR>
nnoremenu Edit.Remove.Leading\ whitespace   :%s/^\s\+//e<CR>
nnoremenu Edit.Remove.Trailing\ whitespace  :%s/\s\+$//e<CR>
inoremenu Edit.Remove.Empty\ lines          <ESC>:g/^$/de<CR>
inoremenu Edit.Remove.Leading\ whitespace   <ESC>:%s/^\s\+//e<CR>
inoremenu Edit.Remove.Trailing\ whitespace  <ESC>:%s/\s\+$//e<CR>

command! -range=% RemoveLeadingSpace     <line1>,<line2>s/^\s\+//e
command! -range=% RemoveTrailingSpace    <line1>,<line2>s/\s\+$//e
command! -range=% RemoveEmptyLines       <line1>,<line2>g/^$/d

" Toggle case
nnoremenu Edit.Toggle\ case.Upper          ggVGU
inoremenu Edit.Toggle\ case.Upper          <ESC>ggVGU
nnoremenu Edit.Toggle\ case.Lower          ggVGu
inoremenu Edit.Toggle\ case.Lower          <ESC>ggVGu
vnoremenu Edit.Toggle\ case.Upper          U
vnoremenu Edit.Toggle\ case.Lower          u
command! -range=% ToggleCaseToUpper  <line1>,<line2>s/\%V.*\%V./\U&/
command! -range=% ToggleCaseToLower  <line1>,<line2>s/\%V.*\%V./\L&/

function! Reverse()
  let [line_start, column_start] = getpos("'<")[1:2]
  let [line_end, column_end] = getpos("'>")[1:2]
  let lines = getline(line_start, line_end)
  if len(lines) == 0
    call ConsoleInfo(" Please select some text first!")
    return ''
  endif
  let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
  let lines[0] = lines[0][column_start - 1:]
  let s = join(lines, "\n")
  let sv = join(reverse(split(s, '.\zs')), '')
  try
    exe "s/\\%V.*\\%V./".sv."/"
  catch /:E486:/
    call ConsoleInfo(" Please select some text first! ")
  endtry
endfunction
nnoremenu Edit.Reverse\ String Vc<C-O>:set revins<CR><C-R>"<Esc>:set norevins<CR>
inoremenu Edit.Reverse\ String <ESC>Vc<C-O>:set revins<CR><C-R>"<Esc>:set norevins<CR>
vnoremenu Edit.Reverse\ String c<C-O>:set revins<CR><C-R>"<Esc>:set norevins<CR>
command! -range ReverseString <line1>,<line2>call Reverse()

" Opencc
nnoremenu Edit.Opencc.Traditional         :%!opencc -c s2tw.json<CR>
inoremenu Edit.Opencc.Traditional         <ESC>:%!opencc -c s2tw.json<CR>
nnoremenu Edit.Opencc.Simplified          :%!opencc -c tw2s.json<CR>
inoremenu Edit.Opencc.Simplified          <ESC>:%!opencc -c tw2s.json<CR>

command! -range=% Opencc2T    <line1>,<line2>%!opencc -c s2tw.json
command! -range=% Opencc2S    <line1>,<line2>%!opencc -c tw2s.json

" Fast rendering for current file
function! FastRender()
  setlocal nocursorline
  syntax clear
endfunction

nnoremenu Edit.FastRender :call FastRender()<CR>
inoremenu Edit.FastRender <ESC>:call FastRender()<CR>
command! FastRender call FastRender()

" Split view
nnoremenu Edit.Split\ Window.Vertical\ 2     :vsplit<CR>
nnoremenu Edit.Split\ Window.Vertical\ 3     :vsplit<CR>:vsplit<CR>:wincmd =<CR>
nnoremenu Edit.Split\ Window.Horizontal\ 2   :split<CR>
nnoremenu Edit.Split\ Window.Horizontal\ 3   :split<CR>:split<CR>:wincmd =<CR>
nnoremenu Edit.Split\ Window.4               :split<CR>:vsplit<CR>:wincmd j<CR>:vsplit<CR>:wincmd k<CR>
inoremenu Edit.Split\ Window.Vertical\ 2     <ESC>:vsplit<CR>
inoremenu Edit.Split\ Window.Vertical\ 3     <ESC>:vsplit<CR>:vsplit<CR>:wincmd =<CR>
inoremenu Edit.Split\ Window.Horizontal\ 2   <ESC>:split<CR>
inoremenu Edit.Split\ Window.Horizontal\ 3   <ESC>:split<CR>:split<CR>:wincmd =<CR>
inoremenu Edit.Split\ Window.4               <ESC>:split<CR>:vsplit<CR>:wincmd j<CR>:vsplit<CR>:wincmd k<CR>

command! Split2Vertical     vsplit
command! Split3Vertical     vsplit | vsplit | wincmd =
command! Split2Horizontal   split
command! Split3Horizontal   split  | split  | wincmd =
command! Split4             split  | vsplit | wincmd j | vsplit | wincmd k
command! SplitMoveRight     wincmd l
command! SplitMoveLeft      wincmd h
command! SplitMoveUp        wincmd k
command! SplitMoveDown      wincmd j
command! SplitResizeRight   3wincmd >
command! SplitResizeLeft    3wincmd <
command! SplitResizeUp      3wincmd +
command! SplitResizeDown    3wincmd -

" Indent format
function! IndentSpace(width)
  set expandtab
  execute "set tabstop=" . a:width
  execute "set shiftwidth=" . a:width
  execute "set softtabstop=" . a:width
  execute "%retab!"
  if exists('b:fileIndent') | unlet b:fileIndent | endif
  call GetIndent()
endfunction

function! IndentTab(width)
  set noexpandtab
  set softtabstop=0
  execute "set tabstop=" . a:width
  execute "set shiftwidth=" . a:width
  execute "%retab!"
  if exists('b:fileIndent') | unlet b:fileIndent | endif
"   call GetIndent()
endfunction

command! IndentSpace2   execute "call IndentSpace(2)"
command! IndentSpace4   execute "call IndentSpace(4)"
command! IndentSpace8   execute "call IndentSpace(8)"
command! IndentTab2     execute "call IndentTab(2)"
command! IndentTab4     execute "call IndentTab(4)"
command! IndentTab8     execute "call IndentTab(8)"
nnoremenu Edit.Indent.Space\ 2   :call IndentSpace(2)<CR>
nnoremenu Edit.Indent.Space\ 4   :call IndentSpace(4)<CR>
nnoremenu Edit.Indent.Space\ 8   :call IndentSpace(8)<CR>
nnoremenu Edit.Indent.Tab\ 2     :call IndentTab(2)<CR>
nnoremenu Edit.Indent.Tab\ 4     :call IndentTab(4)<CR>
nnoremenu Edit.Indent.Tab\ 8     :call IndentTab(8)<CR>
inoremenu Edit.Indent.Space\ 2   <ESC>:call IndentSpace(2)<CR>
inoremenu Edit.Indent.Space\ 4   <ESC>:call IndentSpace(4)<CR>
inoremenu Edit.Indent.Space\ 8   <ESC>:call IndentSpace(8)<CR>
inoremenu Edit.Indent.Tab\ 2     <ESC>:call IndentTab(2)<CR>
inoremenu Edit.Indent.Tab\ 4     <ESC>:call IndentTab(4)<CR>
inoremenu Edit.Indent.Tab\ 8     <ESC>:call IndentTab(8)<CR>

" Line ending format
command! LineEndingUnix   execute "set fileformat=unix"
command! LineEndingDos    execute "set fileformat=dos"
command! LineEndingMac    execute "set fileformat=mac"
nnoremenu Edit.Line\ ending.Unix\ (\\n)    :set fileformat=unix<CR>
nnoremenu Edit.Line\ ending.Dos\ (\\r\\n)  :set fileformat=dos<CR>
nnoremenu Edit.Line\ ending.Mac\ (\\r)     :set fileformat=mac<CR>
inoremenu Edit.Line\ ending.Unix\ (\\n)    <ESC>:set fileformat=unix<CR>
inoremenu Edit.Line\ ending.Dos\ (\\r\\n)  <ESC>:set fileformat=dos<CR>
inoremenu Edit.Line\ ending.Mac\ (\\r)     <ESC>:set fileformat=mac<CR>

" Encoding
nnoremenu Edit.Encoding.UTF8      :e ++enc=utf-8<CR>
nnoremenu Edit.Encoding.Big5      :e ++enc=big5<CR>
nnoremenu Edit.Encoding.GBK       :e ++enc=gbk<CR>
nnoremenu Edit.Encoding.Japan     :e ++enc=japan<CR>
nnoremenu Edit.Encoding.Korea     :e ++enc=korea<CR>
nnoremenu Edit.Encoding.UTF16LE   :e ++enc=utf-16le<CR>
nnoremenu Edit.Encoding.UTF16BE   :e ++enc=utf-16be<CR>
nnoremenu Edit.Encoding.ANSI      :e ++enc=ansi<CR>
inoremenu Edit.Encoding.UTF8      <ESC>:e ++enc=utf-8<CR>
inoremenu Edit.Encoding.Big5      <ESC>:e ++enc=big5<CR>
inoremenu Edit.Encoding.GBK       <ESC>:e ++enc=gbk<CR>
inoremenu Edit.Encoding.Japan     <ESC>:e ++enc=japan<CR>
inoremenu Edit.Encoding.Korea     <ESC>:e ++enc=korea<CR>
inoremenu Edit.Encoding.UTF16LE   <ESC>:e ++enc=utf-16le<CR>
inoremenu Edit.Encoding.UTF16BE   <ESC>:e ++enc=utf-16be<CR>
inoremenu Edit.Encoding.ANSI      <ESC>:e ++enc=ansi<CR>

command! EncodingUTF8    execute "e ++enc=utf-8"
command! EncodingBig5    execute "e ++enc=big5"
command! EncodingGBK     execute "e ++enc=gbk"
command! EncodingJapan   execute "e ++enc=japan"
command! EncodingKorea   execute "e ++enc=korea"
command! EncodingUTF16LE execute "e ++enc=utf-16le"
command! EncodingUTF16BE execute "e ++enc=utf-16be"
command! EncodingAnsi    execute "e ++enc=ansi"

function! ConsoleLog(msg)
  echohl iGreen | echon "     Info     "
  echohl Green | echon a:msg
  echohl None
endfunction

function! ConsoleInfo(msg)
  echohl iBlue | echon "     Info     "
  echohl Blue | echon a:msg
  echohl None
endfunction

function! DownloadFile(url)
  if has("gui_running") && (has("win32") || has("win64"))
    set shell=powershell.exe
    set shellcmdflag=-command
    exe "!Invoke-WebRequest -uri ".a:url." -outfile $(split-path -path ".a:url." -leaf)"
  elseif executable("python2")
    let flname = fnamemodify(a:url, ":t")
    exe "!python2 -c \"import urllib; urllib.urlretrieve('".a:url."', './".flname."')\""
  elseif executable("python3")
    let flname = fnamemodify(a:url, ":t")
    exe "!python3 -c \"import urllib.request; urllib.request.urlretrieve('".a:url."', './".flname."')\""
  elseif executable("curl")
    exe "!curl -sLOC - ".a:url
  elseif executable("wget")
    exe "!wget ".a:url
  elseif executable("axel")
    exe "!axel ".a:url
  elseif executable("aria2c")
    exe "!aria2c ".a:url
  else
    echom "Please install a downloader first, ex. curl, wget or aria2"
  endif
endfunction
command! -nargs=1 Download call DownloadFile(<f-args>)

if !exists('g:ftypes') | let g:ftypes = map(split(globpath(&rtp, 'syntax/*.vim'), '\n'), 'fnamemodify(v:val, ":t:r")') | endif
for syn in g:ftypes
  execute "nnoremenu Edit.Filetype.".split(syn, '\zs')[0].".".syn." :setlocal filetype=".syn."<CR>"
  execute "inoremenu Edit.Filetype.".split(syn, '\zs')[0].".".syn." <ESC>:setlocal filetype=".syn."<CR>"
endfor

" Get into insert mode by pressing any key in visual mode
for b:char in split(g:CharSet, '\zs')
  execute "vnoremap ".b:char." \"_di<C-g>u".b:char
endfor

" Custom file syntax
autocmd BufRead,BufNewFile,BufWritePost,FileType,ColorScheme * call HighlightGlobal()
autocmd BufRead,BufNewFile,BufWritePost,BufAdd,BufEnter,FileType,ColorScheme *.{srt,SRT,vtt,VTT} call HighlightSRT()
autocmd BufRead,BufNewFile,BufWritePost,BufAdd,BufEnter,FileType,ColorScheme *.{ass,ASS,ssa,SSA} call HighlightASS()
autocmd BufRead,BufNewFile,BufWritePost,BufAdd,BufEnter,FileType,ColorScheme *.{fish,FISH} call HighlightFISH()

" Detect fish scripts by the shebang line.
autocmd BufRead,BufNewFile,BufWritePost,BufAdd,BufEnter,FileType,ColorScheme * if getline(1) =~# '\v^#!%(\f*/|/usr/bin/env\s*<)fish>' | call HighlightFISH() | endif

function! HighlightGlobal()
  if &filetype == "" || &filetype == "text" || &filetype == "conf"
    syntax clear
    let b:comment_leader = "#"
    syn match alphanumeric  "[A-Za-z0-9_]"
    " Copied from $VIM/syntax/lua.vim
    " integer number
    syn match txtNumber     "\<\d\+\>"
    " floating point number, with dot, optional exponent
    syn match txtNumber     "\<\d\+\.\d*\%([eE][-+]\=\d\+\)\=\>"
    " floating point number, starting with a dot, optional exponent
    syn match txtNumber     "\.\d\+\%([eE][-+]\=\d\+\)\=\>"
    " floating point number, without dot, with exponent
    syn match txtNumber     "\<\d\+[eE][-+]\=\d\+\>"
    " Wide characters and non-ascii characters
    syn match nonalphabet   "[\u0021-\u002F]"
    syn match nonalphabet   "[\u003A-\u0040]"
    syn match nonalphabet   "[\u005B-\u0060]"
    syn match nonalphabet   "[\u007B-\u007E]"
    syn match nonalphabet   "[^\u0000-\u007F]"
    syn match lineURL       "\(https\?\|ftps\?\|git\|ssh\|scp\|file\):\/\/[[:alnum:]+&!,\'\"=@;<>\?\:|\^`\*\$%\/_#.\-\[\]\{\}()]*"
    syn match txtComment    "^#.*$"
    syn match txtComment    "\s#.*"
    syn match txtComment    "^\/\/.*$"
    syn match txtComment    "\s\/\/.*"
    syn match txtComment    "^;.*"
    hi def link alphanumeric  Define
    hi def link txtNumber     Function
    hi def link lineURL       Green
    hi def link nonalphabet   Conditional
    hi def link txtComment    Comment
  endif
endfunction

function! HighlightSRT()
  let fe=expand("%:e")
  let ext=["srt", "SRT", "vtt", "VTT"]
  if (index(ext, fe) < 0)
    return
  endif
  setlocal filetype=srt
  syn case ignore
  syn match srtContent ".*"
  syn match srtArrow "-->"
  syn match srtComment "^#.*"
  syn match srtError "\[br\]"
  syn match srtError "{y:[bi][bi]}"
  syn match srtError "{y:[bi]}"
  syn match srtNumber "^[0-9]\+\s*$"
  syn region transparent matchgroup=srtTime start='[0-9: ]\+[\., ][0-9 ]*' end='[0-9: ]\+[\., ][0-9 ]*' contains=srtArrow oneline

  hi def link srtArrow      Type
  hi def link srtComment    Comment
  hi def link srtContent    Identifier
  hi def link srtError      Error
  hi def link srtNumber     Number
  hi def link srtTime       Statement
endfunction

function! HighlightASS()
  let fe=expand("%:e")
  let ext=["ass", "ASS", "ssa", "SSA"]
  if (index(ext, fe) < 0)
    return
  endif
  setlocal filetype=ass
  let b:comment_leader = ";"
  syn match assSection       "^\[.*\]"
  syn match assSourceComment "^;.*$"
  syn match assLine          "^[^;][^:]*:.*$"  contains=assHeader,assComment,assDialog
  syn match assHeader        "^[^;][^:]*:\s*"  contained nextgroup=assHeaderText
  syn match assHeaderText    ".*$"             contained
  syn match assComment       "^Comment:\s*"    contained nextgroup=assCommentText
  syn match assCommentText   ".*$"             contained
  syn match assDialog        "^Dialogue:\s*"   contained nextgroup=assDialogTimes
  syn match assDialogTimes   "\([^,]*,\)\{4}"  contained nextgroup=assDialogActor
  syn match assDialogActor   "[^,]*"           contained nextgroup=assDialogEffects
  syn match assDialogEffects ",\([^,]*,\)\{4}" contained nextgroup=assDialogText
  syn match assDialogText    ".*$"             contained contains=assTextComment,assTextSubCode,assSpecialChar
  syn match assTextComment   "{[^}]*}"         contained
  syn match assTextSubCode   "{\\[^}]*}"       contained
  syn match assSpecialChar   "\\[nNh{}]"       contained contains=@NoSpell

  hi def link assSection         Function
  hi def link assSourceComment   Comment
  hi def link assHeader          Statement
  hi def link assComment         Statement
  hi def link assDialog          Statement
  hi def link assHeaderText      Constant
  hi def link assCommentText     Comment
  hi def link assDialogTimes     Type
  hi def link assDialogActor     Title
  hi def link assDialogEffects   Function
  hi def link assDialogText      Identifier
  hi def link assTextComment     Comment
  hi def link assTextSubCode     Comment
  hi def link assSpecialChar     Comment
endfunction

function! HighlightFISH()
  let fe=expand("%:e")
  let ext=["fish", "FISH", "sh"]
  if (index(ext, fe) < 0)
    return
  endif
  setlocal filetype=fish

  function! s:CreatePrivateKeyword (name, keyword, parent, hiGroup)
    execute "syn keyword " . a:name  . " " . a:keyword . " contained containedin=" . a:parent
    execute "hi link " . a:name . " " . a:hiGroup
    execute "syn cluster c_private add=" . a:name
  endfunction

  function! s:CreatePrivateKeywordWithError (name, keyword, parent, hiGroup)
    execute "syn keyword err_" . a:name . " " . a:keyword
    execute "hi default link err_" . a:name . " Error"
    call s:CreatePrivateKeyword(a:name, a:keyword, a:parent, a:hiGroup)
  endfunction

  function! s:CreatePrivateMatch (name, pattern, parent, hiGroup)
    execute "syn match " . a:name  . " \"" . a:pattern . "\" contained containedin=" . a:parent
    execute "hi link " . a:name . " " . a:hiGroup
    execute "syn cluster c_private add=" . a:name
  endfunction

  function! s:CreatePrivateMatchWithError (name, pattern, parent, hiGroup)
    execute "syn match err_" . a:name . " \"" . a:pattern . "\""
    execute "hi default link err_" . a:name . " Error"
    call s:CreatePrivateMatch(a:name, a:pattern, a:parent, a:hiGroup)
  endfunction
  syn case match

  syn match joekyfishextra "alias \|set \|bind "
  hi def link joekyfishextra Statement
  syn match m_path "\v\/?\S+\/(\/|\S*)+"
  highlight link m_path Directory
  syn keyword k_standaloneEnd end
  hi default link k_standaloneEnd Error
  syn keyword err_k_bash do done then fi export local
  hi default link err_k_bash Error
  syn region r_forLoop matchgroup=Repeat start="\<for\>" end="\<end\>" keepend extend fold transparent contains=ALLBUT,@c_private
  syn region r_whileLoop matchgroup=Repeat start="\<while\>" end="\<end\>" keepend extend fold transparent contains=ALLBUT,@c_private

  call s:CreatePrivateMatchWithError("m_if", '\v<if>', "r_ifStmt", "Conditional")
  call s:CreatePrivateMatchWithError("m_else", '\v<else>(if)@!', "r_ifStmt", "Conditional")
  call s:CreatePrivateMatchWithError("m_elseIf", '\v<else\s+if>', "r_ifStmt", "Conditional")
  syn region r_ifStmt start="\<if\>" matchgroup=Conditional end="\<end\>" keepend extend fold transparent contains=ALLBUT,@c_private
  call s:CreatePrivateKeywordWithError("k_case", "case", "r_switchStmt", "Conditional")
  syn region r_switchStmt matchgroup=Conditional start="\<switch\>" end="\<end\>" keepend extend fold transparent contains=ALLBUT,@c_private
  syn cluster c_funName add=m_funName
  syn cluster c_private add=m_funName
  syn match m_funName :\v(function\s+)@<=[^-/][^/]{-}($|;|\s+)@=: contained containedin=m_funSignature
  syn match m_funName :\v(function\s+)@<="[^-/][^/]*": contained containedin=m_funSignature
  syn match m_funName :\v(function\s+)@<='[^-/][^/]*': contained containedin=m_funSignature
  hi default link m_funName Identifier
  syn cluster c_funName add=err_m_funName
  syn cluster c_private add=err_m_funName
  syn match err_m_funName :\v(function\s+)@<=(-.{-}|/=\S{-}/\S{-})($|;|\s+)@=: contained containedin=m_funSignature
  syn match err_m_funName :\v(function\s+)@<="(-.{-}|/=.{-}/.{-})": contained containedin=m_funSignature
  syn match err_m_funName :\v(function\s+)@<='(-.{-}|/=.{-}/.{-})': contained containedin=m_funSignature
  hi default link err_m_funName Error
  syn cluster c_private add=m_funDescription
  syn match m_funDescription :\v(\s+)@<=(-d|--description=)\s+(".{-}"|'.{-}'): contained containedin=m_funSignature contains=r_string nextgroup=m_funArgument
  hi default link m_funDescription Type
  syn cluster c_argName add=m_argName
  syn cluster c_private add=m_argName
  syn match m_argName :\v(\s+)@<=[a-zA-Z0-9_]*: contained containedin=m_funArgument
  hi default link m_argName Identifier
  syn match m_funArgument :\v(\s+)@<=(-a|--argument-names=\s+)([a-zA-Z0-9_]*\s+)+: contained containedin=m_funSignature contains=m_argName nextgroup=m_funDescription
  hi default link m_funArgument Type
  syn cluster c_private add=m_funSignature
  syn match m_funSignature '\v<function>.{-}($|;)@='he=s+8 contained contains=c_funName,m_funArgument,m_funDescription containedin=r_functionDef nextgroup=@c_funName
  hi link m_funSignature Function
  syn region r_functionDef start="\v<function>" matchgroup=Function end="\<end\>" keepend extend fold transparent contains=ALLBUT,@c_private
  syn region r_string start='"' end='"' extend fold contains=m_doubleQuoteEscape,m_variable
  syn region r_string start="'" end="'" extend fold contains=m_singleQuoteEscape
  hi default link r_string String
  syn match m_singleQuoteEscape "\\'" contained
  hi link m_singleQuoteEscape Special
  syn match m_doubleQuoteEscape '\\"' contained
  hi link m_doubleQuoteEscape Special
  syn match m_arrayIndex "\[[\+-]=\d+(..[\+-]=\d+)=\]" contained
  hi default link m_arrayIndex Operator
  syn match m_guardedVar "\v\{\$+\w*(\[[\+-]=\d+(..[\+-]=\d+)=\])=\}" contains=m_arrayIndex
  hi default link m_guardedVar Identifier
  syn match m_variable "\v\$+\w*(\[[\+-]=\d+(..[\+-]=\d+)=\])=" contains=m_arrayIndex
  hi default link m_variable Identifier
  syn keyword k_todos contained FIXME XXX TODO FIXME: XXX: TODO:
  hi default link k_todos Todo
  syn match m_comment "\v^\s*\#.*$" contains=k_todos
  hi default link m_comment Comment
  syn match m_bang "\v#\!" nextgroup=m_path
  hi default link m_bang Macro
  syn cluster c_argument contains=r_string
  syn match m_varDerefError "\$[-#@*$?!]"
  syn region err_r_varDeref start="\${" end="}"
  syn region err_r_varDeref start="\$(" end=")"
  hi default link err_r_varDeref Error
  syn region fishVarDeref start="\$\+\w\+\[" end="]" excludenl end="$" contains=fishSubst,fishVarDeref,@fishEscapeSeqs
  syn match m_redirect "\v\d=(\>\>=|\<)(\&\d)="
  hi default link m_redirect Operator
endfunction

" For neovim-qt, the best way to detect GUI is setting the NVIM_GUI=1
" https://github.com/equalsraf/neovim-qt/issues/94#issuecomment-322306640
if has("gui_running") || has("gui_vimr") || !empty($NVIM_GUI)

  let g:guifontsize=14
  if has('win32') || has('win64')
    let g:guifontsize=13
    call EnsureDirExists($TEMP."/vim/backup")
    call EnsureDirExists($TEMP."/vim/swap")
    call EnsureDirExists($TEMP."/vim/undo")
    set directory=$TEMP/vim/swap
    set backupdir=$TEMP/vim/backup
    set undodir=$TEMP/vim/undo
    au GUIEnter * simalt ~x " Full screen on start
    if executable("powershell")
      set shell=powershell.exe
      set shellcmdflag=-command
    endif
  endif
  set number
  set lines=999 columns=999 " set window Maximized
  set fileformats=dos,unix,mac
  if has("multi_byte_ime")
    set iminsert=2 " This could cause statusline color act weirdly
    set imcmdline
    set imsearch=2
  elseif has("xim")
"     set iminsert=2 " This could cause statusline color act weirdly
"     set imcmdline " Disabled since searching with sogou IM on Linux is painful
"     set imsearch=2
  endif

  function! ChangeFontSize()
    if has('win32') || has('win64')
      silent! execute "set guifont=Ubuntu\\ Mono:h".g:guifontsize.",Consolas:h".g:guifontsize.",Lucida_Console:h".g:guifontsize
      silent! execute "set guifontwide=Noto\\ Sans\\ CJK\\ TC:h".g:guifontsize.",Iosevka\\ Term:h".g:guifontsize.",Iosevka:h".g:guifontsize.",NSimsun:h".g:guifontsize
    elseif has("gui_macvim")
      silent! execute "set guifont=Monaco:h".g:guifontsize
      silent! execute "set guifontwide=Hiragino\\ Sans\\ GB:h".g:guifontsize
    else
      silent! execute "set guifont=Ubuntu\\ Mono\\ ".g:guifontsize.",Droid\\ Sans\\ Mono\\ ".g:guifontsize.",Inconsolata\\ ".g:guifontsize.",DejaVu\\ Sans\\ Mono\\ ".g:guifontsize
    endif
    execute "set linespace=".(g:guifontsize/5)
  endfunction
  call ChangeFontSize()

  nnoremap <silent> <Home> :let g:guifontsize+=1<CR>:call ChangeFontSize()<CR>
  nnoremap <silent> <End>  :let g:guifontsize-=1<CR>:call ChangeFontSize()<CR>
  inoremap <silent> <Home> <C-o>:let g:guifontsize+=1<CR><C-o>:call ChangeFontSize()<CR>
  inoremap <silent> <End>  <C-o>:let g:guifontsize-=1<CR><C-o>:call ChangeFontSize()<CR>

  " Ctrl C is copying line if there is no word selected
  nnoremap <C-c> mjV"+y`ji
  inoremap <C-c> <C-\><C-o>mj<C-o>V"+y<C-o><C-o>`j
  vnoremap <C-c> "+y<ESC>gv
  cnoremap <C-c> <C-y>

  " Ctrl X is cutting line if there is no word selected
  nnoremap <silent> <C-x>           :call SavePos()<CR>dd:call setpos(".", b:savepos)<CR>
  inoremap <silent> <C-x> <C-\><C-o>:call SavePos()<CR><C-\><C-o>dd<C-\><C-o>:call setpos(".", b:savepos)<CR><C-g>u
  vnoremap <silent> <C-x> "+x

  " Ctrl V is pasting from system clipboard
  nnoremap <silent> <C-v> "+gPi<C-g>u
  vnoremap <silent> <C-v> "_d"+gP
  inoremap <silent> <C-v> <C-r>=PasteClipboardInsertMode()<CR><C-g>u
  cnoremap <C-v> <C-r>+

  " Shift-Insert same as Ctrl-v
  inoremap <S-Insert> <C-o>"+gP<C-g>u
  nnoremap <S-Insert> "+gPi<C-g>u
  vnoremap <S-Insert> "_d"+gP

  " Disable Insert key in GUI
  inoremap <Insert> <Nop>
  nnoremap <Insert> <Nop>
  vnoremap <Insert> <Nop>
  cnoremap <Insert> <Nop>

  " Pasting or Visual-Block Insert and command-line mode
  " noremap! <Insert> <C-r>+
endif
