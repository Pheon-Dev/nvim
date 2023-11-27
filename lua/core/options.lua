local o = vim.o
local g = vim.g

g.mapleader = " "
g.maplocalleader = " "
-- Enable LazyVim auto format
g.autoformat = true

-- LazyVim root dir detection
-- Each entry can be:
-- * the name of a detector function like `lsp` or `cwd`
-- * a pattern or array of patterns like `.git` or `lua`.
-- * a function with signature `function(buf) -> string|string[]`
g.root_spec = { "lsp", { ".git", "lua" }, "cwd" }

o.autowrite = true           -- Enable auto write
-- o.autowriteall = true        -- Enable auto write
o.clipboard = "unnamedplus"  -- Sync with system clipboard
o.completeo = "menu,menuone,noselect"
o.conceallevel = 0           -- Hide * markup for bold and italic 3
o.confirm = true             -- Confirm to save changes before exiting modified buffer
o.cursorline = true          -- Enable highlighting of the current line
o.expandtab = true           -- Use spaces instead of tabs
o.formatoptions = "jcroqlnt" -- tcqj
o.grepformat = "%f:%l:%c:%m"
o.grepprg = "rg --vimgrep"
o.ignorecase = true      -- Ignore case
o.inccommand = "nosplit" -- preview incremental substitute
o.laststatus = 3         -- 2
o.mouse = "a"            -- Enable mouse mode
-- o.mouse = "nicr"
o.number = true          -- Print line number
o.pumblend = 10          -- Popup blend 10
o.pumheight = 10         -- Maximum number of entries in a popup
o.scrolloff = 4          -- Lines of context
o.shiftround = true      -- Round indent
o.shiftwidth = 2         -- Size of an indent
o.showmode = false       -- Dont show mode since we have a statusline
o.sidescrolloff = 8      -- Columns of context
o.signcolumn = "yes"     -- Always show the signcolumn, otherwise it would shift the text each time
o.smartcase = true       -- Don't ignore case with capitals
o.splitbelow = true      -- Put new windows below current
o.splitright = true      -- Put new windows right of current
o.tabstop = 2            -- Number of spaces tabs count for
o.termguicolors = true   -- True color support
o.timeoutlen = 500
o.undofile = true
o.undolevels = 10000
o.updatetime = 300               -- Save swap file and trigger CursorHold
o.wildmode = "longest:full,full" -- Command-line completion mode
o.winminwidth = 5                -- Minimum window width
o.hidden = true
o.wrap = true
o.relativenumber = true
o.autoindent = true
o.ai = true
o.si = true
o.smarttab = true
o.smartindent = true
o.title = true
o.hlsearch = true
o.showcmd = true
o.cmdheight = 0
o.softtabstop = 2
o.lazyredraw = false
o.writebackup = false
o.backup = false
o.list = true

o.showtabline = 0

if vim.fn.has("nvim-0.10") == 1 then
  o.smoothscroll = true
end

-- require("core.fold")
o.foldnestmax = 1 -- '1', '0' is not bad fold
o.exrc = true
o.foldenable = true
o.foldlevel = 99
o.foldlevelstart = 99
o.foldcolumn = "0" -- '1', '0' is not bad

-- g.loaded_gzip = 1
-- g.loaded_zip = 1
-- g.loaded_zipPlugin = 1
-- g.loaded_tar = 1
-- g.loaded_tarPlugin = 1
-- g.loaded_getscript = 1
-- g.loaded_getscriptPlugin = 1
-- g.loaded_vimball = 1
-- g.loaded_vimballPlugin = 1
-- g.loaded_2html_plugin = 1
-- g.loaded_logiPat = 1
-- g.loaded_rrhelper = 1
-- g.loaded_netrw = 1
-- g.loaded_netrwPlugin = 1
-- g.loaded_netrwSettings = 1
-- g.loaded_netrwFileHandlers = 1
-- g.loaded_remote_plugins = 1
-- g.loaded_tutor_mode_plugin = 1
-- g.loaded_spellfile_plugin = 1
-- g.loaded_shada_plugin = 1
-- g.rainbow_active = 1
g.loaded_perl_provider = 0
g.loaded_node_provider = 0

