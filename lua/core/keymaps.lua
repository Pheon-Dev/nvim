vim.g.mapleader = " "
local map = vim.api.nvim_set_keymap

-- unused C-n, C-j, C-k, C-l, C-h, C-a, C-x, C-z, C-c, C-v
-- Saving and  ESC on insert Mode
map("i", "jj", "<esc>", { noremap = true, silent = true })
map("n", ",", "<esc>:lua vim.lsp.buf.format()<cr><esc>:w! | noh<cr>", { noremap = true, silent = true })
-- map("n", ",", "<esc>:w! | noh<cr>", { noremap = true, silent = true })

-- Windows
-- map("n", "<C-l>", "<C-w>p", { noremap = true, silent = true })
-- map("n", "<A-n>", "<C-w>w", { noremap = true, silent = true })
map("n", "<A-x>", "<C-w>x", { noremap = true, silent = true })

map("n", "<A-H>", "<C-w>h", { noremap = true, silent = true })
map("n", "<A-J>", "<C-w>j", { noremap = true, silent = true })
map("n", "<A-K>", "<C-w>k", { noremap = true, silent = true })
map("n", "<A-L>", "<C-w>l", { noremap = true, silent = true })

map("n", "<A-V>", ":vsplit<cr>", { noremap = true, silent = true })
map("n", "<A-B>", ":split<cr>", { noremap = true, silent = true })

map("n", "<leader>wb", "<C-w>t<C-w>K", { noremap = true, silent = true })
map("n", "<leader>wv", "<C-w>t<C-w>H", { noremap = true, silent = true })

map("n", "<leader>wr", ":SudaRead<cr>", { noremap = true, silent = true })
map("n", "<leader>ww", ":SudaWrite<cr>", { noremap = true, silent = true })

-- map("n", ">", ":vertical resize +3<cr>", { noremap = true, silent = true })
-- map("n", "<", ":vertical resize -3<cr>", { noremap = true, silent = true })
-- map("n", "(", ":resize +3<cr>", { noremap = true, silent = true })
-- map("n", ")", ":resize -3<cr>", { noremap = true, silent = true })

-- Editing Keybindings
map("n", "U", ":redo<cr>", { noremap = true, silent = true })

-- Move to Start/End of Line
map("n", "<C-k>", "-", { noremap = true, silent = true })
map("n", "<C-j>", "+", { noremap = true, silent = true })
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
map("n", "gi", "<C-i>", { noremap = true, silent = true })
map("n", "go", "<C-o>", { noremap = true, silent = true })

-- Fold
map("n", "zl", "za", { noremap = true, silent = true })

-- map("i", "<A-o>", "<C-o>", { noremap = true, silent = true })
map("i", "<C-k>", "<C-o>O", { noremap = true, silent = true })
map("i", "<C-j>", "<C-o>o", { noremap = true, silent = true })
map("i", "<C-l>", "<C-o>A", { noremap = true, silent = true })
map("i", "<C-h>", "<C-o>I", { noremap = true, silent = true })

-- Dial
map("n", "+", "<Plug>(dial-increment)", { noremap = true, silent = true })
map("n", "_", "<Plug>(dial-decrement)", { noremap = true, silent = true })
-- map("n", "+", "<C-a>", { noremap = true, silent = true })
-- map("n", "_", "<C-x>", { noremap = true, silent = true })

-- TEXT OBJECTS
local keymap = vim.keymap.set

--indentation
-- keymap({ "o", "x" }, "ii", "<cmd>lua require('various-textobjs').indentation(true, true)<CR>")
-- keymap({ "o", "x" }, "ai", "<cmd>lua require('various-textobjs').indentation(false, true)<CR>")
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
keymap({ "o", "x" }, "ae", "<cmd>lua require('various-textobjs').entireBuffer()<CR>")
-- near end of line
keymap({ "o", "x" }, "n", "<cmd>lua require('various-textobjs').nearEoL()<CR>")
-- line characterwise
keymap({ "o", "x" }, "ih", "<cmd>lua require('various-textobjs').lineCharacterwise(true)<CR>")
keymap({ "o", "x" }, "ah", "<cmd>lua require('various-textobjs').lineCharacterwise(false)<CR>")
-- column
keymap({ "o", "x" }, "ij", "<cmd>lua require('various-textobjs').column()<CR>")
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
vim.keymap.set("n", "dsi", function()
  -- select inner indentation
  require("various-textobjs").indentation(true, true)

  -- plugin only switches to visual mode when textobj found
  local notOnIndentedLine = vim.fn.mode():find("V") == nil
  if notOnIndentedLine then return end

  -- dedent indentation
  vim.cmd.normal { "<", bang = true }

  -- delete surrounding lines
  local endBorderLn = vim.api.nvim_buf_get_mark(0, ">")[1] + 1
  local startBorderLn = vim.api.nvim_buf_get_mark(0, "<")[1] - 1
  vim.cmd(tostring(endBorderLn) .. " delete") -- delete end first so line index is not shifted
  vim.cmd(tostring(startBorderLn) .. " delete")
end, { desc = "Delete surrounding indentation" })

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

-- Split Join
vim.keymap.set("n", "gs", ":TSJToggle<cr>", { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader><leader>', '<cmd>lua require("harpoon.ui").nav_file(vim.v.count1)<cr>',
  { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gm', '<cmd>lua require("harpoon.ui").nav_next()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gn', '<cmd>lua require("harpoon.ui").nav_prev()<cr>', { noremap = true, silent = true })

vim.keymap.set("i", "<C-a>",
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

-- Fzf and Floaterm
local keybind_opts = { silent = true, noremap = true }

-- map("n", "<leader>f", ":call fzf#run(fzf#wrap({'source': 'fd --type file --hidden --strip-cwd-prefix --exclude $IGNORE'}))<CR>", keybind_opts)

map("n", "<leader>s", ":FloatermNew rg<CR>", keybind_opts)
map("n", "<leader>f", ":FloatermNew fzf<CR>", keybind_opts)
map("n", "<leader>;", ":FloatermNew lf<CR>", keybind_opts)
map("n", "<leader>l", ":FloatermNew lazygit<CR>", keybind_opts)
-- map("n", "<leader>'", ":FloatermNew broot<CR>", keybind_opts)
map("n", "<leader>'", ":FloatermNew --height=0.4 --width=0.6 --name=toipe --position=bottom --autoclose=2 toipe<CR>",
  keybind_opts)
-- map("n", "<C-n>", ":FloatermNew<CR>", keybind_opts)

map("n", "<leader>e", ":MurenToggle<cr>", keybind_opts)
map("v", "<leader>e", ":MurenToggle<cr>", keybind_opts)
-- map("n", "<leader>n", ":lua require('notify')._print_history()<cr>", keybind_opts)
