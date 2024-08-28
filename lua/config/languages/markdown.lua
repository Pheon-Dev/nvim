local M = {}

M.dependencies = {
  -- You will not need this if you installed the
  -- parsers manually
  -- Or if the parsers are in your $RUNTIMEPATH
  "nvim-treesitter/nvim-treesitter",

  "nvim-tree/nvim-web-devicons",
}

M.lazy = false

M.config = function() end

return M
