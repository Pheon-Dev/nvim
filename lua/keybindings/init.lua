vim.g.mapleader = ' '
local map = vim.api.nvim_set_keymap

-- NvimTree
map("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { noremap = true, silent = true })

-- Saving and  ESC on insert Mode
map("i", "kk", "<cmd>w! | noh<cr><ESC>", { noremap = true, silent = true })
map("i", "jj", "<ESC>", { noremap = true, silent = true })
map("n", "m", "<cmd>w! | noh<cr>", { noremap = true, silent = true })
map("n", ",", "<cmd>lua vim.lsp.buf.formatting()<cr>", { noremap = true, silent = true })

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

-- Tagbar
map("n", "<C-t>", "<cmd>TagbarToggle<cr>", { noremap = true, silent = true })

-- Fold
vim.cmd([[ 
  nnoremap zh zfi)
  nnoremap zj zfi}
  nnoremap zk zfi]
  nnoremap zl za
  nnoremap z; zR
  nnoremap zg zM
]])

-- Easymotion
vim.cmd([[ 
  map s <Plug>(easymotion-prefix)
  map sh <Plug>(easymotion-Fl)
  map sj <Plug>(easymotion-j)
  map sk <Plug>(easymotion-k)
  map sl <Plug>(easymotion-fl)
  map sf <Plug>(easymotion-overwin-w)
  map s. <Plug>(easymotion-repeat)
]])

-- vim.cmd([[
--   map / <Plug>(easymotion-sn)
--   map / <Plug>(easymotion-tn)
--   map n <Plug>(easymotion-next)
--   map N <Plug>(easymotion-prev)
-- ]])

-- Shade Toggle
map("n", "S", ":lua require'shade'.toggle()<cr>", { noremap = true, silent = false })

map("i", "C-Return", "<cr><cr><C-o>k<TAB>", { noremap = true, silent = false })
