vim.g.mapleader = " "
local map = vim.api.nvim_set_keymap

-- Saving and  ESC on insert Mode
map("i", "jj", "<esc>", { noremap = true, silent = true })
map("n", ",,", "<esc>:lua vim.lsp.buf.format()<cr><esc>:w! | noh<cr>", { noremap = true, silent = true })

-- Windows
map("n", "Wj", ":vsplit<cr>", { noremap = true, silent = true })
map("n", "Wk", ":split<cr>", { noremap = true, silent = true })
map("n", "Wh", "<C-w>t<C-w>K", { noremap = true, silent = true })
map("n", "Wl", "<C-w>t<C-w>H", { noremap = true, silent = true })

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

-- Move to Start/End of Line
map("n", "H", "^", { noremap = true, silent = true })
map("n", "L", "$", { noremap = true, silent = true })
-- map("n", "+", "<C-a>", { noremap = true, silent = true })
-- map("n", "_", "<C-x>", { noremap = true, silent = true })

-- Tabs
map("n", "tt", ":tabnew<cr>", { noremap = true, silent = true })
map("n", "tn", ":tabNext<cr>", { noremap = true, silent = true })
map("n", "tp", ":tabprevious<cr>", { noremap = true, silent = true })
map("n", "tl", ":tablast<cr>", { noremap = true, silent = true })

map("n", "zl", "za", { noremap = true, silent = true })

map("n", "cc", "0D", { noremap = true, silent = true })
map("n", "gi", "<C-i>", { noremap = true, silent = true })
map("n", "go", "<C-o>", { noremap = true, silent = true })

map("i", "<A-o>", "<C-o>", { noremap = true, silent = true })
map("i", "<C-k>", "<C-o>O", { noremap = true, silent = true })
map("i", "<C-j>", "<C-o>o", { noremap = true, silent = true })

-- quote text objects
map("n", "cq", 'f"ci"', { noremap = true, silent = true })
map("n", "cQ", 'f"ca"', { noremap = true, silent = true })
map("n", "dq", 'f"di"', { noremap = true, silent = true })
map("n", "dQ", 'f"da"', { noremap = true, silent = true })
map("n", "vq", 'f"vi"', { noremap = true, silent = true })
map("n", "vQ", 'f"va"', { noremap = true, silent = true })
map("n", "yq", 'f"yi"', { noremap = true, silent = true })
map("n", "yQ", 'f"ya"', { noremap = true, silent = true })

map("n", "c'", "f'ci'", { noremap = true, silent = true })
map("n", "c@", "f'ca'", { noremap = true, silent = true })
map("n", "d'", "f'di'", { noremap = true, silent = true })
map("n", "d@", "f'da'", { noremap = true, silent = true })
map("n", "v'", "f'vi'", { noremap = true, silent = true })
map("n", "v@", "f'va'", { noremap = true, silent = true })
map("n", "y'", "f'yi'", { noremap = true, silent = true })
map("n", "y@", "f'ya'", { noremap = true, silent = true })

map("n", "c`", "f`ci`", { noremap = true, silent = true })
map("n", "c¬", "f`ca`", { noremap = true, silent = true })
map("n", "d`", "f`di`", { noremap = true, silent = true })
map("n", "d¬", "f`da`", { noremap = true, silent = true })
map("n", "v`", "f`vi`", { noremap = true, silent = true })
map("n", "v¬", "f`va`", { noremap = true, silent = true })
map("n", "y`", "f`yi`", { noremap = true, silent = true })
map("n", "y¬", "f`ya`", { noremap = true, silent = true })

map("n", "dp", "dap", { noremap = true, silent = true })

-- map("o", "q", ':normal vi"<cr>', {noremap = true, silent = true})
-- map("o", "nq", ':normal t"llvi"<cr>', {noremap = true, silent = true})
-- map("o", "Q", ':normal va"<cr>', {noremap = true, silent = true})
-- map("o", "nQ", ':normal t"llva"<cr>', {noremap = true, silent = true})
-- map("o", "'", ":normal vi'<cr>", {noremap = true, silent = true})
-- map("o", "n'", ":normal t'llvi'<cr>", {noremap = true, silent = true})
-- map("o", "@", ":normal va'<cr>", {noremap = true, silent = true})
-- map("o", "n@", ":normal t'llva'<cr>", {noremap = true, silent = true})
-- map("o", "`", ":normal vi`<cr>", {noremap = true, silent = true})
-- map("o", "n`", ":normal t`llvi`<cr>", {noremap = true, silent = true})
-- map("o", "¬", ":normal va`<cr>", {noremap = true, silent = true})
-- map("o", "n¬", ":normal t`llva`<cr>", {noremap = true, silent = true})

