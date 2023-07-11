vim.g.mapleader = " "
local map = vim.api.nvim_set_keymap

-- Saving and  ESC on insert Mode
map("i", "jj", "<esc>", { noremap = true, silent = true })
map("n", ",", "<esc>:lua vim.lsp.buf.format()<cr><esc>:w! | noh<cr>", { noremap = true, silent = true })

-- Windows
map("n", "wv", ":vsplit<cr>", { noremap = true, silent = true })
map("n", "wb", ":split<cr>", { noremap = true, silent = true })
map("n", "Wv", "<C-w>t<C-w>K", { noremap = true, silent = true })
map("n", "Wb", "<C-w>t<C-w>H", { noremap = true, silent = true })

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

-- remap
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
-- vim.api.nvim_set_keymap('n', 'vq', 'vim.v.count1f"vi"',  { noremap = true, silent = true })

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

-- keymap({ "o", "x" }, "c", ":normal vac<cr>", { noremap = true, silent = true })
keymap({ "o", "x" }, "f", ":normal vafo0<cr>", { noremap = true, silent = true })
keymap({ "o", "x" }, "B", ":normal vaBo0<cr>", { noremap = true, silent = true })
-- keymap({ "o", "x" }, "2q", ':normal f"dlvi"<cr>', {noremap = true, silent = true})

-- TEXT OBJECTS
--indentation
keymap({ "o", "x" }, "ii", "<cmd>lua require('various-textobjs').indentation(true, true)<CR>")
keymap({ "o", "x" }, "ai", "<cmd>lua require('various-textobjs').indentation(false, true)<CR>")
keymap({ "o", "x" }, "iI", "<cmd>lua require('various-textobjs').indentation(true, true)<CR>")
keymap({ "o", "x" }, "aI", "<cmd>lua require('various-textobjs').indentation(false, false)<CR>")
keymap({ "o", "x" }, "ri", "<cmd>lua require('various-textobjs').restOfIndentation()<CR>")
-- paragraphs
keymap({ "o", "x" }, "rp", "<cmd>lua require('various-textobjs').restOfParagraph()<CR>")
-- subwords
keymap({ "o", "x" }, "iS", "<cmd>lua require('various-textobjs').subword(true)<CR>")
keymap({ "o", "x" }, "aS", "<cmd>lua require('various-textobjs').subword(false)<CR>")
-- near closing brackets
keymap({ "o", "x" }, "%", "<cmd>lua require('various-textobjs').toNextClosingBracket()<CR>")
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

-- Gitsigns
map("v", "<leader>hs", ":Gitsigns stage_hunk<cr>", { noremap = true, silent = true })
map("v", "<leader>hr", ":Gitsigns reset_hunk<cr>", { noremap = true, silent = true })
map("o", "ih", "<C-U>Gitsigns select_hunk<CR>", { noremap = true, silent = true })
map("x", "ih", "<C-U>Gitsigns select_hunk<CR>", { noremap = true, silent = true })
map("n", "[c", "&diff ? '[c' : ':Gitsigns prev_hunk<cr>'", { expr = true, noremap = true, silent = true })
map("n", "]c", "&diff ? ']c' : ':Gitsigns next_hunk<cr>'", { expr = true, noremap = true, silent = true })

-- Indenting on Visual Mode
map("v", "H", "<gv", { noremap = true, silent = true })
map("v", "L", ">gv", { noremap = true, silent = true })
map("x", "J", ":move '>+1<cr>gv-gv", { noremap = true, silent = true })
map("x", "K", ":move '<-2<cr>gv-gv", { noremap = true, silent = true })

-- Split Join
vim.keymap.set("n", "gs", ":TSJToggle<cr>", { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader><leader>', '<cmd>lua require("harpoon.ui").nav_file(vim.v.count1)<cr>',
  { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gm', '<cmd>lua require("harpoon.ui").nav_next()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gn', '<cmd>lua require("harpoon.ui").nav_prev()<cr>', { noremap = true, silent = true })

vim.keymap.set("i", "<C-l>",
  function()
    return vim.fn["codeium#Accept"]()
  end
  , { expr = true, silent = true, desc = "Accept Suggestion" })
vim.keymap.set("i", "<C-n>",
  function()
    return vim.fn["codeium#CycleCompletions"](1)
  end,
  { expr = true, silent = true, desc = "Cycle Completions Forward" })
vim.keymap.set("i", "<C-p>",
  function()
    return vim.fn["codeium#CycleCompletions"](-1)
  end,
  { expr = true, silent = true, desc = "Cycle Completions Backward" })
vim.keymap.set("i", "<C-u>",
  function()
    return vim.fn["codeium#Clear"]()
  end,
  { expr = true, silent = true, desc = "Clear Completions" })

-- Floaterm
vim.cmd([[
  nnoremap   <silent>   <leader>j    :FloatermNew lf<CR>
  nnoremap   <silent>   <leader>f    :FloatermNew fzf<CR>
  nnoremap   <silent>   <leader>s    :FloatermNew rg<CR>
  nnoremap   <silent>   <leader>l    :FloatermNew lazygit<CR>
  nnoremap   <silent>   <leader>;    :FloatermNew broot<CR>
  " tnoremap   <silent>   <leader>j    <C-\><C-n>:FloatermNew! lf<CR>
  " tnoremap   <silent>   <leader>f    <C-\><C-n>:FloatermNew! fzf<CR>
  " tnoremap   <silent>   <leader>s    <C-\><C-n>:FloatermNew! rg<CR>
  " tnoremap   <silent>   <leader>l    <C-\><C-n>:FloatermNew lazygit<CR>
]])
