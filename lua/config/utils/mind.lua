local M = {}

M.branch = "v2.2"

M.dependencies = { "nvim-lua/plenary.nvim" }

M.config = function()
  require("mind").setup()
end

return M
