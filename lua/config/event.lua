local M = {}

M.default = { "BufReadPost", "BufNewFile" }

M.lazy = "VeryLazy"

M.insert = "InsertEnter"

M.enter = {
  insert = "InsertEnter",
  vim = "VimEnter",
  ui = "UIEnter",
  cmd = "CmdlineEnter",
}

return M
