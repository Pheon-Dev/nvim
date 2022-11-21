vim.g.mapleader = " "
local map = vim.api.nvim_set_keymap

--[[ ESC ]]
map("i", "jj", "<esc>:lua vim.lsp.buf.format()<cr><esc>:noh<cr>", { noremap = true, silent = true })

-- Saving and Quitting
map("n", "<C-s>", ":lua vim.lsp.buf.formatting()<cr>", { noremap = true, silent = true })
map("n", "<C-p>", ":Prettier<cr><esc>:w! | noh<cr>", { noremap = true, silent = true })
map("n", "<C-q>", ":w! | bp | sp | bn | bd!<cr>", { noremap = true, silent = true })
--[[ map("n", "<C-x>", ":qa!<cr>", { noremap = true, silent = true }) ]]

-- Windows
map("n", "vj", ":vsplit<cr>", { noremap = true, silent = true })
map("n", "vk", ":split<cr>", { noremap = true, silent = true })
map("n", "vJ", "<C-w>t<C-w>K", { noremap = true, silent = true })
map("n", "vK", "<C-w>t<C-w>H", { noremap = true, silent = true })

map("n", "wh", ":WindowsEqualize<cr>", { noremap = true, silent = true })
map("n", "wj", ":WindowsMaximize<cr>", { noremap = true, silent = true })
map("n", "wk", ":WindowsMaximizeVertically<cr>", { noremap = true, silent = true })
map("n", "wl", ":WindowsMaximizeHorizontally<cr>", { noremap = true, silent = true })
map("n", "ww", ":WindowsToggleAutowidth<cr>", { noremap = true, silent = true })

map("n", "<C-Right>", ":vertical resize +3<cr>", { noremap = true, silent = true })
map("n", "<C-Left>", ":vertical resize -3<cr>", { noremap = true, silent = true })
map("n", "<C-Up>", ":resize +3<cr>", { noremap = true, silent = true })
map("n", "<C-Down>", ":resize -3<cr>", { noremap = true, silent = true })

-- Split Navigation
map("n", "<C-h>", "<C-w>h", { noremap = true, silent = false })
map("n", "<C-j>", "<C-w>j", { noremap = true, silent = false })
map("n", "<C-k>", "<C-w>k", { noremap = true, silent = false })
map("n", "<C-l>", "<C-w>l", { noremap = true, silent = false })

-- Editing Keybindings
map("i", "<C-z>", ":redo<cr>", { noremap = true, silent = true })
map("i", "<C-u>", ":undo<cr>", { noremap = true, silent = true })
map("n", "U", ":redo<cr>", { noremap = true, silent = true })

-- Indenting on Visual Mode
map("v", "<", "<gv", { noremap = true, silent = true })
map("v", ">", ">gv", { noremap = true, silent = true })

-- Buffer Navigation
map("n", "<TAB>", ":BufferLineCycleNext<cr>", { noremap = true, silent = true })
map("n", "<S-TAB>", ":BufferLineCyclePrev<cr>", { noremap = true, silent = true })

-- Gitsigns
map("v", "<leader>hs", ":Gitsigns stage_hunk<cr>", { noremap = true, silent = true })
map("v", "<leader>hr", ":Gitsigns reset_hunk<cr>", { noremap = true, silent = true })
map("o", "ih", "<C-U>Gitsigns select_hunk<CR>", { noremap = true, silent = true })
map("x", "ih", "<C-U>Gitsigns select_hunk<CR>", { noremap = true, silent = true })
map("n", "[c", "&diff ? '[c' : ':Gitsigns prev_hunk<cr>'", { expr = true, noremap = true, silent = true })
map("n", "]c", "&diff ? ']c' : ':Gitsigns next_hunk<cr>'", { expr = true, noremap = true, silent = true })

-- Telescope
map("i", "<C-h>", ":Telescope find_files hidden=true<cr>", { noremap = true, silent = true })
map("i", "<C-n>", ":Telescope buffers<cr>", { noremap = true, silent = true })

-- Edit (change)
map("n", "c1", "ciw", { noremap = true, silent = true })
map("n", "c2", 'ci"', { noremap = true, silent = true })
map("n", "c3", "ci'", { noremap = true, silent = true })
map("n", "c4", "ci`", { noremap = true, silent = true })
map("n", "c5", "ci>", { noremap = true, silent = true })
map("n", "c6", "ca>", { noremap = true, silent = true })
map("n", "c7", "ci}", { noremap = true, silent = true })
map("n", "c8", "ca}", { noremap = true, silent = true })
map("n", "c9", "ci)", { noremap = true, silent = true })
map("n", "c0", "ca)", { noremap = true, silent = true })
map("n", "c-", "ci]", { noremap = true, silent = true })
map("n", "c=", "ca]", { noremap = true, silent = true })
map("n", "c>", "^f>lct<", { noremap = true, silent = true })
map("n", "c<", "^llct>", { noremap = true, silent = true })
map("n", "c;", "ct;", { noremap = true, silent = true })
map("n", "c:", "ct:", { noremap = true, silent = true })
map("n", "c ", "ct ", { noremap = true, silent = true })
map("n", "c,", "ct,", { noremap = true, silent = true })
map("n", "c.", "ct.", { noremap = true, silent = true })
map("n", "c'", "ct'", { noremap = true, silent = true })
map("n", 'c"', 'ct"', { noremap = true, silent = true })
map("n", "cp", 'cip"', { noremap = true, silent = true })
map("n", "B", "c^", { noremap = true, silent = true })

