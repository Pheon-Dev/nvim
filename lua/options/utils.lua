vim.cmd("filetype plugin indent on")
vim.cmd("if !1 | finish | endif")
vim.cmd("set nocompatible")
vim.cmd("syntax enable")

vim.notify = require("notify")

vim.o.termguicolors = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.hidden = true
vim.o.smartcase = true
vim.o.swapfile = true
vim.o.undofile = true
vim.o.wrap = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.autoindent = true
vim.o.ai = true
vim.o.si = true
vim.o.smarttab = true
vim.o.smartindent = true
vim.o.title = true
vim.o.hlsearch = true
vim.o.showcmd = true
vim.o.expandtab = true
vim.o.lazyredraw = false
vim.o.ignorecase = true
vim.o.exrc = true
vim.o.foldenable = true

vim.o.showmode = false
vim.o.writebackup = false
vim.o.backup = false
vim.o.showtabline = true

vim.g.loaded_gzip = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1

vim.g.loaded_getscript = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_2html_plugin = 1

vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1
vim.g.loaded_logiPat = 1
vim.g.loaded_rrhelper = 1

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrwSettings = 1
vim.g.loaded_netrwFileHandlers = 1

vim.g.loaded_remote_plugins = 1
vim.g.loaded_tutor_mode_plugin = 1
vim.g.loaded_spellfile_plugin = 1
vim.g.loaded_shada_plugin = 1

vim.g.rainbow_active = 1
vim.o.cmdheight = 1

vim.o.conceallevel = 0
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.laststatus = 2
vim.o.softtabstop = 4
vim.o.pumheight = 10
vim.o.scrolloff = 10
vim.o.updatetime = 300
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.g.move_map_keys = 0

--[[ move ]]
--[[ vim.g.move_normal_option = 1 ]]
--[[ vim.g.move_key_modifier_visualmode = "S" ]]
--[[ vim.g.move_key_modifier = "C" ]]

--[[ ufo ]]
vim.o.foldcolumn = "0" -- '1', '0' is not bad
vim.o.foldnestmax = "1" -- '1', '0' is not bad
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

--[[ tagbar ]]
vim.g.tagbar_map_togglesort = "r"
vim.g.tagbar_map_jump = "l"
vim.g.tagbar_map_togglefold = "h"
vim.g.tagbar_map_closeallfolds = "H"
vim.g.tagbar_position = "left"
vim.g.tagbar_silent = 1
vim.g.tagbar_width = 24
vim.g.tagbar_help_visibility = 0
vim.g.tagbar_no_status_line = 1
vim.g.tagbar_iconchars = { "", "" }

vim.o.encoding = "utf-8"
vim.o.signcolumn = "yes"
vim.o.fileencoding = "utf-8"
vim.o.mouse = "a"
vim.o.mouse = "nicr"
vim.o.backspace = "start,eol,indent"
vim.o.clipboard = "unnamedplus"
vim.o.shell = "zsh"
vim.o.backupskip = "/tmp/*,/private/tmp/*"
vim.g.python3_host_prog = "/usr/bin/python"
vim.g.gitblame_highlight_group = "Blame"
vim.o.guifont = "Courier\\ New:h10"
vim.o.shortmess = vim.o.shortmess .. "c"
vim.opt.whichwrap:append("<,>,[,],h,l")
vim.cmd("set t_BE=")
vim.cmd("set nosc noru nosm")
vim.cmd("set nu rnu")
vim.cmd("set path+=**")
vim.cmd("set wildignore+=*node_modules*")
vim.cmd("set formatoptions+=r")
vim.cmd("set completeopt-=preview")
vim.cmd("let g:deoplete#enable_at_startup=1")

--[[ GO ]]
vim.cmd("let g:go_def_mode='gopls'")
vim.cmd("let g:go_info_mode='gopls'")

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.go",
	callback = function()
		require("go.format").goimport()
	end,
	group = format_sync_grp,
})

-- Run gofmt + goimport on save
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.go",
	callback = function()
		require("go.format").goimport()
	end,
	group = format_sync_grp,
})

vim.cmd("autocmd!")
vim.cmd("autocmd Insertleave * set nopaste")
vim.cmd('autocmd VimEnter * :silent exec "!kill -s SIGNWINCH $PPID"')
vim.cmd("autocmd FileType coffee setlocal shiftwidth=2 tabstop=2")
vim.cmd("autocmd FileType ruby setlocal shiftwidth=2 tabstop=2")
vim.cmd("autocmd FileType yaml setlocal shiftwidth=2 tabstop=2")
vim.cmd("autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart")
vim.cmd("autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear")

vim.cmd([[
    augroup zap_config
        autocmd!
        autocmd BufWritePost zap.zsh !shfmt -l -w .
    augroup END
]])

--[[ vim.cmd([[ ]]
--[[     augroup packer_user_config ]]
--[[         autocmd! ]]
--[[         autocmd BufWritePost ~/.config/nvim/lua/plugins/init.lua source <afile> | PackerCompile --preview ]]
--[[     augroup END ]]
-- ]]) ]]

vim.cmd("au BufnewFile,BufRead term:* setf Terminal")
vim.cmd("au BufnewFile,BufRead *.lua setf lua")
vim.cmd("au BufnewFile,BufRead *.js setf javascript")
vim.cmd("au BufnewFile,BufRead *.jsx setf javascript")
vim.cmd("au BufnewFile,BufRead *.es6 setf javascript")
vim.cmd("au BufnewFile,BufRead *.tsx setf tsx")
vim.cmd("au BufnewFile,BufRead *.html setf html")
vim.cmd("au BufnewFile,BufRead *.ts setf typescript")
vim.cmd("au BufnewFile,BufRead *.md set filetype=markdown")
vim.cmd("au BufnewFile,BufRead *.mdx set filetype=markdown")
vim.cmd("au BufnewFile,BufRead *.flow set filetype=javascript")
vim.cmd("au BufnewFile,BufRead *.fish set filetype=fish")
--[[ vim.cmd("au BufnewFile,BufRead *.sh set filetype=bash") ]]
vim.cmd("au BufnewFile,BufRead *.zsh set filetype=bash")

vim.cmd([[
	augroup BgHighlight
		autocmd!
		autocmd WinEnter * set cul
		autocmd WinLeave * set nocul
	augroup END
]])

vim.api.nvim_create_autocmd({ "CmdlineLeave" }, {
	callback = function()
		require("scrollbar.handlers.search").handler.hide()
	end,
})

--[[ vim.cmd([[ ]]
--[[     augroup scrollbar_search_hide ]]
--[[         autocmd! ]]
--[[         autocmd CmdlineLeave : lua require('scrollbar.handlers.search').handler.hide() ]]
--[[     augroup END ]]
-- ]]) ]]

vim.cmd([[
	if &term =~ "screen"
  		autocmd BufEnter * if bufname("") !~ "^?[A-Za-z0-9?]*://" | silent! exe '!echo -n "\ek[`hostname`:`basename $PWD`/`basename %`]\e\\"' | endif
  		autocmd VinLeave * silent! exe '!echo -n "\ek[`hostname`;`basenane $PWD`]\e\\"'
	endif
]])

vim.cmd([[
	if has("nvim")
		set inccommand=split
	endif 
]])
vim.cmd([[
  if has("syntax")
    syntax on
  endif
]])
vim.cmd([[
    let &l:cc = join(range(getpos("'<")[2], getpos("'>")[2]),',')
  ]])
vim.cmd([[
    vnoremap <F5> <ESC>:let &l:cc = join(range(getpos("'<")[2], getpos("'>")[2]),',')<CR>
  ]])
