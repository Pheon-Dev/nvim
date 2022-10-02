vim.g.mapleader = ' '
local map = vim.api.nvim_set_keymap

-- NvimTree
map("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { noremap = true, silent = true })

-- Saving and  ESC on insert Mode
map("i", "kk", "<esc><cmd>w! | noh<cr><esc>", { noremap = true, silent = true })
map("i", "jj", "<esc>", { noremap = true, silent = true })
map("n", ",", "<esc><cmd>lua vim.lsp.buf.format()<cr><esc><cmd>w! | noh<cr>", { noremap = true, silent = true })
map("n", "'", ",", { noremap = true, silent = true })

-- Saving and Quitting
map("n", "<C-s>", "<cmd>lua vim.lsp.buf.formatting()<cr>", { noremap = true, silent = true })
map("n", "<C-p>", "<cmd>Prettier<cr>", { noremap = true, silent = true })
map("n", "<C-q>", "<cmd>w! | bp | sp | bn | bd!<cr>", { noremap = true, silent = true })
map("n", "<C-x>", "<cmd>qa!<cr>", { noremap = true, silent = true })

-- Window Splitting
map("n", "<F1>", "<cmd>vsplit<cr>", { noremap = true, silent = true })
map("n", "<F2>", "<cmd>split<cr>", { noremap = true, silent = true })

-- Window Resizing
map("n", "<C-Left>", "<cmd>vertical resize +3<cr>", { noremap = true, silent = true })
map("n", "<C-Right>", "<cmd>vertical resize -3<cr>", { noremap = true, silent = true })
map("n", "<C-Up>", "<cmd>resize +3<cr>", { noremap = true, silent = true })
map("n", "<C-Down>", "<cmd>resize -3<cr>", { noremap = true, silent = true })

-- Split Navigation
map("n", "<C-h>", "<C-w>h", { noremap = true, silent = false })
map("n", "<C-j>", "<C-w>j", { noremap = true, silent = false })
map("n", "<C-k>", "<C-w>k", { noremap = true, silent = false })
map("n", "<C-l>", "<C-w>l", { noremap = true, silent = false })

-- Editing Keybindings
map("i", "<C-z>", "<cmd>redo<cr>", { noremap = true, silent = true })
map("i", "<C-u>", "<cmd>undo<cr>", { noremap = true, silent = true })
map("n", "<S-u>", "<cmd>redo<cr>", { noremap = true, silent = true })

-- Indenting on Visual Mode
map("v", "<", "<gv", { noremap = true, silent = true })
map("v", ">", ">gv", { noremap = true, silent = true })

-- Buffer Navigation
map("n", "<TAB>", "<cmd>BufferLineCycleNext<cr>", { noremap = true, silent = true })
map("n", "<S-TAB>", "<cmd>BufferLineCyclePrev<cr>", { noremap = true, silent = true })

-- Gitsigns
map("v", "<leader>hs", "<cmd>Gitsigns stage_hunk<cr>", { noremap = true, silent = true })
map("v", "<leader>hr", "<cmd>Gitsigns reset_hunk<cr>", { noremap = true, silent = true })
map("o", "ih", "<C-U>Gitsigns select_hunk<CR>", { noremap = true, silent = true })
map("x", "ih", "<C-U>Gitsigns select_hunk<CR>", { noremap = true, silent = true })
map("n", "[c", "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<cr>'", { expr = true, noremap = true, silent = true })
map("n", "]c", "&diff ? ']c' : '<cmd>Gitsigns next_hunk<cr>'", { expr = true, noremap = true, silent = true })

-- Telescope
map("i", "<C-h>", "<cmd>Telescope find_files hidden=true<cr>", { noremap = true, silent = true })
map("i", "<C-n>", "<cmd>Telescope buffers<cr>", { noremap = true, silent = true })

-- Zen
map("n", "W", "<cmd>set winbar=%f<cr><esc><cmd>lua vim.o.ls = 0<cr><esc><cmd>lua vim.o.ch = 0<cr><esc>", { noremap = true, silent = true })
map("n", "Q", "<cmd>lua vim.o.ls = 2<cr><esc><cmd>lua vim.o.ch = 1<cr><esc><cmd>set winbar=<cr><esc>", { noremap = true, silent = true })

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
map("n", 'cp', 'cip"', { noremap = true, silent = true })

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
map("n", 'dp', 'dip', { noremap = true, silent = true })

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
map("n", 'vp', 'vip', { noremap = true, silent = true })

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
map("n", 'yp', 'yip', { noremap = true, silent = true })

map("n", "X", "c0", { noremap = true, silent = true })

-- Fold
map("n", "zh", "zfi)", { noremap = true, silent = true })
map("n", "zj", "zfi}", { noremap = true, silent = true })
map("n", "zk", "zfi]", { noremap = true, silent = true })
map("n", "zl", "za", { noremap = true, silent = true })
map("n", "z;", "zR", { noremap = true, silent = true })
map("n", "zg", "zM", { noremap = true, silent = true })

-- Move to Start/End of Line
map("n", "H", "^", { noremap = true, silent = true })
map("n", "L", "$", { noremap = true, silent = true })

map("n", "cd", "cc<esc>", { noremap = true, silent = true })
map("n", "co", "cc<esc>ddO<esc>", { noremap = true, silent = true })
map("n", "ci", "ddO", { noremap = true, silent = true })

-- Easymotion
map("n", "s", "<Plug>(easymotion-prefix)", { noremap = true, silent = true })
map("n", "sh", "<Plug>(easymotion-Fl)", { noremap = true, silent = true })
map("n", "sj", "<Plug>(easymotion-j)", { noremap = true, silent = true })
map("n", "sk", "<Plug>(easymotion-k)", { noremap = true, silent = true })
map("n", "sl", "<Plug>(easymotion-fl)", { noremap = true, silent = true })
map("n", "sf", "<Plug>(easymotion-overwin-w)", { noremap = true, silent = true })
map("n", "s.", "<Plug>(easymotion-repeat)", { noremap = true, silent = true })

-- vim.cmd([[
--   map / <Plug>(easymotion-sn)
--   map / <Plug>(easymotion-tn)
--   map n <Plug>(easymotion-next)
--   map N <Plug>(easymotion-prev)
-- ]])

-- Shade Toggle
map("n", "S", ":lua require'shade'.toggle()<cr>", { noremap = true, silent = false })

map("i", "C-Return", "<cr><cr><C-o>k<TAB>", { noremap = true, silent = false })
