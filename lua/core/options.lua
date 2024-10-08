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

-- vim.o.guifont = "Maple Mono:h11"
-- vim.o.guifont = "Maple Mono"
vim.opt.linespace = 0
vim.g.neovide_scale_factor = 0.8

vim.g.neovide_padding_top = 2
vim.g.neovide_padding_bottom = 0
vim.g.neovide_padding_right = 2
vim.g.neovide_padding_left = 2

vim.g.neovide_floating_shadow = true
vim.g.neovide_floating_z_height = 10
vim.g.neovide_light_angle_degrees = 45
vim.g.neovide_light_radius = 5

vim.g.neovide_floating_blur_amount_x = 2.0
vim.g.neovide_floating_blur_amount_y = 2.0

vim.g.neovide_window_blurred = false
vim.g.neovide_transparency = 1.0
vim.g.neovide_cursor_vfx_mode = "railgun"

o.autowrite = true -- Enable auto write
-- o.autowriteall = true        -- Enable auto write
o.clipboard = "unnamedplus" -- Sync with system clipboard
o.completeopt = "menu,menuone,noselect"
o.conceallevel = 0 -- Hide * markup for bold and italic 3
o.confirm = true -- Confirm to save changes before exiting modified buffer
o.cursorline = true -- Enable highlighting of the current line
o.expandtab = true -- Use spaces instead of tabs
o.formatoptions = "jcroqlnt" -- tcqj
o.grepformat = "%f:%l:%c:%m"
o.grepprg = "rg --vimgrep"
o.ignorecase = true -- Ignore case
o.inccommand = "nosplit" -- preview incremental substitute
o.laststatus = 2 -- 3
o.mouse = "a" -- Enable mouse mode
-- o.mouse = "nicr"
o.number = true -- Print line number
o.pumblend = 10 -- Popup blend 10
o.pumheight = 10 -- Maximum number of entries in a popup
o.scrolloff = 5 -- Lines of context 999
o.shiftround = true -- Round indent
o.shiftwidth = 2 -- Size of an indent
o.showmode = false -- Dont show mode since we have a statusline
o.sidescrolloff = 8 -- Columns of context
o.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
o.smartcase = true -- Don't ignore case with capitals
o.splitbelow = true -- Put new windows below current
o.splitright = true -- Put new windows right of current
o.tabstop = 2 -- Number of spaces tabs count for
o.termguicolors = true -- True color support
o.timeoutlen = 500
o.undofile = true
o.undolevels = 10000
o.updatetime = 300 -- Save swap file and trigger CursorHold
o.wildmode = "longest:full,full" -- Command-line completion mode
o.winminwidth = 5 -- Minimum window width
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
-- o.foldmethod = "indent"

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
--[[ vim.opt.shortmess:append({ W = true, I = true, c = true }) ]]
vim.opt.spelllang = { "en" }
vim.opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
vim.opt.listchars = {
  tab = "  ",
  eol = "󰌑", --↴
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
  vim.opt.shortmess:append({ W = true, C = true })
  -- vim.opt.shortmess:append({ W = true, I = true, C = true })
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

-- lf
g.lf_map_keys = 0
g.lf_command_override = 'lf -command "set ratios 1:1"'
-- float term
g.floaterm_borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }
g.floaterm_width = 0.9 -- default 0.6
g.floaterm_height = 0.9 -- default 0.6
g.floaterm_rootmarkers = {
  "cargo.toml",
  "cargo.toml.lock",
  "package.json",
  ".git",
  ".gitignore",
  "package-lock.json",
  "yarn.lock",
  "tsconfig.json",
}
g.floaterm_opener = "edit"
g.floaterm_wintype = "float" -- options split, vsplit
g.floaterm_title = "$1/$2" -- default 'floaterm: $1/$2'
g.floaterm_autoclose = 2
g.floaterm_autohide = 1
g.floaterm_autoinsert = true
g.floaterm_titleposition = "left" -- options left, right, center
g.floaterm_position = "center" -- wintype 'split/vsplit': 'leftabove', 'aboveleft', 'rightbelow', 'belowright', 'topleft', 'botright' default 'botright'

g.floaterm_keymap_toggle = "<C-t>"
g.floaterm_keymap_new = "tn"
g.floaterm_keymap_prev = "tj"
g.floaterm_keymap_next = "tk"
-- g.floaterm_keymap_first = "th"
-- g.floaterm_keymap_last = "tl"
-- g.floaterm_keymap_hide = "tj"
-- g.floaterm_keymap_show = "tk"
g.floaterm_keymap_kill = "tx"

-- FZF
g.fzf_layout = { window = { width = 0.9, height = 0.9, yoffset = 0.5 } }
g.fzf_action = {
  ["ctrl-t"] = "tab split",
  ["ctrl-b"] = "split",
  ["ctrl-v"] = "vsplit",
}

g.bookmark_no_default_key_mappings = 1
g.bookmark_sign = ""
g.bookmark_annotation_sign = ""
g.bookmark_save_per_working_dir = 1
g.bookmark_auto_save = 1
g.bookmark_manage_per_buffer = 0
-- g.bookmark_auto_save_file = '$HOME' .. '/.vim-bookmarks'
g.bookmark_auto_close = 0
g.bookmark_highlight_lines = 0
g.bookmark_show_warning = 1
g.bookmark_show_toggle_warning = 1
g.bookmark_center = 0
g.bookmark_no_default_key_mappings = 0
g.bookmark_location_list = 0
g.bookmark_disable_ctrlp = 0
g.bookmark_display_annotation = 0

vim.filetype.add({
  extension = {
    ["http"] = "http",
  },
})
