local theme = require("core.colors")
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
opt.laststatus = 0         -- 2
opt.mouse = "a"            -- Enable mouse mode
opt.mouse = "nicr"
opt.number = true          -- Print line number
opt.pumblend = 0           -- Popup blend 10
opt.pumheight = 10         -- Maximum number of entries in a popup
opt.scrolloff = 4          -- Lines of context
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
opt.shiftround = true      -- Round indent
opt.shiftwidth = 2         -- Size of an indent
opt.shortmess:append({ W = true, I = true, c = true })
opt.showmode = false       -- Dont show mode since we have a statusline
opt.sidescrolloff = 8      -- Columns of context
opt.signcolumn = "yes"     -- Always show the signcolumn, otherwise it would shift the text each time
opt.smartcase = true       -- Don't ignore case with capitals
opt.spelllang = { "en" }
opt.splitbelow = true      -- Put new windows below current
opt.splitright = true      -- Put new windows right of current
opt.tabstop = 2            -- Number of spaces tabs count for
opt.termguicolors = true   -- True color support
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
opt.list = true -- Show some invisible characters (tabs...
opt.listchars = {
  tab = "  ",
  eol = "󰌑",
  trail = "·",
  extends = ">",
  precedes = "<",
  nbsp = "␣",
  conceal = "┊",
}

-- function _G.custom_fold_text()
--   local line = vim.fn.getline(vim.v.foldstart)
--
--   local line_count = vim.v.foldend - vim.v.foldstart + 1
--
--   -- return "       " .. line .. "···········" .. line_count .. " lines"
--   return "  " .. line .. "      [" .. line_count .. "]"
-- end
--
-- vim.opt.foldtext = 'v:lua.custom_fold_text()'
--
vim.opt.fillchars = { eob = "-", fold = " " }
--
-- vim.opt.viewoptions:remove("options")

-- -- -- opt.exrc = true
-- opt.foldenable = true
-- opt.foldlevel = 99
-- opt.foldlevelstart = 99
-- opt.foldcolumn = "0"  -- '1', '0' is not bad
-- vim.o.foldnestmax = 3 -- '1', '0' is not bad
-- vim.o.foldmethod = "manual"

vim.cmd([[
  set nofoldenable
  set foldlevel=99
  set fillchars=fold:
  set foldtext=CustomFoldText()
  setlocal foldmethod=expr
  setlocal foldexpr=GetPotionFold(v:lnum)

  function! GetPotionFold(lnum)
    if getline(a:lnum) =~? '\v^\s*$'
      return '-1'
    endif

    let this_indent = IndentLevel(a:lnum)
    let next_indent = IndentLevel(NextNonBlankLine(a:lnum))

    if next_indent == this_indent
      return this_indent
    elseif next_indent < this_indent
      return this_indent
    elseif next_indent > this_indent
      return '>' . next_indent
    endif
  endfunction

  function! IndentLevel(lnum)
      return indent(a:lnum) / &shiftwidth
  endfunction

  function! NextNonBlankLine(lnum)
    let numlines = line('$')
    let current = a:lnum + 1

    while current <= numlines
        if getline(current) =~? '\v\S'
            return current
        endif

        let current += 1
    endwhile

    return -2
  endfunction

  function! CustomFoldText()
    " get first non-blank line
    let fs = v:foldstart

    while getline(fs) =~ '^\s*$' | let fs = nextnonblank(fs + 1)
    endwhile

    if fs > v:foldend
        let line = getline(v:foldstart)
    else
        let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
    endif

    let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
    let foldSize = 1 + v:foldend - v:foldstart
    let foldSizeStr = " [" . foldSize . " lines] "
    let foldLevelStr = repeat(" ", v:foldlevel)
    let expansionString = repeat(" ", w - strwidth(foldSizeStr.line.foldLevelStr))
    return line . expansionString . foldSizeStr . foldLevelStr
  endfunction
]])

vim.o.showtabline = 0

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

vim.o.undofile = true

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

-- vim.cmd("set colorcolumn=80")
vim.cmd("set t_BE=")
vim.cmd("set nosc noru nosm")
vim.cmd("set nu rnu")
vim.cmd("set path+=**")
vim.cmd("set wildignore+=*node_modules*")
vim.cmd("set formatoptions+=r")
-- vim.cmd("set completeopt-=preview")
vim.cmd("filetype plugin indent on")
-- vim.cmd("if !1 | finish | endif")
vim.cmd("set nocompatible")
vim.cmd("syntax enable")

-- vim.cmd("let g:deoplete#enable_at_startup=1")

vim.cmd("let g:go_def_mode='gopls'")
vim.cmd("let g:go_info_mode='gopls'")

-- Float Term
vim.g.floaterm_borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }
vim.g.floaterm_width = 0.9  -- default 0.6
vim.g.floaterm_height = 0.9 -- default 0.6
vim.g.floaterm_rootmarkers = { "Cargo.toml", "Cargo.toml.lock", "package.json", ".git", ".gitignore",
  "package-lock.json", "yarn.lock", "tsconfig.json" }