-- Edit (delete)
map("n", "d1", "diw", { noremap = true, silent = true })
map("n", "d2", 'di"', { noremap = true, silent = true })
map("n", "d3", "di'", { noremap = true, silent = true })
map("n", "d4", "di`", { noremap = true, silent = true })
map("n", "d5", "di>", { noremap = true, silent = true })
map("n", "d6", "da>", { noremap = true, silent = true })
map("n", "d7", "di}", { noremap = true, silent = true })
map("n", "d8", "da}", { noremap = true, silent = true })
map("n", "d9", "di)", { noremap = true, silent = true })
map("n", "d0", "da)", { noremap = true, silent = true })
map("n", "d-", "di]", { noremap = true, silent = true })
map("n", "d=", "da]", { noremap = true, silent = true })
map("n", "d>", "^f>ldt<", { noremap = true, silent = true })
map("n", "d<", "^lldt>", { noremap = true, silent = true })
map("n", "d;", "dt;", { noremap = true, silent = true })
map("n", "d:", "dt:", { noremap = true, silent = true })
map("n", "d ", "dt ", { noremap = true, silent = true })
map("n", "d,", "dt,", { noremap = true, silent = true })
map("n", "d.", "dt.", { noremap = true, silent = true })
map("n", "d'", "dt'", { noremap = true, silent = true })
map("n", 'd"', 'dt"', { noremap = true, silent = true })
map("n", "dp", "dipdd", { noremap = true, silent = true })
map("n", "X", "d^", { noremap = true, silent = true })

-- Edit (visual)
map("n", "v1", "viw", { noremap = true, silent = true })
map("n", "v2", 'vi"', { noremap = true, silent = true })
map("n", "v3", "vi'", { noremap = true, silent = true })
map("n", "v4", "vi`", { noremap = true, silent = true })
map("n", "v5", "vi>", { noremap = true, silent = true })
map("n", "v6", "va>", { noremap = true, silent = true })
map("n", "v7", "vi}", { noremap = true, silent = true })
map("n", "v8", "va}", { noremap = true, silent = true })
map("n", "v9", "vi)", { noremap = true, silent = true })
map("n", "v0", "va)", { noremap = true, silent = true })
map("n", "v-", "vi]", { noremap = true, silent = true })
map("n", "v=", "va]", { noremap = true, silent = true })
map("n", "v>", "^f>lvt<", { noremap = true, silent = true })
map("n", "v<", "^llvt>", { noremap = true, silent = true })
map("n", "v;", "vt;", { noremap = true, silent = true })
map("n", "v:", "vt:", { noremap = true, silent = true })
map("n", "v ", "vt ", { noremap = true, silent = true })
map("n", "v,", "vt,", { noremap = true, silent = true })
map("n", "v.", "vt.", { noremap = true, silent = true })
map("n", "v'", "vt'", { noremap = true, silent = true })
map("n", 'v"', 'vt"', { noremap = true, silent = true })
map("n", "vb", "vip", { noremap = true, silent = true })
map("n", "vL", "v$", { noremap = true, silent = true })

-- Edit (yank)
map("n", "y1", "yiw", { noremap = true, silent = true })
map("n", "y2", 'yi"', { noremap = true, silent = true })
map("n", "y3", "yi'", { noremap = true, silent = true })
map("n", "y4", "yi`", { noremap = true, silent = true })
map("n", "y5", "yi>", { noremap = true, silent = true })
map("n", "y6", "ya>", { noremap = true, silent = true })
map("n", "y7", "yi}", { noremap = true, silent = true })
map("n", "y8", "ya}", { noremap = true, silent = true })
map("n", "y9", "yi)", { noremap = true, silent = true })
map("n", "y0", "ya)", { noremap = true, silent = true })
map("n", "y-", "yi]", { noremap = true, silent = true })
map("n", "y=", "ya]", { noremap = true, silent = true })
map("n", "v>", "^f>lyt<", { noremap = true, silent = true })
map("n", "v<", "^llyt>", { noremap = true, silent = true })
map("n", "y;", "yt;", { noremap = true, silent = true })
map("n", "y:", "yt:", { noremap = true, silent = true })
map("n", "y ", "yt ", { noremap = true, silent = true })
map("n", "y,", "yt,", { noremap = true, silent = true })
map("n", "y.", "yt.", { noremap = true, silent = true })
map("n", "y'", "yt'", { noremap = true, silent = true })
map("n", 'y"', 'yt"', { noremap = true, silent = true })
map("n", "yp", "yip", { noremap = true, silent = true })

