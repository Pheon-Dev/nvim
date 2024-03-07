local M = {}

M.config = function()
  local before = require("before")
  before.setup({
    history_size = 12,
  })

  vim.keymap.set("n", "<C-h>", before.jump_to_last_edit, {})
  vim.keymap.set("n", "<C-l>", before.jump_to_next_edit, {})
end

return M