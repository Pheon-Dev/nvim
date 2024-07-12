local M = {}

M.version = "*"

M.config = function()
  require("nvim-surround").setup({})
end

return M
