vim.g.mapleader = " "
local map = vim.api.nvim_set_keymap

-- Saving and  ESC on insert Mode
map("i", "jj", "<esc>", { noremap = true, silent = true })
map("i", "kk", "<esc>:lua vim.lsp.buf.format()<cr><esc>:w! | noh<cr>", { noremap = true, silent = true })
map("n", ",", "<esc>:lua vim.lsp.buf.format()<cr><esc>:w! | noh<cr>", { noremap = true, silent = true })

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

map("n", "<C-Left>", ":vertical resize +3<cr>", { noremap = true, silent = true })
map("n", "<C-Right>", ":vertical resize -3<cr>", { noremap = true, silent = true })
map("n", "<C-Up>", ":resize +3<cr>", { noremap = true, silent = true })
map("n", "<C-Down>", ":resize -3<cr>", { noremap = true, silent = true })

map("n", ">", ":vertical resize +3<cr>", { noremap = true, silent = true })
map("n", "<", ":vertical resize -3<cr>", { noremap = true, silent = true })
map("n", "(", ":resize +3<cr>", { noremap = true, silent = true })
map("n", ")", ":resize -3<cr>", { noremap = true, silent = true })

-- -- Split Navigation
-- map("n", "<A-h>", "<C-w>h", { noremap = true, silent = false })
-- map("n", "<A-j>", "<C-w>j", { noremap = true, silent = false })
-- map("n", "<A-k>", "<C-w>k", { noremap = true, silent = false })
-- map("n", "<A-l>", "<C-w>l", { noremap = true, silent = false })

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
map("n", "<C-c>", "d^", { noremap = true, silent = true })

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
map("n", "vu", "v{", { noremap = true, silent = true })
map("n", "vd", "v}", { noremap = true, silent = true })

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

-- map("n", "cd", "cc<esc>", { noremap = true, silent = true })
-- map("n", "co", "cc<esc>ddO<esc>", { noremap = true, silent = true })
-- map("n", "ci", "ddO", { noremap = true, silent = true })
-- map("n", "dh", "c^<esc>", { noremap = true, silent = true })
-- map("n", "ch", "c^", { noremap = true, silent = true })
-- map("n", "tl", ":ToggleTerm size=60 dir=. direction=vertical<cr>", { noremap = true, silent = true })
-- map("n", "tj", ":ToggleTerm size=20 dir=. direction=horizontal<cr>", { noremap = true, silent = true })

--[[ -- Motion ]]
local hop = require("hop")
local directions = require("hop.hint").HintDirection
vim.keymap.set("", "f", function()
	hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
end, { remap = true })
vim.keymap.set("", "F", function()
	hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
end, { remap = true })
vim.keymap.set("", "t", function()
	hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
end, { remap = true })
vim.keymap.set("", "T", function()
	hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
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

map("n", "<A-i>", "<C-i>", { noremap = true, silent = true })
map("n", "<A-o>", "<C-o>", { noremap = true, silent = true })

--[[ Gitsigns ]]
map("v", "<leader>hs", ":Gitsigns stage_hunk<CR>", { noremap = true, silent = true })
map("v", "<leader>hr", ":Gitsigns reset_hunk<CR>", { noremap = true, silent = true })
map("o", "ih", ":<C-U>Gitsigns select_hunk<CR>", { noremap = true, silent = true })
map("x", "ih", ":<C-U>Gitsigns select_hunk<CR>", { noremap = true, silent = true })

--[[ DAP ]]

--[[ map("n", "<leader>hs", ":Gitsigns stage_hunk<CR>", { noremap = true, silent = true }) ]]
--[[ map("n", "<F5>", ":lua require'dap'.continue()<CR>", { noremap = true, silent = true }) ]]
--[[ map("n", "<F10>", ":lua require'dap'.step_over()<CR>", { noremap = true, silent = true }) ]]
--[[ map("n", "<F11>", ":lua require'dap'.step_into()<CR>", { noremap = true, silent = true }) ]]
--[[ map("n", "<F12>", ":lua require'dap'.step_out()<CR>", { noremap = true, silent = true }) ]]
--[[ map("n", "<Leader>b", ":lua require'dap'.toggle_breakpoint()<CR>", { noremap = true, silent = true }) ]]
--[[ map( ]]
--[[   "n", ]]
--[[   "<Leader>B", ]]
--[[   ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", ]]
--[[   { noremap = true, silent = true } ]]
--[[ ) ]]
--[[ map( ]]
--[[   "n", ]]
--[[   "<Leader>lp", ]]
--[[   ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", ]]
--[[   { noremap = true, silent = true } ]]
--[[ ) ]]
--[[ map("n", "<Leader>dr", ":lua require'dap'.repl.open()<CR>", { noremap = true, silent = true }) ]]
--[[ map("n", "<Leader>dl", ":lua require'dap'.run_last()<CR>", { noremap = true, silent = true }) ]]

--[[ Move ]]
map("n", "_", "<Plug>GoNSMLeft", {})
map("n", "-", "<Plug>GoNSMDown", {})
map("n", "=", "<Plug>GoNSMUp", {})
map("n", "+", "<Plug>GoNSMRight", {})

map("x", "<S-h>", "<Plug>GoVSMLeft", {})
map("x", "<S-j>", "<Plug>GoVSMDown", {})
map("x", "<S-k>", "<Plug>GoVSMUp", {})
map("x", "<S-l>", "<Plug>GoVSMRight", {})

map("n", "<C-h>", "<Plug>GoNSDLeft", {})
map("n", "<C-j>", "<Plug>GoNSDDown", {})
map("n", "<C-k>", "<Plug>GoNSDUp", {})
map("n", "<C-l>", "<Plug>GoNSDRight", {})

map("x", "<C-h>", "<Plug>GoVSDLeft", {})
map("x", "<C-j>", "<Plug>GoVSDDown", {})
map("x", "<C-l>", "<Plug>GoVSDRight", {})
map("x", "<C-k>", "<Plug>GoVSDUp", {})
