vim.cmd("filetype plugin indent on")
vim.cmd("if !1 | finish | endif")
vim.cmd("set nocompatible")
vim.cmd("syntax enable")

vim.o.termguicolors = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.hidden = true
vim.o.smartcase = true
vim.o.swapfile = true
vim.o.undofile = true
vim.o.wrap = true
vim.o.relativenumber = true
-- vim.o.cursorline = true
vim.o.autoindent = true
vim.o.ai = true
vim.o.si = true
vim.o.smarttab = true
vim.o.smartindent = true
vim.o.title = true
vim.o.hlsearch = true
vim.o.showcmd = true
vim.o.expandtab = true
vim.o.ignorecase = true
vim.o.exrc = true
vim.o.foldenable = true
vim.o.showtabline = true

vim.o.lazyredraw = false
vim.o.showmode = false
vim.o.writebackup = false
vim.o.backup = false

vim.g.move_map_keys = 0
vim.o.conceallevel = 0
vim.g.loaded_gzip = 1
vim.g.codeium_disable_bindings = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_getscript = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_2html_plugin = 1
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
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.laststatus = 2
vim.o.softtabstop = 4
vim.o.pumheight = 10
vim.o.scrolloff = 10
vim.g.virtcolumn_priority = 10
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.updatetime = 300

vim.o.foldcolumn = "0" -- '1', '0' is not bad
vim.o.foldnestmax = "1" -- '1', '0' is not bad
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
vim.g.gitblame_highlight_group = "GitBlame"
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
vim.g.virtcolumn_char = "┊" -- char to display the line

vim.cmd("set colorcolumn=80")
vim.cmd("set t_BE=")
vim.cmd("set nosc noru nosm")
vim.cmd("set nu rnu")
vim.cmd("set path+=**")
vim.cmd("set wildignore+=*node_modules*")
vim.cmd("set formatoptions+=r")
vim.cmd("set completeopt-=preview")

vim.cmd("let g:deoplete#enable_at_startup=1")

vim.cmd("let g:go_def_mode='gopls'")
vim.cmd("let g:go_info_mode='gopls'")

-- Cursorline highlighting control
--  Only have it on in the active buffer
vim.o.cursorline = true -- Highlight the current line
local group = vim.api.nvim_create_augroup("CursorLineControl", { clear = true })
local set_cursorline = function(event, value, pattern)
  vim.api.nvim_create_autocmd(event, {
    group = group,
    pattern = pattern,
    callback = function()
      vim.opt_local.cursorline = value
    end,
  })
end
set_cursorline("WinLeave", false)
set_cursorline("WinEnter", true)
set_cursorline("FileType", false, "TelescopePrompt")

vim.cmd([[
set listchars=tab:\ \ ,nbsp:·,eol:󰌑,trail:·,extends:>,precedes:<,nbsp:␣,conceal:┊
set list
]])
