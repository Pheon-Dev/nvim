vim.o.guifont = ('Courier\\ New:h10')
vim.cmd([[ 
  map s <Plug>(easymotion-prefix)
  map s. <Plug>(easymotion-repeat)
  map sl <Plug>(easymotion-fl)
  map sw <Plug>(easymotion-overwin-w)
  map / <Plug>(easymotion-sn)
  map / <Plug>(easymotion-tn)
  map n <Plug>(easymotion-next)
  map N <Plug>(easymotion-prev)
]])
vim.cmd([[ 
let b:ale_fixers = ['prettier', 'eslint']
let b:ale_fixers = {'javascript': ['prettier', 'eslint']}
let b:ale_fixers = {'javascriptreact': ['prettier', 'eslint']}
let g:ale_fix_on_save = 1
]])
vim.cmd('filetype plugin indent on')
vim.o.shortmess = vim.o.shortmess .. 'c'
-- vim.opt.shortmess:append "c"
vim.opt.whichwrap:append "<,>,[,],h,l"
vim.o.encoding = 'utf-8'
vim.o.splitbelow = true
vim.o.splitright = true
vim.cmd('if !1 | finish | endif')
vim.cmd('set nocompatible')
vim.cmd('syntax enable')
vim.cmd([[
  if has("syntax")
    syntax on
  endif
]])
vim.o.foldmethod = "indent"
-- vim.o.foldmethod = "syntax"
-- vim.o.foldmethod = "expr"
-- vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.hidden = true
vim.o.pumheight = 10
vim.o.showmode = false
vim.o.showtabline = 2
vim.o.smartcase = true
vim.o.swapfile = true
vim.o.undofile = true
vim.o.updatetime = 300
vim.o.writebackup = false
vim.o.wrap = true
vim.o.signcolumn = "yes"
vim.o.fileencoding = 'utf-8'
vim.o.relativenumber = true
vim.cmd('set nu rnu')
vim.o.cursorline = true
vim.o.mouse = "a"
vim.o.mouse = "nicr"
vim.o.autoindent = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.ai = true
vim.o.si = true
vim.o.backspace = 'start,eol,indent'
vim.cmd('set path+=**')
vim.cmd('set wildignore+=*node_modules*')
vim.cmd('set formatoptions+=r')
vim.o.smarttab = true
vim.o.smartindent = true
vim.o.backup = false
vim.o.softtabstop = 4
vim.o.title = true
vim.o.clipboard = "unnamedplus"
vim.o.conceallevel = 0
vim.o.hlsearch = true
vim.o.showcmd = true
vim.o.cmdheight = 1
vim.o.laststatus = 2
vim.o.scrolloff = 10
vim.o.expandtab = true
vim.o.shell = 'zsh'
vim.o.backupskip = '/tmp/*,/private/tmp/*'
vim.cmd([[
	if has("nvim")
		set inccommand=split
	endif 
]])
vim.cmd('set t_BE=')
vim.cmd('set nosc noru nosm')
vim.o.lazyredraw = true
vim.o.ignorecase = true

vim.cmd('set completeopt-=preview')
vim.cmd('let g:deoplete#enable_at_startup=1')
vim.g.python3_host_prog = '/usr/bin/python'
vim.o.exrc = true

vim.cmd([[
    let &l:cc = join(range(getpos("'<")[2], getpos("'>")[2]),',')
  ]])

vim.cmd([[
    vnoremap <F5> <ESC>:let &l:cc = join(range(getpos("'<")[2], getpos("'>")[2]),',')<CR>
  ]])
