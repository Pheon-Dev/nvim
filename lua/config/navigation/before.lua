local M = {}

M.config = function()
  local before = require("before")
  before.setup()
  vim.keymap.set("n", "<C-o>", before.jump_to_last_edit, { desc = "Jump to last edit" })
  vim.keymap.set("n", "<C-i>", before.jump_to_next_edit, { desc = "Jump to next edit" })
  vim.keymap.set("n", "<leader>oq", before.show_edits_in_quickfix, { desc = "Show edits in quickfix" })
end

return M
