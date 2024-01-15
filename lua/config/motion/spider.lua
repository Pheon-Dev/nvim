local M = {}

M.config = function()
  require("spider").setup {
    skipInsignificantPunctuation = true,
    subwordMovement = true,
    customPatterns = {}, -- check Custom Movement Patterns for details
  }
  vim.keymap.set("i", "<C-f>", "<Esc>l<cmd>lua require('spider').motion('w')<CR>i")
  vim.keymap.set("i", "<C-b>", "<Esc><cmd>lua require('spider').motion('b')<CR>i")
  -- vim.keymap.set("i", "<C-u>", "<Esc>k<CR>i")
  -- vim.keymap.set("i", "<C-d>", "<Esc>j<CR>i")

  vim.keymap.set("o", "w", "<cmd>lua require('spider').motion('w')<CR>")
  -- vim.keymap.set("n", "cw", "ce", { remap = true })

  -- or the same with as one mapping without `remap = true`
  -- vim.keymap.set("n", "cw", "c<cmd>lua require('spider').motion('e')<CR>")

  vim.keymap.set(
    { "n", "o", "x" },
    "w",
    "<cmd>lua require('spider').motion('w')<CR>",
    { desc = "Spider-w" }
  )
  vim.keymap.set(
    { "n", "o", "x" },
    "e",
    "<cmd>lua require('spider').motion('e')<CR>",
    { desc = "Spider-e" }
  )
  vim.keymap.set(
    { "n", "o", "x" },
    "b",
    "<cmd>lua require('spider').motion('b')<CR>",
    { desc = "Spider-b" }
  )
end

return M
