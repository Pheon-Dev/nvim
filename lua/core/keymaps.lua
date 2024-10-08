local enable = require("config").enable

vim.g.mapleader = " "
local map = vim.api.nvim_set_keymap

-- Saving and  ESC on insert Mode
map("i", "jj", "<esc>", { noremap = true, silent = true })
-- map("i", "'", ",", { noremap = true, silent = true })
-- map("n", "<C-s>", "<esc>:lua vim.lsp.buf.format()<cr><esc>:w! | noh<cr>", { noremap = true, silent = true })
-- map("n", "<A-s>", "<esc>:lua require('format-on-save').format()<cr><esc>:w! | noh<cr>", { noremap = true, silent = true })

-- Windows
-- map("n", "<C-l>", "<C-w>p", { noremap = true, silent = true })
-- map("n", "<A-n>", "<C-w>w", { noremap = true, silent = true })
-- map("n", "<A-l>", "<C-w>l", { noremap = true, silent = true })
-- map("n", "<A-h>", "<C-w>h", { noremap = true, silent = true })
-- map("n", "<A-k>", "<C-w>k", { noremap = true, silent = true })
-- map("n", "<A-j>", "<C-w>j", { noremap = true, silent = true })
map("n", "<A-x>", "<C-w>x", { noremap = true, silent = true })

-- Lua
vim.keymap.set("n", "<leader>rs", require("substitute").operator, { noremap = true })
vim.keymap.set("n", "<leader>rss", require("substitute").line, { noremap = true })
vim.keymap.set("n", "<leader>rS", require("substitute").eol, { noremap = true })
vim.keymap.set("x", "<leader>rs", require("substitute").visual, { noremap = true })

--[[ map("n", "<A-l>", "<cmd>lua require('tmux').move_right()<cr>", { noremap = true, silent = true })
map("n", "<A-h>", "<cmd>lua require('tmux').move_left()<cr>", { noremap = true, silent = true })
map("n", "<A-k>", "<cmd>lua require('tmux').move_up()<cr>", { noremap = true, silent = true })
map("n", "<A-j>", "<cmd>lua require('tmux').move_down()<cr>", { noremap = true, silent = true }) ]]

map("n", "<leader>wv", ":vsplit<cr>", { noremap = true, silent = true })
map("n", "<leader>wb", ":split<cr>", { noremap = true, silent = true })

map("n", "<A-y>", "<C-w>t<C-w>K", { noremap = true, silent = true, desc = "Switch Vertical" })
map("n", "<A-t>", "<C-w>t<C-w>H", { noremap = true, silent = true, desc = "Switch Horizontal" })

map("n", "<leader>wa", ":w ++p ", { noremap = true, silent = true })
-- map("n", ">", ":vertical resize +3<cr>", { noremap = true, silent = true })
-- map("n", "<", ":vertical resize -3<cr>", { noremap = true, silent = true })
-- map("n", "(", ":resize +3<cr>", { noremap = true, silent = true })
-- map("n", ")", ":resize -3<cr>", { noremap = true, silent = true })

map("n", "<leader>wr", ":SudaRead<cr>", { noremap = true, silent = true })
map("n", "<leader>ww", ":SudaWrite<cr>", { noremap = true, silent = true })

-- Editing Keybindings
map("n", "U", ":redo<cr>", { noremap = true, silent = true })

-- Move to Start/End of Line
-- map("n", "<C-k>", "-", { noremap = true, silent = true })
-- map("n", "<C-j>", "+", { noremap = true, silent = true })
map("n", "<C-h>", "zt", { noremap = true, silent = true })
map("n", "<C-l>", "zb", { noremap = true, silent = true })
-- map("n", "<C-k>", "O<esc>", { noremap = true, silent = true })
-- map("n", "<C-j>", "o<esc>", { noremap = true, silent = true })
map("n", "H", "^", { noremap = true, silent = true })
map("n", "L", "$", { noremap = true, silent = true })

-- Tabs
--[[ map("n", "tt", ":tabnew<cr>", { noremap = true, silent = true })
map("n", "th", ":tabclose<cr>", { noremap = true, silent = true })
map("n", "tj", ":tabnext<cr>", { noremap = true, silent = true })
map("n", "tk", ":tabprevious<cr>", { noremap = true, silent = true }) ]]
-- map("n", "ts", ":tabs<cr>", { noremap = true, silent = true })
-- map("n", "th", ":tabfirst<cr>", { noremap = true, silent = true })
-- map("n", "tl", ":tablast<cr>", { noremap = true, silent = true })