local keymap = vim.keymap.set

-- keymap("v", "q", 'i"', {noremap = true, silent = true})

-- keymap({ "o", "x" }, "q", ':normal vi"<cr>', {noremap = true, silent = true})

keymap({ "o", "x" }, "c", ":normal vac<cr>", {noremap = true, silent = true})
keymap({ "o", "x" }, "f", ":normal vafo0<cr>", {noremap = true, silent = true})
keymap({ "o", "x" }, "B", ":normal vaBo0<cr>", {noremap = true, silent = true})
-- keymap({ "o", "x" }, "2q", ':normal f"dlvi"<cr>', {noremap = true, silent = true})

-- TEXT OBJECTS
--indentation
keymap({ "o", "x" }, "ii", "<cmd>lua require('various-textobjs').indentation(true, true)<CR>")
keymap({ "o", "x" }, "ai", "<cmd>lua require('various-textobjs').indentation(false, true)<CR>")
keymap({ "o", "x" }, "iI", "<cmd>lua require('various-textobjs').indentation(true, true)<CR>")
keymap({ "o", "x" }, "aI", "<cmd>lua require('various-textobjs').indentation(false, false)<CR>")
keymap({ "o", "x" }, "r", "<cmd>lua require('various-textobjs').restOfIndentation()<CR>")
-- subwords
keymap({ "o", "x" }, "iS", "<cmd>lua require('various-textobjs').subword(true)<CR>")
keymap({ "o", "x" }, "aS", "<cmd>lua require('various-textobjs').subword(false)<CR>")
-- near closing brackets
keymap({ "o", "x" }, "%", "<cmd>lua require('various-textobjs').toNextClosingBracket()<CR>")
-- paragraphs
keymap({ "o", "x" }, "R", "<cmd>lua require('various-textobjs').restOfParagraph()<CR>")
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
keymap({ "o", "x" }, "vu", "<cmd>lua require('various-textobjs').url()<CR>")
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

-- fold
keymap("n", "zj", require("ufo").openAllFolds, { desc = "Open all folds" })
keymap("n", "zk", require("ufo").closeAllFolds, { desc = "Close all folds" })
keymap("n", "zh", require("ufo").openFoldsExceptKinds, { desc = "Open folds except kinds" })
keymap("n", "zg", require("ufo").closeFoldsWith, { desc = "Close folds with" }) -- closeAllFolds == closeFoldsWith(0)
keymap("n", "zi", function()
  local winid = require("ufo").peekFoldedLinesUnderCursor()
  if not winid then
    vim.lsp.buf.hover()
  end
end, { desc = "Hover" })

-- Motion
require("hop")
map("n", "f", ":HopChar1CurrentLineAC<cr>", { noremap = true, silent = true })
map("n", "F", ":HopChar1CurrentLineBC<cr>", { noremap = true, silent = true })
map("n", "s", ":HopChar1<cr>", { noremap = true, silent = true })
map("n", "S", ":HopChar2<cr>", { noremap = true, silent = true })
-- map("n", "sw", ":HopWord<cr>", { noremap = true, silent = true })
-- map("n", "sj", ":HopVertical<cr>", { noremap = true, silent = true })
-- map("n", "sp", ":HopPattern<cr>", { noremap = true, silent = true })

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
vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)

local gs = require("gitsigns")

-- make sure forward function comes first
local next_hunk_repeat, prev_hunk_repeat = ts_repeat_move.make_repeatable_move_pair(gs.next_hunk, gs.prev_hunk)
-- Or, use `make_repeatable_move` or `set_last_move` functions for more control. See the code for instructions.

vim.keymap.set({ "n", "x", "o" }, "]h", next_hunk_repeat)
vim.keymap.set({ "n", "x", "o" }, "[h", prev_hunk_repeat)

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

-- hlslens
local kopts = { noremap = true, silent = true }
map("n", "n", [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]], kopts)
map("n", "N", [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]], kopts)
map("n", "*", [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
map("n", "#", [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
map("n", "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
map("n", "g#", [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)

-- Move
-- map("n", "<C-x>", "<Plug>GoNSMLeft", {})
-- map("n", "<S-x>", "<Plug>GoNSMRight", {})
map("n", "-", "<Plug>GoNSMDown", {})
map("n", "=", "<Plug>GoNSMUp", {})
map("x", "H", "<Plug>GoVSMLeft", {})
map("x", "J", "<Plug>GoVSMDown", {})
map("x", "K", "<Plug>GoVSMUp", {})
map("x", "L", "<Plug>GoVSMRight", {})

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

-- Split Join
vim.keymap.set("n", "gs", ":TSJToggle<cr>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>rn", function()
  return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true })
