local M = {}

M.config = function()
  local arrow = require("arrow")
  arrow.setup({
    show_icons = true,
    leader_key = "'", -- Recommended to be a single key
  })
end

return M
