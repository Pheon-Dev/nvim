local M = {}

M.config = function()
  local arrow = require("arrow")
  arrow.setup({
    show_icons = true,
    leader_key = "'", -- Recommended to be a single key
  })
  vim.keymap.set("n", "<C-j>", require("arrow.persist").previous)
  vim.keymap.set("n", "<C-k>", require("arrow.persist").next)
  -- vim.keymap.set("n", "<C-s>", require("arrow.persist").toggle)
end

return M