-- remap
-- map("n", "cc", "0D", { noremap = true, silent = true })
-- map("n", "X", "v0c", { noremap = true, silent = true })
-- map("n", ";", ":", { noremap = true, silent = true })
-- vim.cmd("nnoremap ; :")
-- map("n", "gi", "<C-i>", { noremap = true, silent = true })
-- map("n", "go", "<C-o>", { noremap = true, silent = true })

-- map("i", "<A-o>", "<C-o>", { noremap = true, silent = true })
map("i", "<C-k>", "<C-o>O", { noremap = true, silent = true })
map("i", "<C-j>", "<C-o>o", { noremap = true, silent = true })
map("i", "<C-l>", "<C-o>A", { noremap = true, silent = true })
map("i", "<C-h>", "<C-o>I", { noremap = true, silent = true })

-- todo-comments
vim.keymap.set("n", "]t", function()
  require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
  require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

-- Buffer Navigation
map("n", "<TAB>", ":bnext<cr>", { noremap = true, silent = true })
map("n", "<S-TAB>", ":bprevious<cr>", { noremap = true, silent = true })

-- map("v", "H", "<gv", { noremap = true, silent = true })
-- map("v", "L", ">gv", { noremap = true, silent = true })
-- map("x", "J", ":move '>+1<cr>gv-gv", { noremap = true, silent = true })
-- map("x", "K", ":move '<-2<cr>gv-gv", { noremap = true, silent = true })

--[[ -- if enable.codeium then
vim.keymap.set("i", "<A-a>", function()
  return vim.fn["codeium#Accept"]()
end, { expr = true, silent = true, desc = "Accept Suggestion" })
vim.keymap.set("i", "<A-c>", function()
  return vim.fn["codeium#Accept"]()
end, { expr = true, silent = true, desc = "Accept Suggestion" })
vim.keymap.set("i", "<A-f>", function()
  return vim.fn["codeium#CycleCompletions"](1)
end, { expr = true, silent = true, desc = "Cycle Completions Forward" })
vim.keymap.set("i", "<A-b>", function()
  return vim.fn["codeium#CycleCompletions"](-1)
end, { expr = true, silent = true, desc = "Cycle Completions Backward" })
vim.keymap.set("i", "<A-x>", function()
  return vim.fn["codeium#Clear"]()
end, { expr = true, silent = true, desc = "Clear Completions" }) ]]

-- Fzf and Floaterm
local keybind_opts = { silent = true, noremap = true }

map("n", "<leader>s", ":FloatermNew rg<CR>", keybind_opts)
-- map("n", "<leader>r", ":FloatermNew serpl<CR>", keybind_opts)
map("n", "<leader>c", ":FloatermNew fzf<CR>", keybind_opts)
map("n", "<leader>;", ":FloatermNew lf<CR>", keybind_opts)
map("n", "<leader>l", ":FloatermNew lazygit<CR>", keybind_opts)
map("n", "<leader>f", ":FloatermNew broot<CR>", keybind_opts)
map("n", "<leader><leader>", ":FloatermNew spf .<CR>", keybind_opts)
map("n", "tp", ":FloatermNew --position=bottom --width=100 height=20 toipe<CR>", keybind_opts)
map("n", "<leader>z", ":Lazy<CR>", keybind_opts)
map("n", "<leader>u", ":Lazy update<CR>", keybind_opts)
-- map("n", "<C-n>", ":FloatermNew<CR>", keybind_opts)

map("n", "<leader>e", ":MurenToggle<cr>", keybind_opts)
map("v", "<leader>e", ":MurenToggle<cr>", keybind_opts)
-- map("n", "<leader>n", ":lua require('notify')._print_history()<cr>", keybind_opts)

--[[ -- Keyboard users
vim.keymap.set("n", "<C-k>", function()
  require("menu").open("default")
end, {})

-- mouse users + nvimtree users!
vim.keymap.set("n", "<RightMouse>", function()
  vim.cmd.exec('"normal! \\<RightMouse>"')

  local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
  require("menu").open(options, { mouse = true })
end, {}) ]]

--[[ vim.api.nvim_set_keymap("n", "<C-k>", ":lua require('kulala').jump_prev()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-j>", ":lua require('kulala').jump_next()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", ":lua require('kulala').run()<CR>", { noremap = true, silent = true }) ]]

-- tips
--
-- Yank till word
-- y/word<cr>
-- y/word/e<cr>
--
-- 0 0 0 0 0 -> 0 1 2 3 4
-- CTRL-V#j|k g CTRL-A
--
-- capitalisation
-- guu
-- gUU
-- gu#j|k
-- gU#j|k
