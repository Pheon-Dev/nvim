local M = {}

M.dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" }

M.config = function()
  require("hardtime").setup({
    notification = false,
    hint = false,
  })
end

return M
