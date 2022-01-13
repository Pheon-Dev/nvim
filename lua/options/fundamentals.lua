vim.o.guifont = ('Courier\\ New:h10')
vim.cmd('filetype plugin indent on')
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.encoding = 'utf-8'
vim.o.splitbelow = true
vim.o.splitright = true
vim.cmd('if !1 | finish | endif')
vim.cmd('set nocompatible')
vim.cmd('syntax enable')
vim.o.hidden = true
vim.o.fileencoding = 'utf-8'
vim.o.number = true
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
vim.o.softtabstop = 4
vim.o.title = true
vim.cmd('set nobackup')
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
