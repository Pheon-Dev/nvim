local M = {}

M.config = function()
  local cliff = require("cliff")
  local opts = { noremap = true, silent = true, expr = true }
  vim.keymap.set("n", "<c-j>", cliff.go_down, opts)
  vim.keymap.set("n", "<c-k>", cliff.go_up, opts)
  vim.keymap.set("v", "<c-j>", cliff.go_down, opts)
  vim.keymap.set("v", "<c-k>", cliff.go_up, opts)
  vim.keymap.set("o", "<c-j>", cliff.go_down, opts)
  vim.keymap.set("o", "<c-k>", cliff.go_up, opts)
end

return M
