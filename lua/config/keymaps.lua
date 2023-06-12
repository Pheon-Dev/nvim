vim.g.mapleader = " "
local map = vim.api.nvim_set_keymap

-- Saving and  ESC on insert Mode
map("i", "jj", "<esc>", { noremap = true, silent = true })
map("n", ",", "<esc>:lua vim.lsp.buf.format()<cr><esc>:w! | noh<cr>", { noremap = true, silent = true })

-- Windows
map("n", "vj", ":vsplit<cr>", { noremap = true, silent = true })
map("n", "vk", ":split<cr>", { noremap = true, silent = true })
map("n", "vh", "<C-w>t<C-w>K", { noremap = true, silent = true })
map("n", "vl", "<C-w>t<C-w>H", { noremap = true, silent = true })

map("n", "<C-h>", "<C-w>h", { noremap = true, silent = false })
map("n", "<C-j>", "<C-w>j", { noremap = true, silent = false })
map("n", "<C-k>", "<C-w>k", { noremap = true, silent = false })
map("n", "<C-l>", "<C-w>l", { noremap = true, silent = false })

map("n", "<C-Left>", ":vertical resize +3<cr>", { noremap = true, silent = true })
map("n", "<C-Right>", ":vertical resize -3<cr>", { noremap = true, silent = true })
map("n", "<C-Up>", ":resize +3<cr>", { noremap = true, silent = true })
map("n", "<C-Down>", ":resize -3<cr>", { noremap = true, silent = true })

map("n", ">", ":vertical resize +3<cr>", { noremap = true, silent = true })
map("n", "<", ":vertical resize -3<cr>", { noremap = true, silent = true })
map("n", "(", ":resize +3<cr>", { noremap = true, silent = true })
map("n", ")", ":resize -3<cr>", { noremap = true, silent = true })

-- Editing Keybindings
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
map("n", "+", "<C-a>", { noremap = true, silent = true })
map("n", "_", "<C-x>", { noremap = true, silent = true })

-- Tabs
map("n", "tt", ":tabnew<cr>", { noremap = true, silent = true })
map("n", "tn", ":tabNext<cr>", { noremap = true, silent = true })
map("n", "tp", ":tabprevious<cr>", { noremap = true, silent = true })
map("n", "tl", ":tablast<cr>", { noremap = true, silent = true })

