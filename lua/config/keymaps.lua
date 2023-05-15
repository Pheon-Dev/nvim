vim.g.mapleader = " "
local map = vim.api.nvim_set_keymap

-- Saving and  ESC on insert Mode
map("i", "jj", "<esc>", { noremap = true, silent = true })
map("n", ",", "<esc>:lua vim.lsp.buf.format()<cr><esc>:w! | noh<cr>", { noremap = true, silent = true })

-- Saving and Quitting
map("n", "<C-s>", ":lua vim.lsp.buf.formatting()<cr>", { noremap = true, silent = true })
map("n", "<C-p>", ":Prettier<cr><esc>:w! | noh<cr>", { noremap = true, silent = true })
map("n", "<C-q>", ":w! | bp | sp | bn | bd!<cr>", { noremap = true, silent = true })

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

map("n", "<C-Left>", ":vertical resize +3<cr>", { noremap = true, silent = true })
map("n", "<C-Right>", ":vertical resize -3<cr>", { noremap = true, silent = true })
map("n", "<C-Up>", ":resize +3<cr>", { noremap = true, silent = true })
map("n", "<C-Down>", ":resize -3<cr>", { noremap = true, silent = true })

map("n", ">", ":vertical resize +3<cr>", { noremap = true, silent = true })
map("n", "<", ":vertical resize -3<cr>", { noremap = true, silent = true })
map("n", "(", ":resize +3<cr>", { noremap = true, silent = true })
map("n", ")", ":resize -3<cr>", { noremap = true, silent = true })

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

-- Move to Start/End of Line
map("n", "H", "^", { noremap = true, silent = true })
map("n", "L", "$", { noremap = true, silent = true })
map("n", "e", "w", { noremap = true, silent = true })
map("n", "vv", "v", { noremap = true, silent = true })

-- Tabs
map("n", "tt", ":tabnew<cr>", { noremap = true, silent = true })
map("n", "tn", ":tabNext<cr>", { noremap = true, silent = true })
map("n", "tp", ":tabprevious<cr>", { noremap = true, silent = true })
map("n", "tl", ":tablast<cr>", { noremap = true, silent = true })

-- Motion
local hop = require("hop")
local directions = require("hop.hint").HintDirection
vim.keymap.set("", "f", function()
	hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
end, { remap = true })
vim.keymap.set("", "F", function()
	hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
end, { remap = true })

-- hlslens
local kopts = { noremap = true, silent = true }
map("n", "n", [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]], kopts)
map("n", "N", [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]], kopts)
map("n", "*", [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
map("n", "#", [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
map("n", "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
map("n", "g#", [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)

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

map("n", "zl", "za", { noremap = true, silent = true })

map("n", "cc", "0D", { noremap = true, silent = true })

map("n", "gcb", "gcip", { noremap = true, silent = true })

map("n", "<A-i>", "<C-i>", { noremap = true, silent = true })
map("n", "<A-o>", "<C-o>", { noremap = true, silent = true })

-- Gitsigns
map("v", "<leader>hs", ":Gitsigns stage_hunk<CR>", { noremap = true, silent = true })
map("v", "<leader>hr", ":Gitsigns reset_hunk<CR>", { noremap = true, silent = true })
map("o", "ih", ":<C-U>Gitsigns select_hunk<CR>", { noremap = true, silent = true })
map("x", "ih", ":<C-U>Gitsigns select_hunk<CR>", { noremap = true, silent = true })

map("n", "<C-x>", "<Plug>GoNSMLeft", {})
map("n", "-", "<Plug>GoNSMDown", {})
map("n", "=", "<Plug>GoNSMUp", {})
map("n", "<S-x>", "<Plug>GoNSMRight", {})

map("x", "<S-h>", "<Plug>GoVSMLeft", {})
map("x", "<S-j>", "<Plug>GoVSMDown", {})
map("x", "<S-k>", "<Plug>GoVSMUp", {})
map("x", "<S-l>", "<Plug>GoVSMRight", {})

-- Codeium
vim.keymap.set("i", "<C-l>", function()
	return vim.fn["codeium#Accept"]()
end, { expr = true })
vim.keymap.set("i", "<c-j>", function()
	return vim.fn["codeium#CycleCompletions"](1)
end, { expr = true })
vim.keymap.set("i", "<c-k>", function()
	return vim.fn["codeium#CycleCompletions"](-1)
end, { expr = true })
vim.keymap.set("i", "<c-x>", function()
	return vim.fn["codeium#Clear"]()
end, { expr = true })

local crates = require("crates")
local opts = { noremap = true, silent = true }

vim.keymap.set("v", "<leader>cU", crates.upgrade_crates, opts)
vim.keymap.set("v", "<leader>cu", crates.update_crates, opts)

-- todo-comments
vim.keymap.set("n", "]t", function()
	require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
	require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })
