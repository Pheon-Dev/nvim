local M = {}

M.dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" }

M.config = function()
  require("hardtime").setup()
end

return M
