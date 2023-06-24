-- This file is automatically loaded by plugins.config
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

opt.autowrite = true           -- Enable auto write
opt.clipboard = "unnamedplus"  -- Sync with system clipboard
opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 0           -- Hide * markup for bold and italic 3
opt.confirm = true             -- Confirm to save changes before exiting modified buffer
opt.cursorline = true          -- Enable highlighting of the current line
opt.expandtab = true           -- Use spaces instead of tabs
opt.formatoptions = "jcroqlnt" -- tcqj
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.ignorecase = true      -- Ignore case
opt.inccommand = "nosplit" -- preview incremental substitute
opt.laststatus = 0 -- 2
opt.mouse = "a"           -- Enable mouse mode
opt.mouse = "nicr"
opt.number = true         -- Print line number
opt.pumblend = 0         -- Popup blend 10
opt.pumheight = 10        -- Maximum number of entries in a popup
opt.scrolloff = 4         -- Lines of context
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
opt.shiftround = true     -- Round indent
opt.shiftwidth = 2        -- Size of an indent
opt.shortmess:append({ W = true, I = true, c = true })
opt.showmode = false      -- Dont show mode since we have a statusline
opt.sidescrolloff = 8     -- Columns of context
opt.signcolumn = "yes"    -- Always show the signcolumn, otherwise it would shift the text each time
opt.smartcase = true      -- Don't ignore case with capitals
opt.spelllang = { "en" }
opt.splitbelow = true     -- Put new windows below current
opt.splitright = true     -- Put new windows right of current
opt.tabstop = 2           -- Number of spaces tabs count for
opt.termguicolors = true  -- True color support
opt.timeoutlen = 500
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 300               -- Save swap file and trigger CursorHold
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.winminwidth = 5                -- Minimum window width
opt.hidden = true
opt.wrap = true
opt.relativenumber = true
opt.autoindent = true
opt.ai = true
opt.si = true
opt.smarttab = true
opt.smartindent = true
opt.title = true
opt.hlsearch = true
opt.showcmd = true
opt.cmdheight = 1
opt.softtabstop = 4
opt.lazyredraw = false
opt.writebackup = false
opt.backup = false
opt.list = true            -- Show some invisible characters (tabs...
opt.listchars={
  tab="  ",
  eol="󰌑",
  trail="·",
  extends=">",
  precedes="<",
  nbsp="␣",
  conceal="┊",
}

vim.o.showtabline = true

-- vim.g.loaded_gzip = 1
-- vim.g.loaded_zip = 1
-- vim.g.loaded_zipPlugin = 1
-- vim.g.loaded_tar = 1
-- vim.g.loaded_tarPlugin = 1
-- vim.g.loaded_getscript = 1
-- vim.g.loaded_getscriptPlugin = 1
-- vim.g.loaded_vimball = 1
-- vim.g.loaded_vimballPlugin = 1
-- vim.g.loaded_2html_plugin = 1
-- vim.g.loaded_logiPat = 1
-- vim.g.loaded_rrhelper = 1
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
-- vim.g.loaded_netrwSettings = 1
-- vim.g.loaded_netrwFileHandlers = 1
-- vim.g.loaded_remote_plugins = 1
-- vim.g.loaded_tutor_mode_plugin = 1
-- vim.g.loaded_spellfile_plugin = 1
-- vim.g.loaded_shada_plugin = 1
-- vim.g.rainbow_active = 1

vim.g.move_map_keys = 0

opt.exrc = true
opt.foldenable = true
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldcolumn = "0" -- '1', '0' is not bad
vim.o.foldnestmax = "1" -- '1', '0' is not bad

opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

opt.backspace = "start,eol,indent"
opt.shell = "zsh"
opt.backupskip = "/tmp/*,/private/tmp/*"
vim.g.python3_host_prog = "/usr/bin/python"
opt.whichwrap:append("<,>,[,],h,l")

if vim.fn.has("nvim-0.9.0") == 1 then
  opt.splitkeep = "screen"
  opt.shortmess:append({ C = true })
end

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0
vim.g.codeium_disable_bindings = 1

vim.g.gitblame_highlight_group = "GitBlame"
vim.g.gitblame_highlight_group = "Blame"

vim.g.virtcolumn_priority = 10
vim.g.virtcolumn_char = "┊" -- char to display the line
vim.cmd("set colorcolumn=80")

vim.cmd("set t_BE=")
vim.cmd("set nosc noru nosm")
vim.cmd("set nu rnu")
vim.cmd("set path+=**")
vim.cmd("set wildignore+=*node_modules*")
vim.cmd("set formatoptions+=r")
vim.cmd("set completeopt-=preview")
vim.cmd("filetype plugin indent on")
-- vim.cmd("if !1 | finish | endif")
vim.cmd("set nocompatible")
vim.cmd("syntax enable")

-- vim.cmd("let g:deoplete#enable_at_startup=1")

vim.cmd("let g:go_def_mode='gopls'")
vim.cmd("let g:go_info_mode='gopls'")