-- hlslens
local kopts = { noremap = true, silent = true }
map("n", "n", [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]], kopts)
map("n", "N", [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]], kopts)
map("n", "*", [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
map("n", "#", [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
map("n", "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
map("n", "g#", [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)

-- vim.keymap.set("n", "<c-f>", function()
--   if not require("noice.lsp").scroll(4) then
--     return "<c-f>"
--   end
-- end, { silent = true, expr = true })
--
-- vim.keymap.set("n", "<c-b>", function()
--   if not require("noice.lsp").scroll(-4) then
--     return "<c-b>"
--   end
-- end, { silent = true, expr = true })

map("n", "zl", "za", { noremap = true, silent = true })

map("n", "cc", "0D", { noremap = true, silent = true })
map("n", "gi", "<C-i>", { noremap = true, silent = true })
map("n", "go", "<C-o>", { noremap = true, silent = true })

-- map("n", "<A-i>", "<C-i>", { noremap = true, silent = true })
map("i", "<A-o>", "<C-o>", { noremap = true, silent = true })
map("i", "<C-k>", "<C-o>O", { noremap = true, silent = true })
map("i", "<C-j>", "<C-o>o", { noremap = true, silent = true })
-- map("i", "<C-K>", "<C-o>A", { noremap = true, silent = true })
-- map("i", "<C-J>", "<C-o>I", { noremap = true, silent = true })

-- Gitsigns
map("v", "<leader>hs", ":Gitsigns stage_hunk<CR>", { noremap = true, silent = true })
map("v", "<leader>hr", ":Gitsigns reset_hunk<CR>", { noremap = true, silent = true })
map("o", "ih", ":<C-U>Gitsigns select_hunk<CR>", { noremap = true, silent = true })
map("x", "ih", ":<C-U>Gitsigns select_hunk<CR>", { noremap = true, silent = true })

-- map("n", "<C-x>", "<Plug>GoNSMLeft", {})
-- map("n", "<S-x>", "<Plug>GoNSMRight", {})
map("n", "-", "<Plug>GoNSMDown", {})
map("n", "=", "<Plug>GoNSMUp", {})

map("x", "<S-h>", "<Plug>GoVSMLeft", {})
map("x", "<S-j>", "<Plug>GoVSMDown", {})
map("x", "<S-k>", "<Plug>GoVSMUp", {})
map("x", "<S-l>", "<Plug>GoVSMRight", {})

-- Codeium
vim.keymap.set("i", "<C-l>", function()
  return vim.fn["codeium#Accept"]()
end, { expr = true, silent = true })
vim.keymap.set("i", "<c-n>", function()
  return vim.fn["codeium#CycleCompletions"](1)
end, { expr = true, silent = true })
vim.keymap.set("i", "<c-p>", function()
  return vim.fn["codeium#CycleCompletions"](-1)
end, { expr = true, silent = true })
vim.keymap.set("i", "<c-u>", function()
  return vim.fn["codeium#Clear"]()
end, { expr = true, silent = true })

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

local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")

-- Repeat movement with ; and ,
-- ensure ; goes forward and , goes backward, regardless of the last direction
vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
vim.keymap.set({ "n", "x", "o" }, "'", ts_repeat_move.repeat_last_move_previous)

-- vim way: ; goes to the direction you were moving.
-- vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
-- vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

-- Make builtin f, F, t, T also repeatable with ; and ,
-- Disabled in favour of ggandor/flit.nvim
-- vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f)
-- vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F)
-- vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t)
-- vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T)

-- This repeats the last query with always previous direction and to the start of the range.
vim.keymap.set({ "n", "x", "o" }, "<home>", function()
  ts_repeat_move.repeat_last_move({ forward = false, start = true })
end)

-- This repeats the last query with always next direction and to the end of the range.
vim.keymap.set({ "n", "x", "o" }, "<end>", function()
  ts_repeat_move.repeat_last_move({ forward = true, start = false })
end)

-- Motion
require("hop")
map("n", "f", ":HopChar1CurrentLineAC<cr>", { noremap = true, silent = true })
map("n", "F", ":HopChar1CurrentLineBC<cr>", { noremap = true, silent = true })
map("n", "s", ":HopChar1<cr>", { noremap = true, silent = true })
map("n", "S", ":HopChar2<cr>", { noremap = true, silent = true })
-- map("n", "sw", ":HopWord<cr>", { noremap = true, silent = true })
-- map("n", "sj", ":HopVertical<cr>", { noremap = true, silent = true })
-- map("n", "sp", ":HopPattern<cr>", { noremap = true, silent = true })

-- fold
vim.keymap.set("n", "zj", require("ufo").openAllFolds, { desc = "Open all folds" })
vim.keymap.set("n", "zk", require("ufo").closeAllFolds, { desc = "Close all folds" })
vim.keymap.set("n", "zh", require("ufo").openFoldsExceptKinds, { desc = "Open folds except kinds" })
vim.keymap.set("n", "zg", require("ufo").closeFoldsWith, { desc = "Close folds with" }) -- closeAllFolds == closeFoldsWith(0)
vim.keymap.set("n", "zz", function()
  local winid = require("ufo").peekFoldedLinesUnderCursor()
  if not winid then
    vim.lsp.buf.hover()
  end
end, { desc = "Hover" })

-- TEXT OBJECTS
local keymap = vim.keymap.set
--indentation
keymap({ "o", "x" }, "ii", "<cmd>lua require('various-textobjs').indentation(true, true)<CR>")
keymap({ "o", "x" }, "ai", "<cmd>lua require('various-textobjs').indentation(false, true)<CR>")
keymap({ "o", "x" }, "iI", "<cmd>lua require('various-textobjs').indentation(true, true)<CR>")
keymap({ "o", "x" }, "aI", "<cmd>lua require('various-textobjs').indentation(false, false)<CR>")

keymap({ "o", "x" }, "R", "<cmd>lua require('various-textobjs').restOfIndentation()<CR>")
-- subwords
keymap({ "o", "x" }, "iS", "<cmd>lua require('various-textobjs').subword(true)<CR>")
keymap({ "o", "x" }, "aS", "<cmd>lua require('various-textobjs').subword(false)<CR>")
-- near closing brackets
keymap({ "o", "x" }, "%", "<cmd>lua require('various-textobjs').toNextClosingBracket()<CR>")
-- paragraphs
keymap({ "o", "x" }, "r", "<cmd>lua require('various-textobjs').restOfParagraph()<CR>")
-- entire buffer
keymap({ "o", "x" }, "gG", "<cmd>lua require('various-textobjs').entireBuffer()<CR>")
-- near end of line
keymap({ "o", "x" }, "n", "<cmd>lua require('various-textobjs').nearEoL()<CR>")
-- line characterwise
keymap({ "o", "x" }, "il", "<cmd>lua require('various-textobjs').lineCharacterwise(true)<CR>")
keymap({ "o", "x" }, "al", "<cmd>lua require('various-textobjs').lineCharacterwise(false)<CR>")
-- column
keymap({ "o", "x" }, "|", "<cmd>lua require('various-textobjs').column()<CR>")
-- value
keymap({ "o", "x" }, "iv", "<cmd>lua require('various-textobjs').value(true)<CR>")
keymap({ "o", "x" }, "av", "<cmd>lua require('various-textobjs').value(false)<CR>")
-- key
keymap({ "o", "x" }, "ik", "<cmd>lua require('various-textobjs').key(true)<CR>")
keymap({ "o", "x" }, "ak", "<cmd>lua require('various-textobjs').key(false)<CR>")
-- url
keymap({ "o", "x" }, "L", "<cmd>lua require('various-textobjs').url()<CR>")
-- diagnostic
keymap({ "o", "x" }, "!", "<cmd>lua require('various-textobjs').diagnostic()<CR>")
-- fold
keymap({ "o", "x" }, "iz", "<cmd>lua require('various-textobjs').closedFold(true)<CR>")
keymap({ "o", "x" }, "az", "<cmd>lua require('various-textobjs').closedFold(false)<CR>")
-- chain member
keymap({ "o", "x" }, "im", "<cmd>lua require('various-textobjs').chainMember(true)<CR>")
keymap({ "o", "x" }, "am", "<cmd>lua require('various-textobjs').chainMember(false)<CR>")
-- window
keymap({ "o", "x" }, "gw", "<cmd>lua require('various-textobjs').visibleInWindow()<CR>")
keymap({ "o", "x" }, "gW", "<cmd>lua require('various-textobjs').restOfWindow()<CR>")

-- QUOTES
-- visual
keymap({ "n", "x", "o" }, "v'", "^vi'")
keymap({ "n", "x", "o" }, "va'", "^va'")
keymap({ "n", "x", "o" }, "vq", '^vi"')
keymap({ "n", "x", "o" }, "2vq", '^f"f"f"lvi"')
keymap({ "n", "x", "o" }, "3vq", '^f"f"f"f"f"lvi"')
keymap({ "n", "x", "o" }, "4vq", '^f"f"f"f"f"f"f"lvi"')
keymap({ "n", "x", "o" }, "5vq", '^f"f"f"f"f"f"f"f"f"lvi"')
keymap({ "n", "x", "o" }, "6vq", '^f"f"f"f"f"f"f"f"f"f"f"lvi"')
keymap({ "n", "x", "o" }, "7vq", '^f"f"f"f"f"f"f"f"f"f"f"f"f"lvi"')
keymap({ "n", "x", "o" }, "8vq", '^f"f"f"f"f"f"f"f"f"f"f"f"f"f"f"lvi"')
keymap({ "n", "x", "o" }, "vaq", '^va"')
keymap({ "n", "x", "o" }, "v`", '^vi`')
keymap({ "n", "x", "o" }, "va`", '^va`')
-- yank
keymap({ "n", "x", "o" }, "y'", "yi'")
keymap({ "n", "x", "o" }, "ya'", "ya'")
keymap({ "n", "x", "o" }, "yq", 'yi"')
keymap({ "n", "x", "o" }, "2yq", '^f"f"f"lyi"')
keymap({ "n", "x", "o" }, "3yq", '^f"f"f"f"f"lyi"')
keymap({ "n", "x", "o" }, "4yq", '^f"f"f"f"f"f"f"lyi"')
keymap({ "n", "x", "o" }, "5yq", '^f"f"f"f"f"f"f"f"f"lyi"')
keymap({ "n", "x", "o" }, "6yq", '^f"f"f"f"f"f"f"f"f"f"f"lyi"')
keymap({ "n", "x", "o" }, "7yq", '^f"f"f"f"f"f"f"f"f"f"f"f"f"lyi"')
keymap({ "n", "x", "o" }, "8yq", '^f"f"f"f"f"f"f"f"f"f"f"f"f"f"f"lyi"')
keymap({ "n", "x", "o" }, "yaq", 'ya"')
keymap({ "n", "x", "o" }, "y`", 'yi`')
keymap({ "n", "x", "o" }, "ya`", 'ya`')
-- change
keymap({ "n", "x", "o" }, "c'", "ci'")
keymap({ "n", "x", "o" }, "ca'", "ca'")
keymap({ "n", "x", "o" }, "cq", 'ci"')
keymap({ "n", "x", "o" }, "2cq", '^f"f"f"lci"')
keymap({ "n", "x", "o" }, "3cq", '^f"f"f"f"f"lci"')
keymap({ "n", "x", "o" }, "4cq", '^f"f"f"f"f"f"f"lci"')
keymap({ "n", "x", "o" }, "5cq", '^f"f"f"f"f"f"f"f"f"lci"')
keymap({ "n", "x", "o" }, "6cq", '^f"f"f"f"f"f"f"f"f"f"f"lci"')
keymap({ "n", "x", "o" }, "7cq", '^f"f"f"f"f"f"f"f"f"f"f"f"f"lci"')
keymap({ "n", "x", "o" }, "8cq", '^f"f"f"f"f"f"f"f"f"f"f"f"f"f"f"lci"')
keymap({ "n", "x", "o" }, "caq", 'ca"')
keymap({ "n", "x", "o" }, "c`", 'ci`')
keymap({ "n", "x", "o" }, "ca`", 'ca`')
-- delete
keymap({ "n", "x", "o" }, "d'", "di'")
keymap({ "n", "x", "o" }, "da'", "da'")
keymap({ "n", "x", "o" }, "dq", 'di"')
keymap({ "n", "x", "o" }, "2dq", '^f"f"f"ldi"')
keymap({ "n", "x", "o" }, "3dq", '^f"f"f"f"f"ldi"')
keymap({ "n", "x", "o" }, "4dq", '^f"f"f"f"f"f"f"ldi"')
keymap({ "n", "x", "o" }, "5dq", '^f"f"f"f"f"f"f"f"f"ldi"')
keymap({ "n", "x", "o" }, "6dq", '^f"f"f"f"f"f"f"f"f"f"f"ldi"')
keymap({ "n", "x", "o" }, "7dq", '^f"f"f"f"f"f"f"f"f"f"f"f"f"ldi"')
keymap({ "n", "x", "o" }, "8dq", '^f"f"f"f"f"f"f"f"f"f"f"f"f"f"f"ldi"')
keymap({ "n", "x", "o" }, "daq", 'da"')
keymap({ "n", "x", "o" }, "d`", 'di`')
keymap({ "n", "x", "o" }, "da`", 'da`')
---- example: make gitsigns.nvim movement repeatable with ; and , keys.
local gs = require("gitsigns")

-- make sure forward function comes first
local next_hunk_repeat, prev_hunk_repeat = ts_repeat_move.make_repeatable_move_pair(gs.next_hunk, gs.prev_hunk)
-- Or, use `make_repeatable_move` or `set_last_move` functions for more control. See the code for instructions.

vim.keymap.set({ "n", "x", "o" }, "]h", next_hunk_repeat)
vim.keymap.set({ "n", "x", "o" }, "[h", prev_hunk_repeat)