-- Move to Start/End of Line
map("n", "H", "^", { noremap = true, silent = true })
map("n", "L", "$", { noremap = true, silent = true })
map("n", "e", "w", { noremap = true, silent = true })
map("n", "vv", "v", { noremap = true, silent = true })

map("n", "cd", "cc<esc>", { noremap = true, silent = true })
map("n", "co", "cc<esc>ddO<esc>", { noremap = true, silent = true })
map("n", "ci", "ddO", { noremap = true, silent = true })
map("n", "dh", "c^<esc>", { noremap = true, silent = true })
map("n", "ch", "c^", { noremap = true, silent = true })
map("n", "tl", ":ToggleTerm size=60 dir=. direction=vertical<cr>", { noremap = true, silent = true })
map("n", "tj", ":ToggleTerm size=20 dir=. direction=horizontal<cr>", { noremap = true, silent = true })

-- Easymotion
map("n", "s", "<Plug>(easymotion-prefix)", { noremap = true, silent = true })
map("n", "sh", "<Plug>(easymotion-Fl)", { noremap = true, silent = true })
map("n", "sj", "<Plug>(easymotion-j)", { noremap = true, silent = true })
map("n", "sk", "<Plug>(easymotion-k)", { noremap = true, silent = true })
map("n", "sl", "<Plug>(easymotion-fl)", { noremap = true, silent = true })
map("n", "sf", "<Plug>(easymotion-overwin-w)", { noremap = true, silent = true })
map("n", "s.", "<Plug>(easymotion-repeat)", { noremap = true, silent = true })

-- Shade Toggle
map("n", "S", ":lua require'shade'.toggle()<cr>", { noremap = true, silent = false })

map("i", "C-Return", "<cr><cr><C-o>k<TAB>", { noremap = true, silent = false })

-- Dial
map("n", "<C-x>", require("dial.map").inc_normal(), { noremap = true })
map("n", "X", require("dial.map").dec_normal(), { noremap = true })
map("v", "<C-x>", require("dial.map").inc_visual(), { noremap = true })
map("v", "X", require("dial.map").dec_visual(), { noremap = true })
map("v", "g<C-x>", require("dial.map").inc_gvisual(), { noremap = true })
map("v", "gX", require("dial.map").dec_gvisual(), { noremap = true })

-- hlslens
local kopts = { noremap = true, silent = true }

map('n', 'n',
  [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
  kopts)
map('n', 'N',
  [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
  kopts)
map('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
map('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
map('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
map('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)

map('n', '<Leader>l', ':noh<CR>', kopts)

-- Neogen
local opts = { noremap = true, silent = true }
map("n", "<Leader>ng", ":lua require('neogen').generate()<CR>", opts)
map("i", "<C-l>", ":lua require('neogen').jump_next<CR>", opts)
map("i", "<C-h>", ":lua require('neogen').jump_prev<CR>", opts)
map("n", "<Leader>nc", ":lua require('neogen').generate({ type = 'class' })<CR>", opts)
map("n", "<Leader>nf", ":lua require('neogen').generate({ type = 'func' })<CR>", opts)
map("n", "<Leader>nt", ":lua require('neogen').generate({ type = 'type' })<CR>", opts)

vim.keymap.set("n", "<c-f>", function()
  if not require("noice.lsp").scroll(4) then
    return "<c-f>"
  end
end, { silent = true, expr = true })

vim.keymap.set("n", "<c-b>", function()
  if not require("noice.lsp").scroll(-4) then
    return "<c-b>"
  end
end, { silent = true, expr = true })

--[[ Fold ]]
local fp = require('fold-preview')
local mapping = require('fold-preview').mapping
local keymap = vim.keymap
keymap.amend = require('keymap-amend')

fp.setup({
  default_keybindings = false
  -- another settings
})

keymap.amend('n', 'K', function(original)
  if not fp.toggle_preview() then original() end
  -- or
  -- if not fp.show_preview() then original() end
  -- to close preview on second press on K.
end)
keymap.amend('n', 'h', mapping.close_preview_open_fold)
keymap.amend('n', 'l', mapping.close_preview_open_fold)
keymap.amend('n', 'zo', mapping.close_preview)
keymap.amend('n', 'zO', mapping.close_preview)
keymap.amend('n', 'zc', mapping.close_preview_without_defer)
keymap.amend('n', 'zR', mapping.close_preview)
keymap.amend('n', 'zM', mapping.close_preview_without_defer)

map("n", "zh", "zfi)", { noremap = true, silent = true })
map("n", "zj", "zfi}", { noremap = true, silent = true })
map("n", "zk", "zfi]", { noremap = true, silent = true })
map("n", "zl", "za", { noremap = true, silent = true })
map("n", "z;", "zR", { noremap = true, silent = true })
map("n", "zg", "zM", { noremap = true, silent = true })
