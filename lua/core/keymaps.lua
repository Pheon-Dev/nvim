local enable = require("config").enable

vim.g.mapleader = " "
local map = vim.api.nvim_set_keymap

-- Saving and  ESC on insert Mode
map("i", "jj", "<esc>", { noremap = true, silent = true })
map("i", "<esc>", "<esc>", { noremap = true, silent = true })
-- map("i", "'", ",", { noremap = true, silent = true })
map("n", "<A-s>", "<esc>:lua vim.lsp.buf.format()<cr><esc>:w! | noh<cr>", { noremap = true, silent = true })
-- map("n", "<A-s>", "<esc>:lua require('format-on-save').format()<cr><esc>:w! | noh<cr>", { noremap = true, silent = true })

-- Windows
-- map("n", "<C-l>", "<C-w>p", { noremap = true, silent = true })
-- map("n", "<A-n>", "<C-w>w", { noremap = true, silent = true })
map("n", "<A-l>", "<C-w>l", { noremap = true, silent = true })
map("n", "<A-h>", "<C-w>h", { noremap = true, silent = true })
map("n", "<A-k>", "<C-w>k", { noremap = true, silent = true })
map("n", "<A-j>", "<C-w>j", { noremap = true, silent = true })
map("n", "<A-x>", "<C-w>x", { noremap = true, silent = true })

map("n", "<A-v>", ":vsplit<cr>", { noremap = true, silent = true })
map("n", "<A-b>", ":split<cr>", { noremap = true, silent = true })

map("n", "<A-V>", "<C-w>t<C-w>K", { noremap = true, silent = true, desc = "Switch Vertical" })
map("n", "<A-B>", "<C-w>t<C-w>H", { noremap = true, silent = true, desc = "Switch Horizontal" })

map("n", "<A-a>", ":w ++p ", { noremap = true, silent = true })
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
map("n", "tt", ":tabnew<cr>", { noremap = true, silent = true })
map("n", "th", ":tabclose<cr>", { noremap = true, silent = true })
map("n", "tj", ":tabnext<cr>", { noremap = true, silent = true })
map("n", "tk", ":tabprevious<cr>", { noremap = true, silent = true })
-- map("n", "ts", ":tabs<cr>", { noremap = true, silent = true })
-- map("n", "th", ":tabfirst<cr>", { noremap = true, silent = true })
-- map("n", "tl", ":tablast<cr>", { noremap = true, silent = true })

-- remap
-- map("n", "cc", "0D", { noremap = true, silent = true })
map("n", "X", "v0c", { noremap = true, silent = true })
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

if enable.codeium then
  -- Split Join
  vim.keymap.set("n", "gs", ":TSJToggle<cr>", { noremap = true, silent = true })

  vim.keymap.set("i", "<C-c>", function()
    return vim.fn["codeium#Accept"]()
  end, { expr = true, silent = true, desc = "Accept Suggestion" })
  vim.keymap.set("i", "<C-]>", function()
    return vim.fn["codeium#CycleCompletions"](1)
  end, { expr = true, silent = true, desc = "Cycle Completions Forward" })
  vim.keymap.set("i", "<C-[>", function()
    return vim.fn["codeium#CycleCompletions"](-1)
  end, { expr = true, silent = true, desc = "Cycle Completions Backward" })
  vim.keymap.set("i", "<C-u>", function()
    return vim.fn["codeium#Clear"]()
  end, { expr = true, silent = true, desc = "Clear Completions" })
end

-- Fzf and Floaterm
local keybind_opts = { silent = true, noremap = true }

map("n", "<leader>s", ":FloatermNew rg<CR>", keybind_opts)
map("n", "<leader>f", ":FloatermNew fzf<CR>", keybind_opts)
map("n", "<leader>;", ":FloatermNew lf<CR>", keybind_opts)
map("n", "<leader>l", ":FloatermNew lazygit<CR>", keybind_opts)
-- map("n", "<leader>'", ":FloatermNew broot<CR>", keybind_opts)
-- map("n", "<C-n>", ":FloatermNew<CR>", keybind_opts)

map("n", "<leader>e", ":MurenToggle<cr>", keybind_opts)
map("v", "<leader>e", ":MurenToggle<cr>", keybind_opts)
-- map("n", "<leader>n", ":lua require('notify')._print_history()<cr>", keybind_opts)