vim.g.floaterm_opener = "edit"
vim.g.floaterm_wintype = "float"      -- options split, vsplit
vim.g.floaterm_title = "$1/$2"        -- default 'floaterm: $1/$2'
vim.g.floaterm_autoclose = 2          -- defailt 1 options 0-2
vim.g.floaterm_autohide = 1           -- defailt 1 options 0-2
vim.g.floaterm_autoinsert = true      -- defailt true
vim.g.floaterm_titleposition = "left" -- options left, right, center
vim.g.floaterm_position =
"center"                              -- wintype 'split/vsplit': 'leftabove', 'aboveleft', 'rightbelow', 'belowright', 'topleft', 'botright' default 'botright'
-- wintype 'float': 'top', 'bottom', 'left', 'right', 'topleft', 'topright', 'bottomleft', 'bottomright', 'center', 'auto'(at the cursor place) default 'center'
vim.g.floaterm_keymap_toggle = '<leader>`'
-- vim.g.floaterm_keymap_new = '`n'
-- vim.g.floaterm_keymap_next = '`j'
-- vim.g.floaterm_keymap_prev = '`k'
-- -- vim.g.floaterm_keymap_first = '`h'
-- -- vim.g.floaterm_keymap_last = '`l'
-- vim.g.floaterm_keymap_hide = '`h'
-- vim.g.floaterm_keymap_show = '`l'
-- vim.g.floaterm_keymap_kill = "`;"

-- FZF
vim.g.fzf_layout = { window = { width = 0.9, height = 0.9, yoffset = 0.5 } }
vim.g.fzf_action = {
  ['ctrl-t'] = 'tab split',
  ['ctrl-b'] = 'split',
  ['ctrl-v'] = 'vsplit',
}

-- -- Easyclip
-- vim.g.EasyClipAutoFormat = 0
-- vim.g.EasyClipYankHistorySize = 50
-- vim.g.EasyClipShareYanks = 0
-- vim.g.EasyClipShowYanksWidth = 80
-- vim.g.EasyClipShareYanksFile = ".easyclip"
-- vim.g.EasyClipShareYanksDirectory = "$HOME"
--
-- -- vim.g.EasyClipCopyEnabled = 1
-- -- vim.g.EasyClipCopyExplicitRegisterToDefault = 0
-- -- vim.g.EasyClipAlwaysMoveCursorToEndOfPaste = 1
-- -- vim.g.EasyClipPasteEnabled = 1
-- -- vim.g.EasyClipUseYanksClipboard = 1
-- -- vim.g.EasyClipCopyCommand = 'xclip -selection clipboard'
-- -- vim.g.EasyClipPasteCommand = 'xclip -selection clipboard -o'
-- -- vim.g.EasyClipShareYanksCommand = 'xclip -selection clipboard -o'
-- -- vim.g.EasyClipCopyPasteIgnoreList = { "fugitive://.*", "git://.*", "ssh://.*" }
--
-- vim.g.EasyClipUseYankDefaults = 1
-- vim.g.EasyClipUsePasteDefaults = 1
-- vim.g.EasyClipEnableBlackHoleRedirect = 1
-- vim.g.EasyClipUsePasteToggleDefaults = 1
-- vim.g.EasyClipUseSubstituteDefaults = 0
-- vim.g.EasyClipUseCutDefaults = 0