g.move_map_keys = 0

o.encoding = "utf-8"
o.fileencoding = "utf-8"

o.backspace = "start,eol,indent"
o.shell = "zsh"
o.backupskip = "/tmp/*,/private/tmp/*"
g.python3_host_prog = "/usr/bin/python"

vim.opt.shortmess:append({ W = true, I = true, c = true })
vim.opt.spelllang = { "en" }
vim.opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
vim.opt.listchars = {
  tab = "  ",
  eol = "󰌑",
  trail = "·",
  extends = "⋯",
  precedes = " ",
  nbsp = "␣",
  conceal = "┊",
}
-- {tab = "••"|">~",eol = "↴"|"¶"|"$", nbsp = "␣"|"%", space = "_" }
-- opt.listchars = { tab = [[→→]], trail = "•", extends = "»", precedes = "«" }

vim.opt.whichwrap:append("<,>,[,],h,l")
if vim.fn.has("nvim-0.9.0") == 1 then
  o.splitkeep = "screen"
  vim.opt.shortmess:append({ C = true })
end

-- Fix markdown indentation settings
g.markdown_recommended_style = 0
g.codeium_disable_bindings = 1

g.gitblame_highlight_group = "GitBlame"
g.gitblame_highlight_group = "Blame"

vim.cmd("let g:Hexokinase_highlighters = ['backgroundfull']") -- sign_column

-- g.virtcolumn_char = "┊" -- char to display the line
-- vim.cmd("set colorcolumn=80")

vim.cmd("set t_BE=")
vim.cmd("set nosc noru nosm")
vim.cmd("set nu rnu")
vim.cmd("set path+=**")
vim.cmd("set wildignore+=*node_modules*")
vim.cmd("set formatoptions+=r")
-- vim.cmd("set completeo-=preview")
vim.cmd("filetype plugin indent on")
-- vim.cmd("if !1 | finish | endif")
vim.cmd("set nocompatible")
vim.cmd("syntax enable")

-- vim.cmd("let g:deoplete#enable_at_startup=1")

vim.cmd("let g:go_def_mode='gopls'")
vim.cmd("let g:go_info_mode='gopls'")

-- Lf
g.lf_map_keys            = 0
g.lf_command_override    = 'lf -command "set ratios 1:1"'
-- Float Term
g.floaterm_borderchars   = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }
g.floaterm_width         = 0.9 -- default 0.6
g.floaterm_height        = 0.9 -- default 0.6
g.floaterm_rootmarkers   = { "Cargo.toml", "Cargo.toml.lock", "package.json", ".git", ".gitignore",
  "package-lock.json", "yarn.lock", "tsconfig.json" }
g.floaterm_opener        = "edit"
g.floaterm_wintype       = "float" -- options split, vsplit
g.floaterm_title         = "$1/$2" -- default 'floaterm: $1/$2'
g.floaterm_autoclose     = 2       -- defailt 1 options 0-2
g.floaterm_autohide      = 1       -- defailt 1 options 0-2
g.floaterm_autoinsert    = true    -- defailt true
g.floaterm_titleposition = "left"  -- options left, right, center
g.floaterm_position      =
"center"                           -- wintype 'split/vsplit': 'leftabove', 'aboveleft', 'rightbelow', 'belowright', 'topleft', 'botright' default 'botright'

g.floaterm_keymap_toggle = '<M-`>'
g.floaterm_keymap_new    = "``"
g.floaterm_keymap_prev   = "`p"
g.floaterm_keymap_next   = "`n"
g.floaterm_keymap_first  = "`h"
g.floaterm_keymap_last   = "`l"
g.floaterm_keymap_hide   = "`j"
g.floaterm_keymap_show   = "`k"
g.floaterm_keymap_kill   = "`;"

-- FZF
g.fzf_layout             = { window = { width = 0.9, height = 0.9, yoffset = 0.5 } }
g.fzf_action             = {
  ['ctrl-t'] = 'tab split',
  ['ctrl-b'] = 'split',
  ['ctrl-v'] = 'vsplit',
}

